import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/Models/carpenters_model.dart';
import '../../../../../../../Core/Utils/Extensions/localizations_extension.dart';
import '../../../../../../../Core/Utils/Extensions/widget_extension.dart';
import '../../Cubit/CarpenterService/carpenter_service_cubit.dart';
import '../../components/Carpenter/view_all_carpenter_information_screen.dart';
import '../../components/build_button_carpenter_service.dart';
import 'confirmation_order.dart';

class CarpenterDetails extends StatelessWidget {
  final CarpentersModel model;

  const CarpenterDetails({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final local = context.local;
    
    return [
      ViewAllCarpenterInformationScreen(model: model,local: local),
      !context.isProfileCarpenter(model)
          ? BuildButtonCarpenterService(
              onPressed: () {
                context.read<CarpenterServiceCubit>().choseCarpenter(model);
                context
                    .read<CarpenterServiceCubit>()
                    .changeScreen(OrderDetailsBody());
              },
              text: local.Confirm,
            )
          : SliverToBoxAdapter(child: SizedBox()),
    ].styledAppPages(withScroll: true, withPadding: true);
  }

  


  
}
