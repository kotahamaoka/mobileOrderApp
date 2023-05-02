import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:mobile_order_app/pages/MenuDetailPage.dart';
import 'package:mobile_order_app/providers/selectedMenuIndexProvider.dart';

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

class MenuCard extends ConsumerWidget {
  int menuIndex;
  MenuCard({required this.menuIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: fetchData(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<dynamic>> snapshot,
        ) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              final name = snapshot.data![menuIndex]['name'];
              final price = snapshot.data![menuIndex]['price'].toString();
              final imageName = snapshot.data![menuIndex]['imageName'];
              return GestureDetector(
                  onTap: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const MenuDetailPage())),
                        ref.watch(selectedMenuIndexProvider.notifier).state =
                            menuIndex,
                      },
                  child: SizedBox(
                    width: 180.0,
                    height: 180.0,
                    child: Card(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'images/$imageName',
                              width: 180.0,
                              height: 120.0,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0, vertical: 8.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      name,
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      '\$$price',
                                      style: const TextStyle(fontSize: 16.0),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                  ));
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
