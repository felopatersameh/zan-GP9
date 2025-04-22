import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../Core/Resources/app_fonts.dart';
import '../../../../../Core/Utils/Widget/Images/build_image.dart';
import '../../../../../Core/Utils/Widget/loading_animation.dart';

class CustomBuildButtonApp extends StatelessWidget {
  final bool? loading;
  final String? imagePath;
  final String? imagePathSvg;
  final String text;
  final TextStyle? textStyle;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final bool isSpace;
  final Size? size;
  final double? radius;
  final Color? radiusColor;
  final double? elevation;

  const CustomBuildButtonApp({
    super.key,
    this.imagePath,
    required this.text,
    required this.backgroundColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.imagePathSvg,
    this.isSpace = true,
    this.size,
    this.textStyle,
    this.radius,
    this.loading = false, this.radiusColor, this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(size ?? Size(294.w, 48.h)),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        elevation: WidgetStatePropertyAll(elevation??5),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(radius ?? 81.r),
              side: BorderSide(color:radiusColor?? Color(0xffEFEFEF))),
        ),
      ),
      onPressed: onPressed,
      child: loading!
          ? CustomLoadingAnimation()
          : Row(
              mainAxisAlignment:
                  isSpace ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                isSpace ? 22.horizontalSpace : SizedBox(),
                isSpace
                    ? BuildImageAssets(
                        png: imagePath,
                        svg: imagePathSvg,
                        height: 24.h,
                        width: 24.w,
                        widgetNull: isSpace
                            ? SizedBox(height: 24.h, width: 24.w)
                            : SizedBox(),
                      )
                    : SizedBox(),
                isSpace ? 37.horizontalSpace : SizedBox(),
                Expanded(
                  child: Align(
                      child: Text(
                    text,
                    maxLines: text.length,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: textStyle ??
                        AppTextStyles.h7Medium.copyWith(color: textColor),
                  )),
                ),
              ],
            ),
    );
  }
}
