import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Resources/app_fonts.dart';

class CustomDropdownButtonFormField<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>>? items;
  final void Function(T?)? onChanged;
  final String? labelText;
  final InputDecoration? decoration;

  const CustomDropdownButtonFormField({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.labelText,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 294.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text(
                  labelText??'',
                  style: AppTextStyles.bodyMediumBold,
                ),
                10.verticalSpace,
          DropdownButtonFormField<T>(
            value: value,
            items: items,
            onChanged: onChanged,
            decoration: decoration ??
                InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(81.r)),
                  ),
                  // labelText: labelText,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(81.r)),
                  ),
                ),
          ),
           16.verticalSpace,
        ],
      ),
    );
  }
}
