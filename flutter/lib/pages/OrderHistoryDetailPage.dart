import 'package:flutter/material.dart';

class OrderHistoryDetailPage extends StatelessWidget {
  const OrderHistoryDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('2022/09/03')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Card(
                child: ListTile(
                  title: Text('Order ID'),
                  subtitle: Text('qwerty123456'),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text('Payment'),
                  subtitle: Text('PoyPal'),
                ),
              ),
              const Card(
                child: ListTile(
                  title: Text('Store'),
                  subtitle: Text('Kawasaki No.1'),
                ),
              ),
              const SizedBox(
                height: 24.0,
              ),
              const Text(
                'Items',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Card(
                child: ListTile(
                  title: Text('Vegetable sandwich'),
                  subtitle: Text('Pickles'),
                  trailing: Text('1'),
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              const Text(
                'Total \$4.00',
                style: TextStyle(fontSize: 24.0),
              ),
              const Spacer(),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Order again')))
            ],
          ),
        ),
      ),
    );
  }
}
