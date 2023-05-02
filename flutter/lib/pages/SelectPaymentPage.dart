import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/PaymentCard.dart';
import 'package:mobile_order_app/lists/paymentList.dart';
import 'package:mobile_order_app/pages/OrderConfirmationPage.dart';

class SelectPaymentPage extends ConsumerWidget {
  const SelectPaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select payment'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentCard(
                      paymentIndex: 0,
                    ),
                    PaymentCard(
                      paymentIndex: 1,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentCard(
                      paymentIndex: 2,
                    ),
                    PaymentCard(
                      paymentIndex: 3,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentCard(
                      paymentIndex: 4,
                    ),
                    PaymentCard(
                      paymentIndex: 5,
                    )
                  ],
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text('Cancel'),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const OrderConfirmationPage()));
                    },
                    child: const Text('Confirm'),
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
