import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/components/Cart.dart';

import 'package:mobile_order_app/components/MenuCard.dart';
import 'package:mobile_order_app/core/Menu.dart';
import 'package:mobile_order_app/lists/menuList.dart';
import 'package:mobile_order_app/pages/ProfilePage.dart';
import 'package:mobile_order_app/providers/isStoreSelectedProvider.dart';
import 'package:mobile_order_app/providers/selectedIndexProvider.dart';

class TopPage extends ConsumerWidget {
  TopPage({Key? key}) : super(key: key);

  final List<Widget> _widgetOptions = <Widget>[
    DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Menu',
          ),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Sandwich',
              ),
              Tab(
                text: 'Drink',
              ),
              Tab(
                text: 'SetMenu',
              ),
            ],
          ),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: TabBarView(children: <Widget>[
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                    padding: const EdgeInsets.all(4.0),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return (MenuCard(
                        menuIndex: index,
                      ));
                    }),
                const Center(child: Text('Here\'s drink menu.')),
                const Center(child: Text('Here\'s setMenu.')),
              ]),
            ),
          ],
        )),
      ),
    ),
    const Text('Index 1 : Store'),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final isStoreSelected = ref.watch(isStoreSelectedProvider);

    void onItemTapped(int index) {
      ref.watch(selectedIndexProvider.notifier).state = index;
    }

    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(selectedIndex)),
      bottomNavigationBar: isStoreSelected
          ? Cart()
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.menu_book), label: 'Menu'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.storefront), label: 'Store'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_circle), label: 'Profile')
              ],
              currentIndex: selectedIndex,
              onTap: onItemTapped,
            ),
    );
  }
}
