import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AppImage extends StatelessWidget {
  const AppImage({
    Key? key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.borderRadius,
  }) : super(key: key);

  final String imageUrl;
  final double width;
  final double height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: CachedNetworkImage(
        fit: BoxFit.fill,
        width: width,
        height: height,
        imageUrl: imageUrl,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return

            Image.asset(
            "assets/images/loading.gif",
            fit: BoxFit.fill,
          );


        },
        errorWidget: (context, url, error) => Padding(
          padding: EdgeInsets.all(15.sp),
          child: const Icon(
            Icons.error,
            // color: Colors.red,
          ),
        ),
        // const SizedBox(
        //     width: double.infinity,
        //     child: Icon(Icons.error)),
      ),
    );
  }
}
