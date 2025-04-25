import 'package:flutter/material.dart';
import 'build_contauner_product_cart.dart';
import '../../../../../../Core/Utils/Widget/Animations/build_animatedview_list_box.dart';

import '../../data/Model/cart_item_model.dart';
import '../../../../../../generated/l10n.dart';

class BodyPageCartItems extends StatelessWidget {
  const BodyPageCartItems(
      {super.key, required this.cartItems, required this.local});

  final List<CartItemModel>? cartItems;

  final S local;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...List.generate(
        cartItems?.length ?? 0,
        (index) => BuildAnimatedviewListBox(
          index: index,
          child:
              BuildContaunerProductCart(items: cartItems?[index], local: local),
        ),
      ),
    ]);
  }
}
