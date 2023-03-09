import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/lists/storeList.dart';
import 'package:mobile_order_app/pages/MenuDetailPage.dart';
import 'package:mobile_order_app/providers/isStoreSelectedProvider.dart';
import 'package:mobile_order_app/providers/selectedStoreIndexProvider.dart';

class StoreCard extends ConsumerWidget {
  bool isReadOnly;
  int storeIndex;

  StoreCard({Key? key, required this.isReadOnly, required this.storeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => {
        isReadOnly
            ? () {}
            : Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MenuDetailPage())),
        ref.watch(isStoreSelectedProvider.notifier).state = true,
        ref.watch(selectedStoreIndexProvider.notifier).state = storeIndex
      },
      child: SizedBox(
        height: 136.0,
        child: Card(
          child: Row(children: [
            Image.asset(
              'images/${storeList[storeIndex].imageName}',
              width: 136.0,
              height: 136.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(storeList[storeIndex].isOpen ? 'Open' : 'Closed',
                          style: const TextStyle(fontSize: 12.0)),
                      const SizedBox(
                        width: 120.0,
                      ),
                      Text('${storeList[storeIndex].distance}km',
                          style: const TextStyle(fontSize: 12.0))
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Text(
                    storeList[storeIndex].name,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    storeList[storeIndex].address,
                    style: const TextStyle(fontSize: 12.0),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
