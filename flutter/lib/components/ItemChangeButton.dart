import 'package:flutter/material.dart';
import 'package:mobile_order_app/pages/MenuDetailPage.dart';

class ItemChangeButton extends StatelessWidget {
  const ItemChangeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => MenuDetailPage()))
      },
      child: const Text('Change'),
    );
  }
}
