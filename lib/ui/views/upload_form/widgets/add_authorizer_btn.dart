import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class AddAuthorizerButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddAuthorizerButton({Key key, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        color: Colors.transparent,
        splashColor: kcolorBluelight,
        onPressed: onPressed,
        child: Column(
          children: <Widget>[
            const Icon(Icons.add, color: kcolorBluelight, size: 30),
            const SizedBox(height: 5),
            Text(
              'إضافة مخول',
              style: TextStyle(
                color: kcolorBluelight,
                fontSize: 18,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
