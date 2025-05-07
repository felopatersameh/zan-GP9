import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import '../../../../../../Core/Resources/app_fonts.dart';

class CustomTextRich extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isprice;
  final Widget? buttom;
  final Color? color;
  const CustomTextRich({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isprice,
    this.buttom, this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isButton = buttom != null;
    return isButton ? Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        texts(),
        buttom!
      ],
    ) : texts();
  }

  Padding texts() {
    return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text.rich(TextSpan(children: [
      TextSpan(
        text: "$title : ",
        style: AppTextStyles.bodyMediumBold.copyWith(color:color),
      ),
      TextSpan(
        text: subTitle.split(".00").first,
        style: AppTextStyles.bodyMediumMedium.copyWith(color:color),
      ),
      TextSpan(
        text: isprice ? "  EGP" : "",
        style: AppTextStyles.bodySmallBold.copyWith(color:color),
      ),
    ])),
  );
  }
}
