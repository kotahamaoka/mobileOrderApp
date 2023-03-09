import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/ItemsInCart.dart';
import 'package:mobile_order_app/pages/SpecifyTimePage.dart';
import 'package:mobile_order_app/providers/isBottomSheetOpenProvider.dart';

class Cart extends ConsumerWidget {
  Cart({Key? key}) : super(key: key);

  int itemCount = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBottomSheetOpen = ref.watch(isBottomSheetOpenProvider);

    return Builder(
      builder: (context) => Container(
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey, spreadRadius: 0.25, blurRadius: 0.25)
        ]),
        child: SizedBox(
            width: double.infinity,
            height: 100.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Stack(alignment: AlignmentDirectional.topEnd, children: [
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        size: 32.0,
                      ),
                      onPressed: () {
                        isBottomSheetOpen
                            ? Navigator.pop(context)
                            : showBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return const ItemsInCart();
                                });
                        ref.watch(isBottomSheetOpenProvider.notifier).state =
                            !isBottomSheetOpen;
                      },
                    ),
                    if (itemCount > 0)
                      Container(
                        width: 16.0,
                        height: 16.0,
                        alignment: AlignmentDirectional.center,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.blue),
                        child: Text(
                          '$itemCount',
                          style: const TextStyle(color: Colors.white),
                        ),
                      )
                  ]),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const Text(
                    '\$4.00',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const Spacer(),
                  ElevatedButton(
                      onPressed: () => {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return SpecifyTimePage();
                            }))
                          },
                      child: const Text('Proceed to order'))
                ],
              ),
            )),
      ),
    );
  }
}
