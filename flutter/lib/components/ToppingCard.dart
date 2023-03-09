import 'package:flutter/material.dart';

class ToppingCard extends StatefulWidget {
  const ToppingCard({Key? key}) : super(key: key);

  @override
  _ToppingCardState createState() => _ToppingCardState();
}

class _ToppingCardState extends State<ToppingCard> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: Stack(alignment: AlignmentDirectional.topEnd, children: [
        const SizedBox(
          width: 180.0,
          height: 48.0,
          child: Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Text(
                'Pickles',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        ),
        if (selected == true) const Icon(Icons.check_circle)
      ]),
    );
  }
}
