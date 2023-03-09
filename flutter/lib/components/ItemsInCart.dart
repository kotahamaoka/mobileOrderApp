import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobile_order_app/components/MenuInCart.dart';

class ItemsInCart extends ConsumerWidget {
  const ItemsInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: const [
                Text(
                  'Items in cart',
                  style: TextStyle(fontSize: 16.0),
                ),
                Spacer(),
                Icon(
                  Icons.delete_outlined,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text('Remove all',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                    ))
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            const MenuInCart(),
          ]),
        );
      },
    );
  }
}
