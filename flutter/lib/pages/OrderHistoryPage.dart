import 'package:flutter/material.dart';
import 'package:mobile_order_app/pages/OrderHistoryDetailPage.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Order history')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '2022/09/03',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Vegetable sandwich',
                  style: TextStyle(fontSize: 16.0),
                ),
                subtitle: const Text('Total \$4.00'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const OrderHistoryDetailPage();
                  }))
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
