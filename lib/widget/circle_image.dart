import 'dart:typed_data';
import 'package:flutter/material.dart';

import 'image_view.dart';

class CircleImage extends StatefulWidget {
  String path;
  ImageType imageType;
  BoxFit fit;
  double radius;
  Color backgroundColor;
  Color foregroundColor;
  ImageProvider? backgroundImage;
  String placeHolderImagePath ;
  double? imageHeight;
  double? imageWidth;
  double outlineWidth;
  Color outlineColor;
  bool isBytes;
  Uint8List? imageData;

  CircleImage({
    required this.path,
    required this.imageType,
    this.fit = BoxFit.cover,
    this.radius = 50.0,
    this.backgroundColor = Colors.white,
    this.foregroundColor = Colors.white,
    this.backgroundImage,
    this.placeHolderImagePath = "assets/image/placeholder.png",
    this.imageHeight,
    this.imageWidth,
    this.outlineWidth = 0,
    this.outlineColor = Colors.transparent,
    this.isBytes = false,
    this.imageData,
  }) {
    if (imageHeight == null) {
      imageHeight = radius * 2;
    }
    if (imageWidth == null) {
      imageWidth = radius * 2;
    }
  }

  @override
  State<CircleImage> createState() => _CircleImageState();
}

class _CircleImageState extends State<CircleImage> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: widget.outlineColor,
      radius: widget.radius + widget.outlineWidth,
      child: CircleAvatar(
        backgroundColor: widget.backgroundColor,
        backgroundImage: widget.backgroundImage,
        foregroundColor: widget.foregroundColor,
        radius: widget.radius,
        child: widget.isBytes
            ? Image.memory(
                widget.imageData!,
                height: widget.imageHeight,
                width: widget.imageWidth,
                fit: widget.fit,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    widget.placeHolderImagePath,
                    height: widget.imageHeight,
                    width: widget.imageHeight,
                    fit: widget.fit,
                  );
                },
              )
            : ImageView(
                widget.path,
                widget.imageType,
                height: widget.imageHeight,
                width: widget.imageWidth,
                fit: widget.fit,
                placeHolderImagePath: widget.placeHolderImagePath,
              ),
      ),
    );
  }
}
