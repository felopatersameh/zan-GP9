import 'package:flutter/material.dart';

import '../../../../../../Core/Utils/Enums/numbers_of_cross_axis_count.dart';
import '../../../../../../Core/Utils/Widget/Lists/custom_sliver_grid_builder.dart';
import 'card_carpenter.dart';

class BuildCardCarpenter extends StatelessWidget {
  const BuildCardCarpenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BuildCustomGridBuilder(
      numbersOfCrossAxisCount: NumbersOfCrossAxisCount.large,
      builder: CardCarpenter(),
    );
  }
}
