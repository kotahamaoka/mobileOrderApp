import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/lists/menuList.dart';

import 'package:mobile_order_app/pages/MenuDetailPage.dart';
import 'package:mobile_order_app/providers/selectedMenuIndexProvider.dart';

class MenuCard extends ConsumerWidget {
  int menuIndex;
  MenuCard({required this.menuIndex, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MenuDetailPage())),
              ref.watch(selectedMenuIndexProvider.notifier).state = menuIndex
            },
        child: SizedBox(
          width: 180.0,
          height: 180.0,
          child: Card(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'images/${menuList[menuIndex].imageName}',
                width: 180.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        menuList[menuIndex].name,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(
                        height: 4.0,
                      ),
                      Text(
                        '\$${menuList[menuIndex].price}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ]),
              ),
            ]),
          ),
        ));
  }
}
