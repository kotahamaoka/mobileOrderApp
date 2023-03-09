import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/ItemChangeButton.dart';
import 'package:mobile_order_app/components/ItemCounterButton.dart';
import 'package:mobile_order_app/lists/menuList.dart';
import 'package:mobile_order_app/providers/itemsInCartProvider.dart';
import 'package:mobile_order_app/providers/selectedMenuIndexProvider.dart';

class MenuInCart extends ConsumerWidget {
  const MenuInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenuIndex = ref.watch(selectedMenuIndexProvider);
    final itemsInCart = ref.watch(itemsInCartProvider);

    return Column(
      children: [
        const Divider(),
        const SizedBox(
          height: 16.0,
        ),
        Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(menuList[selectedMenuIndex].name,
                        style: const TextStyle(fontSize: 16.0)),
                    const SizedBox(
                      height: 8.0,
                    ),
                    const Text('Pickles', style: TextStyle(fontSize: 12.0))
                  ],
                ),
                const Spacer(),
                const ItemChangeButton()
              ],
            ),
            const SizedBox(),
            Row()
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          children: [
            Text(
              '\$${menuList[selectedMenuIndex].price}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const Spacer(),
            const ItemCounterButton()
          ],
        ),
      ],
    );
  }
}
