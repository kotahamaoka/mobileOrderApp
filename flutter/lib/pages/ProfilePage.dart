import 'package:flutter/material.dart';
import 'package:mobile_order_app/pages/OrderHistoryPage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taro Tanaka')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Basic information',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Member information',
                  style: TextStyle(fontSize: 16.0),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Credit card information',
                  style: TextStyle(fontSize: 16.0),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Order history',
                  style: TextStyle(fontSize: 16.0),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const OrderHistoryPage();
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
