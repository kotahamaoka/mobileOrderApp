import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/providers/isToppingSelectedProvider.dart';
import 'package:mobile_order_app/providers/selectedToppingIndexProvider.dart';

Future<List<dynamic>> fetchData() async {
  final dio = Dio();
  final response = await dio.get("http://localhost:3000/topping");
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;
    return responseData;
  } else {
    throw Exception('Failed to load data');
  }
}

class ToppingCard extends ConsumerWidget {
  bool selected = false;
  int toppingIndex;
  ToppingCard({required this.toppingIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              final id = snapshot.data![toppingIndex]['id'];
              final name = snapshot.data![toppingIndex]['name'];

              return GestureDetector(
                onTap: () {
                  ref.watch(isToppingSelectedProvider.notifier).state =
                      selected;
                  if (selected == true) {
                    ref.watch(selectedToppingIndexProvider.notifier).state = id;
                  }
                },
                child: Stack(alignment: AlignmentDirectional.topEnd, children: [
                  SizedBox(
                    width: 180.0,
                    height: 48.0,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        child: Text(
                          name,
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  if (selected == true) const Icon(Icons.check_circle)
                ]),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
