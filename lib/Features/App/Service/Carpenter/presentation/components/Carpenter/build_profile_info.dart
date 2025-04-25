import 'package:flutter/material.dart';
import '../../../../../../../generated/l10n.dart';

import '../../../data/Models/carpenters_model.dart';

class BuildProfileInfo extends StatelessWidget {
  const BuildProfileInfo({
    super.key,
    required this.model,
    required this.local,
  });

  final CarpentersModel model;
  final S local;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildProfileInfo(value: model.completedServices.toString(), title: local.completed_services, color: Colors.blue),
        _buildProfileInfo(value: model.hourlyRate, title: local.hourly_rate, color: Colors.orange),
        _buildProfileInfo(value: model.yearsExperience.toString(), title: local.years_experience, color: Colors.green),
      ],
    );
  }

  Column _buildProfileInfo(
      {required String value,
      required String title,
      required Color color,}
  ) {
    return Column(
    children: [
      Text(
        value,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
      SizedBox(height: 4),
      Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black,
        ),
      ),
    ],
  );
  }
}
