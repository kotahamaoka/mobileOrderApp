import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/StoreCard.dart';
import 'package:mobile_order_app/lists/storeList.dart';
import 'package:mobile_order_app/providers/selectedStoreIndexProvider.dart';

class StoreSelectPage extends ConsumerWidget {
  const StoreSelectPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStoreIndex = ref.watch(selectedStoreIndexProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Select store')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 48.0,
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                      labelText: 'Search store'),
                ),
              ),
              const SizedBox(height: 4.0),
              Image.asset(
                'images/store-map.jpeg',
                height: 240.0,
              ),
              const SizedBox(height: 24.0),
              const Text('Last used', style: TextStyle(fontSize: 24.0)),
              const SizedBox(height: 4.0),
              StoreCard(
                isReadOnly: false,
                storeIndex: selectedStoreIndex,
              ),
              const SizedBox(height: 24.0),
              const Text('Nearby', style: TextStyle(fontSize: 24.0)),
              const SizedBox(height: 4.0),
              for (int i = 0; i < storeList.length; i++) ...{
                StoreCard(
                  isReadOnly: false,
                  storeIndex: i,
                ),
                const SizedBox(
                  height: 4.0,
                )
              }
            ],
          ),
        ),
      )),
    );
  }
}
