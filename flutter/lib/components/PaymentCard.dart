import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/lists/paymentList.dart';

class PaymentCard extends ConsumerWidget {
  int cardIndex;
  bool selected = false;

  PaymentCard({Key? key, required this.cardIndex}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        selected = !selected;
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
                  'images/${paymentList[cardIndex].imageName}',
                  width: 180.0,
                  height: 80.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(paymentList[cardIndex].name),
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
