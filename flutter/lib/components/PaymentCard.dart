import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/lists/paymentList.dart';
import 'package:mobile_order_app/providers/selectedPaymentProvider.dart';
import 'package:mobile_order_app/providers/isPaymentSelectedProvider.dart';

class PaymentCard extends ConsumerWidget {
  final int paymentIndex;
  const PaymentCard({Key? key, required this.paymentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool selected = ref.watch(isPaymentSelectedProvider);
    return GestureDetector(
      onTap: () {
        ref.watch(isPaymentSelectedProvider.notifier).state = !selected;
        ref.watch(selectedPaymentIndexProvider.notifier).state = paymentIndex;
      },
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        SizedBox(
          width: 180.0,
          height: 124,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'images/${paymentList[paymentIndex].imageName}',
                  width: 180.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(paymentList[paymentIndex].name),
                )
              ],
            ),
          ),
        ),
        if (selected == true) const Icon(Icons.check_circle)
      ]),
    );
  }
}
