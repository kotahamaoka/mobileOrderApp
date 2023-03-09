import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/ItemChangeButton.dart';
import 'package:mobile_order_app/components/ItemCounterButton.dart';
import 'package:mobile_order_app/components/StoreCard.dart';
import 'package:mobile_order_app/pages/SelectPaymentPage.dart';
import 'package:mobile_order_app/providers/selectedStoreIndexProvider.dart';
import 'package:mobile_order_app/providers/specifiedTimeProvider.dart';

class OrderPreviewPage extends ConsumerWidget {
  OrderPreviewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specifiedTime = ref.watch(specifiedTimeProvider);
    final selectedStoreIndex = ref.watch(selectedStoreIndexProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Order preview')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Store',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            StoreCard(
              isReadOnly: true,
              storeIndex: selectedStoreIndex,
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              'Time',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Text(specifiedTime),
            const SizedBox(
              height: 24.0,
            ),
            const Text(
              'Items',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 16.0),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Vegetable sandwich'),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Pickles',
                            style: TextStyle(fontSize: 12.0),
                          )
                        ],
                      ),
                      const ItemChangeButton()
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [Text('\$4.00'), ItemCounterButton()],
                  ),
                ]),
              ),
            ),
            const Spacer(),
            const Text(
              'Total \$4.00',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    child: const Text('Cancel'),
                    onPressed: () => {},
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () => {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const SelectPaymentPage()))
                            },
                        child: const Text('Select Payment')))
              ],
            )
          ],
        ),
      )),
    );
  }
}
