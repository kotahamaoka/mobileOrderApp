import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/StoreCard.dart';
import 'package:mobile_order_app/pages/TopPage.dart';
import 'package:mobile_order_app/providers/itemCountProvider.dart';
import 'package:mobile_order_app/providers/selectedStoreIndexProvider.dart';
import 'package:mobile_order_app/providers/specifiedTimeProvider.dart';

class OrderConfirmationPage extends ConsumerWidget {
  const OrderConfirmationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCount = ref.watch(itemCountProvider);
    final specifiedTime = ref.watch(specifiedTimeProvider);
    final selectedStoreIndex = ref.watch(selectedStoreIndexProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Order confirmed')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Order ID: qwerty123456',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 24.0),
            Text('Time: $specifiedTime',
                style: const TextStyle(fontSize: 24.0)),
            const SizedBox(height: 24.0),
            const Text('Store', style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 12.0),
            StoreCard(
              isReadOnly: true,
              storeIndex: selectedStoreIndex,
            ),
            const SizedBox(height: 32.0),
            const Text('Items', style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 12.0),
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
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('\$4.00'),
                      Text(
                        '$itemCount',
                        style: const TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const Text('Total \$4.00', style: TextStyle(fontSize: 24.0)),
            const SizedBox(height: 24.0),
            const Text('Payment: PoyPal', style: TextStyle(fontSize: 24.0)),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => TopPage()))
                        },
                    child: const Text('Close')))
          ],
        ),
      )),
    );
  }
}
