import 'package:flutter/material.dart';

class CustomLoadingWidget extends StatelessWidget {
  final Color? color;
  final double? size;
  final double strokeWidth;

  const CustomLoadingWidget({
    this.color,
    this.size,
    this.strokeWidth = 4,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation(color),
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}
