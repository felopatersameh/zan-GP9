import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../Core/Resources/app_colors.dart';
import '../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../User/presentation/Cubit/user_cubit.dart';
import '../../data/Models/get_all_services_model.dart';
import '../../../../../../../Config/app_config.dart';

import '../../../../../../../Core/Resources/app_fonts.dart';
import '../../../../../../../Core/Resources/app_icons.dart';
import '../Cubit/CarpenterService/carpenter_service_cubit.dart';
import 'build_list_services_carpenters.dart';
import 'person_counter_widget.dart';

class OrderDetailsContainer extends StatefulWidget {
  const OrderDetailsContainer({super.key});

  @override
  State<OrderDetailsContainer> createState() => _OrderDetailsContainerState();
}
double total = 252;

class _OrderDetailsContainerState extends State<OrderDetailsContainer> {
  GetAllServicesModel? service;
  double discount = 0;

  @override
  void initState() {
    service = context
        .read<CarpenterServiceCubit>()
        .state
        .services!
        .where((id) =>
            id.id ==
            context.read<CarpenterServiceCubit>().state.selectedService)
        .first;
    discount = (double.parse(service!.discountPercentage) / 100) *
        double.parse(service!.basePrice);

    total = (252.00 + double.parse(service!.basePrice)) - discount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    return Container(
        padding: AppConfig.customPadding,
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 5,
                blurRadius: 7,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Column(
          spacing: 8.h,
          children: [
            Icon(Icons.location_on, color: AppColors.success,),
            Text(context.read<UserCubit>().defaultAddress),
            16.verticalSpace,
            PersonCounterWidget(),
            16.verticalSpace,
            Row(
              children: [
                Container(
                  width: 140.w,
                  height: 130.h,
                  margin: EdgeInsets.all(5).r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: PastelColorGenerator.getColorByIndex(1),
                  ),
                  child: Center(
                    child: AppIcons.carpenter,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      service?.name ?? "",
                      style: AppTextStyles.bodyLargeBold,
                    ),
                  ),
                )
              ],
            ),
            buildDivider(),
            _buildDetailRow(local.WorkingPrice, '(${local.hour})', '252 EGP'),
            buildDivider(),
            _buildDetailRow(
                local.ServiceCharge, '', '${service?.basePrice} EGP'),
            buildDivider(),
            _buildPromoCodeRow(local.Discount, '0000', '-$discount EGP'),
            buildDivider(),
            _buildDetailRow(
                local.TotalAmount, '(${local.EstimatedCost})', '$total EGP'),
            24.verticalSpace,
          ],
        ));
  }

  Divider buildDivider() {
    return Divider(
        // endIndent: 20,
        // indent: 20,
        );
  }

  Widget _buildDetailRow(String label, String description, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          children: [
            Text(
              label,
              style: AppTextStyles.bodyLargeMedium,
            ),
            8.horizontalSpace,
            Text(
              description,
              style: AppTextStyles.bodyXtraSmallMedium,
            )
          ],
        ),
        Text(
          value,
          style: AppTextStyles.bodyMediumMedium,
        ),
      ],
    );
  }

  Widget _buildPromoCodeRow(String label, String code, String discount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyLargeMedium,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Text(
                code,
                style: const TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.close, size: 12, color: Colors.blue),
            ],
          ),
        ),
        Text(discount,  style: AppTextStyles.bodyMediumMedium.copyWith(color: Colors.green)),
      ],
    );
  }
}
