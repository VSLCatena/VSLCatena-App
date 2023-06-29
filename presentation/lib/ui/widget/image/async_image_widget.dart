import 'dart:io';

import 'package:domain/general/model/async_image.dart';
import 'package:flutter/material.dart';

class AsyncImageWidget extends StatelessWidget {
  final AsyncImage? asyncImage;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;

  const AsyncImageWidget(
    this.asyncImage, {
    Key? key,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final placeholder = this.placeholder;

    return FutureBuilder<File?>(
      future: asyncImage?.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Image.file(
            snapshot.data!,
            width: width,
            height: height,
            fit: fit,
          );
        } else if (placeholder != null) {
          return placeholder;
        } else {
          return Image.asset(
            'assets/logo.png',
            package: 'presentation',
            width: width,
            height: height,
            fit: fit,
          );
        }
      },
    );
  }
}
