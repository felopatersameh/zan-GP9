import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';
import '../../../../../../../Core/Utils/Widget/TextField/build_text_field.dart';
import '../../../../../../../Core/Services/Payment/Strip/presentation/pages/my_card_screen.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../components/Order/order_details_container.dart';
import '../../components/Order/payment_method_row.dart';

class OrderDetailsBody extends StatelessWidget {
  final TextEditingController noteController = TextEditingController();

  OrderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      OrderDetailsContainer(),
      PaymentMethodRow(),
      DefaultTextFormField(
        text: context.local.Note,
        controller: noteController,
        type: TextInputType.text,
        maxLine: 3,
      ),
      // BuildSocialLoginButton(
      //   text: context.local.Confirm,
      //   isSpace: false,
      //   backgroundColor: AppColors.primaryColor,
      //   onPressed: () => context
      //       .read<CarpenterServiceCubit>()
      //       .createOrder(context, noteController.text),
      // )
      BottomPaymentMethod()
    ];
    return [
      SliverFillRemaining(
        hasScrollBody: false,
        fillOverscroll: true,
        child: Column(
          spacing: 24.h,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            ...List.generate(
              children.length,
              (index) => BuildAnimatedviewListBox(
                index: index,
                child: children[index],
              ),
            ),
          ],
        ),
      )
    ].styledAppPages(withPadding: true, withScroll: true);
  }
}
