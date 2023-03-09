import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_order_app/core/Menu.dart';

final StateProvider<List<Menu>> itemsInCartProvider =
    StateProvider((ref) => []);
