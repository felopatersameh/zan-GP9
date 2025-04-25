import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Service/Carpenter/presentation/pages/Body/carpenter_details.dart';
import '../../../../User/presentation/Cubit/user_cubit.dart';


class CarpenterProfile extends StatelessWidget {
  const CarpenterProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return CarpenterDetails(model: context.read<UserCubit>().state.userDataModel.carpenterProfile !);
  }
}