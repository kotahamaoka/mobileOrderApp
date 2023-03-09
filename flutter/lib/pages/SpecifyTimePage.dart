import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:intl/intl.dart";
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:mobile_order_app/lists/storeList.dart';
import 'package:mobile_order_app/pages/OrderPreviewPage.dart';
import 'package:mobile_order_app/providers/selectedStoreIndexProvider.dart';
import 'package:mobile_order_app/providers/specifiedTimeProvider.dart';

class SpecifyTimePage extends ConsumerWidget {
  SpecifyTimePage({Key? key}) : super(key: key);

  String placeholder = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final specifiedTime = ref.watch(specifiedTimeProvider);
    final selectedStoreIndex = ref.watch(selectedStoreIndexProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Specify time')),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            storeList[selectedStoreIndex].name,
            style: const TextStyle(fontSize: 24.0),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const Text('Aviailable time: 12:00-18:30'),
          const SizedBox(
            height: 8.0,
          ),
          GestureDetector(
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: placeholder == '' ? 'Select time' : specifiedTime),
              onTap: () => {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: TimePickerSpinner(
                          is24HourMode: true,
                          normalTextStyle: const TextStyle(
                              fontSize: 16.0, color: Colors.black38),
                          highlightedTextStyle: const TextStyle(
                              fontSize: 16.0, color: Colors.black),
                          onTimeChange: (time) {
                            ref.watch(specifiedTimeProvider.notifier).state =
                                DateFormat('HH:mm').format(time);
                            placeholder = DateFormat('HH:mm').format(time);
                          },
                        ),
                      );
                    })
              },
            ),
          ),
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => OrderPreviewPage()))
                      },
                  child: const Text('Preview order')))
        ]),
      )),
    );
  }
}
