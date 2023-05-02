import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/pages/MenuDetailPage.dart';
import 'package:mobile_order_app/providers/isStoreSelectedProvider.dart';
import 'package:mobile_order_app/providers/selectedStoreIndexProvider.dart';

Future<List<dynamic>> fetchData() async {
  final dio = Dio();
  final response = await dio.get("http://localhost:3000/store");
  if (response.statusCode == 200) {
    final List<dynamic> responseData = response.data;
    return responseData;
  } else {
    throw Exception('Failed to load data');
  }
}

class StoreCard extends ConsumerWidget {
  bool isReadOnly;
  int storeIndex;

  StoreCard({Key? key, required this.isReadOnly, required this.storeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else {
              final id = snapshot.data![storeIndex]['id'];
              final name = snapshot.data![storeIndex]['name'];
              final isOpen = snapshot.data![storeIndex]['isOpen'];
              final address = snapshot.data![storeIndex]['address'];
              final distance = snapshot.data![storeIndex]['distance'];
              final imageName = snapshot.data![storeIndex]['imageName'];

              return GestureDetector(
                onTap: () => {
                  isReadOnly
                      ? () {}
                      : Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MenuDetailPage())),
                  ref.watch(isStoreSelectedProvider.notifier).state = true,
                  ref.watch(selectedStoreIndexProvider.notifier).state = id
                },
                child: SizedBox(
                  height: 136.0,
                  child: Card(
                    child: Row(children: [
                      Image.asset(
                        'images/$imageName',
                        width: 136.0,
                        height: 136.0,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(isOpen ? 'Open' : 'Closed',
                                    style: const TextStyle(fontSize: 12.0)),
                                const SizedBox(
                                  width: 120.0,
                                ),
                                Text('${distance}km',
                                    style: const TextStyle(fontSize: 12.0))
                              ],
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Text(
                              name,
                            ),
                            const SizedBox(
                              height: 8.0,
                            ),
                            Text(
                              address,
                              style: const TextStyle(fontSize: 12.0),
                              softWrap: true,
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              );
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
