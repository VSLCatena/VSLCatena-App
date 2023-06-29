import 'dart:developer';
import 'dart:io';
import 'package:mutex/mutex.dart';

import 'package:domain/general/model/async_image.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class AsyncImageImpl implements AsyncImage {
  final String savePath;
  final String url;
  final Mutex _mutex = Mutex();
  _AsyncImageState _cachedState = const AsyncImageNotLoaded();

  AsyncImageImpl(this.savePath, this.url);

  @override
  Future<File?> get() async {
    return _mutex.protect(() async {
      try {
        switch (_cachedState) {
          case _AsyncImageSuccess():
            return (_cachedState as _AsyncImageSuccess).file;
          case _AsyncImageNotExists():
            return null;
          default:
            break;
        }

        return _fetchFile();
      } on FirebaseException catch (e) {
        if (e.code == 'object-not-found') {
          // TODO uncomment, temporary for debug purposes
          // _cachedState = const _AsyncImageNotExists();
          return null;
        }

        log('Error getting file from Firebase Storage', error: e);
        _cachedState = _AsyncImageError(e.toString());
        rethrow;
      } catch (e) {
        log('Error getting file from Firebase Storage', error: e);
        _cachedState = _AsyncImageError(e.toString());
        rethrow;
      }
    });
  }

  Future<File> _fetchFile() async {
    final saveDirectory = await getApplicationDocumentsDirectory();
    final fileLocation = File('${saveDirectory.path}/$savePath');
    fileLocation.parent.create(recursive: true);

    if (await fileLocation.exists()) {
      // TODO do something with cache timeout, we don't want to store a file forever, what if it changes?
      return fileLocation;
    }
    await FirebaseStorage.instance.ref().child(url).writeToFile(fileLocation);

    _cachedState = _AsyncImageSuccess(fileLocation);
    return fileLocation;
  }
}

sealed class _AsyncImageState {
  const _AsyncImageState();
}

class AsyncImageNotLoaded extends _AsyncImageState {
  const AsyncImageNotLoaded();
}

class _AsyncImageSuccess extends _AsyncImageState {
  final File file;

  _AsyncImageSuccess(this.file);
}

class _AsyncImageError extends _AsyncImageState {
  final String message;

  _AsyncImageError(this.message);
}

class _AsyncImageNotExists extends _AsyncImageState {
  const _AsyncImageNotExists();
}
