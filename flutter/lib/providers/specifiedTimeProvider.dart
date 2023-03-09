import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final specifiedTimeProvider =
    StateProvider((ref) => DateFormat('HH:mm').format(DateTime.now()));
