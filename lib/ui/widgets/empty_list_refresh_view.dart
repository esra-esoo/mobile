import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';

class EmptyListRefreshView extends StatelessWidget {
  final Future<void> Function() onRefresh;
  const EmptyListRefreshView({Key key, @required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: kcolorPrimaryBlue,
      color: Colors.white,
      onRefresh: onRefresh,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height -
                kToolbarHeight -
                MediaQuery.of(context).viewPadding.bottom,
            alignment: Alignment.center,
            child: Text(
              '''لايوجد بيانات ...
للتحديث قم بالسحب لاسفل
⇣''',
              style: const TextStyle(
                color: Colors.black,
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
