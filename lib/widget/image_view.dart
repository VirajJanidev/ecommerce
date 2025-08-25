import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum ImageType { asset, file, url }

class ImageView extends StatelessWidget {
  String path;
  ImageType type;
  String placeHolderImagePath;
  double? height, width;
  BoxFit? fit;
  Color? color;
  bool isGrayscale;

  ImageView(
      this.path,
      this.type, {
        Key? key,
        this.placeHolderImagePath = 'assets/icon/placeholder.png',
        this.height,
        this.width,
        this.isGrayscale = false,
        this.fit,
        this.color,
      }) : super(key: key) {
    if (type == ImageType.asset && !path.startsWith('assets/')) {
      if (!path.startsWith('images/')) {
        path = 'assets/images/$path';
      } else {
        path = 'assets/$path';
      }
    }
    if (placeHolderImagePath.isEmpty) {
      placeHolderImagePath = 'assets/image/placeholder.png';
    }
    if (!placeHolderImagePath.startsWith('assets/')) {
      if (!placeHolderImagePath.startsWith('image/')) {
        placeHolderImagePath = 'assets/image/$placeHolderImagePath';
      } else {
        placeHolderImagePath = 'assets/$placeHolderImagePath';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return showImage(path, type, height, width, placeHolderImagePath, fit);
  }

    Widget showImage(String path, ImageType type, double? height, double? width,
        String placeHolderImagePath, BoxFit? fit) {
      Widget imageWidget;

    if (path.isNotEmpty) {
      switch (type) {
        case ImageType.asset:
          imageWidget = Image.asset(
            path,
            height: height,
            width: width,
            fit: fit,
          );
          break;
        case ImageType.file:
          File f = File(path);
          imageWidget = f.existsSync()
              ? Image.file(f, height: height, width: width, fit: fit)
              : _placeHolder(
              placeHolderImagePath: placeHolderImagePath,
              height: height,
              width: width,
              fit: fit);
          break;
        case ImageType.url:
          imageWidget = CachedNetworkImage(
            imageUrl: "https://dhunobeats.com/storage/app/$path",
            placeholder: (context, url) => _placeHolder(
              placeHolderImagePath: placeHolderImagePath,
              height: height,
              width: width,
              fit: fit,
            ),
            errorWidget: (context, url, error) => _placeHolder(
              placeHolderImagePath: placeHolderImagePath,
              height: height,
              width: width,
              fit: fit,
            ),
            height: height,
            width: width,
            fit: fit,
            httpHeaders: {
              'User-Agent': 'Mozilla/5.0',
              'Accept': 'image/*',
              'Connection': 'keep-alive',
            },
          );
          break;
      }
    } else {
      return _placeHolder(
        placeHolderImagePath: placeHolderImagePath,
        height: height,
        width: width,
        fit: fit,
      );
    }

    // **Apply grayscale effect conditionally**
    return isGrayscale
        ? ColorFiltered(
      colorFilter: const ColorFilter.mode(
        Colors.grey,
        BlendMode.saturation,
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: imageWidget,
      ),
    )
        : SizedBox(
      height: height,
      width: width,
      child: imageWidget,
    );
  }

  Widget _placeHolder({
    required String placeHolderImagePath,
    double? height,
    double? width,
    BoxFit? fit,
  }) {
    return Image.asset(
      placeHolderImagePath,
      height: height,
      width: width,
      fit: fit,
    );
  }
}
