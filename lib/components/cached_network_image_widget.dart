import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class CachedNetworkImageWidget extends StatefulWidget {
  final String image;
  var width;
  var height;
  final bool cover;

  CachedNetworkImageWidget({
    required this.image,
    this.height,
    this.width,
    required this.cover,
  });

  @override
  State<CachedNetworkImageWidget> createState() =>
      _CachedNetworkImageWidgetState();
}

class _CachedNetworkImageWidgetState extends State<CachedNetworkImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.toDouble(),
      height: widget.height.toDouble(),
      child: CachedNetworkImage(
        imageUrl: widget.image,
        fit: widget.cover == true ? BoxFit.cover : null,
        alignment: Alignment.center,
        placeholder: (BuildContext context, _) {
          return Container(
            width: 50,
            color: Colors.transparent,
            child: Shimmer.fromColors(
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                color: Colors.grey,
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              direction: ShimmerDirection.ltr,
            ),
          );
        },
        errorWidget: (
          BuildContext context,
          _,
          dynamic error,
        ) {
          return Container(
            color: Color(0xffF7F7F7),
            child: Icon(
              Icons.error_outline,
              size: 50,
            ),
          );
        },
      ),
    );
  }
}
