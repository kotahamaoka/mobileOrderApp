import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/ItemChangeButton.dart';
import 'package:mobile_order_app/components/ItemCounterButton.dart';
import 'package:mobile_order_app/providers/selectedMenuIndexProvider.dart';
import 'package:mobile_order_app/providers/selectedToppingIndexProvider.dart';

Future<List<dynamic>> fetchData() async {
  final dio = Dio();
  final response = await dio.get("http://localhost:3000/menu");
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;
    return responseData;
  } else {
    throw Exception('Failed to load data');
  }
}

class MenuInCart extends ConsumerWidget {
  const MenuInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedMenuIndex = ref.watch(selectedMenuIndexProvider);
    final selectedToppingIndex = ref.watch(selectedToppingIndexProvider);

    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              final menuName = snapshot.data![selectedMenuIndex]['name'];
              final menuPrice = snapshot.data![selectedMenuIndex]['price'];
              final toppingName = snapshot.data![selectedToppingIndex]['name'];
              return Column(
                children: [
                  const Divider(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(menuName,
                                  style: const TextStyle(fontSize: 16.0)),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(toppingName,
                                  style: const TextStyle(fontSize: 12.0))
                            ],
                          ),
                          const Spacer(),
                          const ItemChangeButton()
                        ],
                      ),
                      const SizedBox(),
                      Row()
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    children: [
                      Text(
                        '\$$menuPrice',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const Spacer(),
                      const ItemCounterButton()
                    ],
                  ),
                ],
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
