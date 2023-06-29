import 'package:domain/general/model/async_image.dart';
import 'package:flutter/material.dart';
import 'package:presentation/ui/widget/image/async_image_widget.dart';

class ProfileImage extends StatelessWidget {
  final AsyncImage? image;
  final double size;
  final Widget? placeholder;

  const ProfileImage(
      {Key? key, required this.image, required this.size, this.placeholder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Container(
          padding: EdgeInsets.all(size / 2 * 0.07),
          child: ClipOval(
            child: AsyncImageWidget(
              image,
              width: size,
              height: size,
              fit: BoxFit.cover,
              placeholder: placeholder,
            ),
          ),
        ),
      ),
    );
  }
}
