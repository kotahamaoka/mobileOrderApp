import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/providers/itemCountProvider.dart';

class ItemCounterButton extends ConsumerWidget {
  const ItemCounterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(itemCountProvider);

    return Row(
      children: [
        GestureDetector(
          child: const Icon(Icons.do_not_disturb_on_outlined),
          onTap: () {
            if (itemCount > 0) {
              ref.watch(itemCountProvider.notifier).state--;
            }
          },
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          '$itemCount',
          style: const TextStyle(fontSize: 24.0),
        ),
        const SizedBox(
          width: 8.0,
        ),
        GestureDetector(
            child: const Icon(Icons.add_circle_outline),
            onTap: () {
              if (itemCount < 20) {
                ref.watch(itemCountProvider.notifier).state++;
              }
            }),
      ],
    );
  }
}
