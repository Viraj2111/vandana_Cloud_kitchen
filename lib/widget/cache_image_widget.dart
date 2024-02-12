import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    required this.imagePathOrUrl,
    this.isProfileThumbNail,
    this.fit,
    this.radius,
    this.cacheKey,
  });
  final String? imagePathOrUrl;
  final bool? isProfileThumbNail;
  final BoxFit? fit;
  final double? radius;
  final String? cacheKey;

  @override
  Widget build(BuildContext context) {
    if (imagePathOrUrl == null) {
      return const SizedBox.shrink();
    }

    if (imagePathOrUrl!.startsWith('http')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: CachedNetworkImage(
          cacheKey: cacheKey,
          useOldImageOnUrlChange: true,
          imageUrl: imagePathOrUrl!,
          fit: fit ?? BoxFit.cover,
          // fadeOutDuration: Duration.zero,
          fadeInCurve: Curves.linear,
          memCacheHeight: isProfileThumbNail != null ? 80 : null,
          maxHeightDiskCache: isProfileThumbNail != null ? 80 : null,
          errorWidget: (context, url, error) => const Icon(Icons.error),
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
        ),
      );
    } else {
      return Image.file(
        File(imagePathOrUrl!),
        fit: BoxFit.cover,
      );
    }
  }
}