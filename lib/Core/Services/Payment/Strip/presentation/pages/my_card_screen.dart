import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../Resources/app_colors.dart';
import '../../../../../Utils/Extensions/localizations_extension.dart';
import '../../../../../../Features/Global/Authentication/presentation/components/build_social_login_button.dart';

import '../../../../../../Features/client/Service/Carpenter/presentation/components/order_details_container.dart';
import '../../../../ServiceLocator/service_locator.dart';
import '../../data/data_sources/dio.dart';
import '../../domain/entities/payment_input_entities.dart';
import '../../domain/use_cases/payment_use_case.dart';
import '../manager/StripPayment/payment_cubit.dart';

class BottomPaymentMethod extends StatelessWidget {
  const BottomPaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DioHelperPayment.init();
    return BlocProvider(
      create: (context) => PaymentCubit(sl<PaymentStripUseCase>()),
      child: BlocBuilder<PaymentCubit, PaymentState>(
        builder: (context, state) {
          return BuildSocialLoginButton(
            text: context.local.Confirm,
            onPressed: () async {
              final totalStrip = total * 100;
              PaymentInputEntities item = PaymentInputEntities(
                  totalStrip.toString().split(".").first,
                  'USD',
                  'cus_QcyqCzPudigHq1');
              await context
                  .read<PaymentCubit>()
                  .makeStripPaymentStrip(paymentInputEntities: item);
            },
            backgroundColor: AppColors.primaryColor,
            isSpace: false,
            loading: state is Loading,
          );
        },
      ),
    );
  }
}
