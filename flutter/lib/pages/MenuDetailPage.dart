import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/ItemCounterButton.dart';
import 'package:mobile_order_app/pages/SpecifyTimePage.dart';

import 'package:mobile_order_app/pages/StoreSelectPage.dart';
import 'package:mobile_order_app/pages/TopPage.dart';
import 'package:mobile_order_app/components/ToppingCard.dart';
import 'package:mobile_order_app/providers/isStoreSelectedProvider.dart';
import 'package:mobile_order_app/providers/selectedMenuIndexProvider.dart';
import 'package:mobile_order_app/providers/selectedToppingIndexProvider.dart';

Future<List<dynamic>> fetchData() async {
  final dio = Dio();
  final response = await dio.get('http://localhost:3000/menu');
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;
    return responseData;
  } else {
    throw Exception('Failed to load data');
  }
}

Future<List<dynamic>> fetchToppingData() async {
  final dio = Dio();
  final response = await dio.get('http://localhost:3000/topping');
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;
    return responseData;
  } else {
    throw Exception('Failed to load data');
  }
}

class MenuDetailPage extends ConsumerWidget {
  const MenuDetailPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStoreSelected = ref.watch(isStoreSelectedProvider);
    final selectedMenuIndex = ref.watch(selectedMenuIndexProvider);
    final selectedToppingIndex = ref.watch(selectedToppingIndexProvider);

    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final id = snapshot.data![selectedMenuIndex]['id'];
              final name = snapshot.data![selectedMenuIndex]['name'];
              final price = snapshot.data![selectedMenuIndex]['price'];
              final imageName = snapshot.data![selectedMenuIndex]['imageName'];
              final description =
                  snapshot.data![selectedMenuIndex]['description'];
              return Scaffold(
                appBar: AppBar(title: Text(name)),
                body: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  child: Column(children: [
                    Image.asset(
                      'images/$imageName',
                      width: 360.0,
                      height: 240.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    isStoreSelected
                        ? Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Select Toppings',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        ToppingCard(toppingIndex: 0),
                                        ToppingCard(toppingIndex: 1),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        ToppingCard(toppingIndex: 2),
                                        ToppingCard(toppingIndex: 3),
                                      ],
                                    )
                                  ],
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 132.0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('\$$price',
                                              style: const TextStyle(
                                                  fontSize: 24.0)),
                                          const ItemCounterButton()
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 24.0,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: OutlinedButton(
                                              onPressed: () => {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SpecifyTimePage()))
                                              },
                                              child: const Text(
                                                  'Proceed to order'),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 8.0,
                                          ),
                                          Expanded(
                                            child: ElevatedButton(
                                              onPressed: () => {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            TopPage())),
                                              },
                                              child: const Text('Add to cart'),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        : Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '\$$price',
                                  style: const TextStyle(fontSize: 24.0),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    child: const Text('Order this item'),
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const StoreSelectPage()));
                                    },
                                  ),
                                )
                              ],
                            ),
                          )
                  ]),
                )),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
