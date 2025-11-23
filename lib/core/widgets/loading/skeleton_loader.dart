import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../theme/app_theme.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final BoxShape shape;

  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = AppTheme.radiusMd,
    this.shape = BoxShape.rectangle,
  });

  factory SkeletonLoader.circle({required double size}) {
    return SkeletonLoader(
      width: size,
      height: size,
      shape: BoxShape.circle,
    );
  }

  factory SkeletonLoader.text({double width = double.infinity, double height = 16}) {
    return SkeletonLoader(
      width: width,
      height: height,
      borderRadius: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: shape,
          borderRadius: shape == BoxShape.rectangle
              ? BorderRadius.circular(borderRadius)
              : null,
        ),
      ),
    );
  }
}
