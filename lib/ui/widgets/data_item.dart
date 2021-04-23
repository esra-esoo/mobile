import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class DataItem extends StatelessWidget {
  final String label;
  final String value;
  const DataItem({@required this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Flexible(
          flex: 2,
          child: Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(top: 5, bottom: 5),
            padding: EdgeInsets.all(8),
            child: Text(
              label,
              softWrap: true,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kcolorPrimaryBlue,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ),
        Flexible(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: kColorCard,
            ),
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
            padding: const EdgeInsets.all(8),
            child: Text(
              value ?? '',
              style: TextStyle(color: kColorText),
              overflow: TextOverflow.clip,
              softWrap: true,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ],
    );
  }
}
