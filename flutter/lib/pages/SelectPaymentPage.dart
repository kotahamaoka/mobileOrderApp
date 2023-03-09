import 'package:flutter/material.dart';
import 'package:mobile_order_app/components/PaymentCard.dart';
import 'package:mobile_order_app/lists/paymentList.dart';
import 'package:mobile_order_app/pages/OrderConfirmationPage.dart';

class SelectPaymentPage extends StatefulWidget {
  const SelectPaymentPage({Key? key}) : super(key: key);

  @override
  _SelectPaymentPageState createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  @override
  Widget build(BuildContext context) {
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
                      cardIndex: 0,
                    ),
                    PaymentCard(
                      cardIndex: 1,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentCard(
                      cardIndex: 2,
                    ),
                    PaymentCard(
                      cardIndex: 3,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PaymentCard(
                      cardIndex: 4,
                    ),
                    PaymentCard(
                      cardIndex: 5,
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
