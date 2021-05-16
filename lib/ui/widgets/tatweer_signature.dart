import 'package:flutter/material.dart';

class TatweerSignature extends StatelessWidget {
  const TatweerSignature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Developed by ',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: 'Tatweer.ly',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
