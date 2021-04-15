import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:get/get.dart';
import 'package:huayati/consts/styles.dart';

class PickerItem {
  final String label;
  final dynamic value;
  PickerItem({@required this.label, @required this.value});
}

class PickerService {
  Future<dynamic> showPlatformPickerModal({
    @required String messageTitle,
    @required List<PickerItem> items,
    PickerItem inititalValue,
  }) async {
    var selectedItem = inititalValue;

    return await showPlatformModalSheet(
      androidIsScrollControlled: true,
      androidEnableDrag: true,
      androidBackgroundColor: Colors.transparent,
      context: Get.overlayContext,
      builder: (context) {
        return Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .9,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            color: Colors.white,
          ),
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(height: 20),
                Text(
                  messageTitle,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(
                  color: kcolorPrimaryBlue,
                  indent: 50,
                  endIndent: 50,
                ),
                Flexible(
                  child: Scrollbar(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemBuilder: (ctx, index) {
                        return RadioListTile<dynamic>(
                          activeColor: kcolorPrimaryBlue,
                          title: Text(items[index].label),
                          value: items[index]?.value,
                          groupValue: selectedItem?.value,
                          onChanged: (value) {
                            Navigator.pop(context, items[index].value);
                          },
                        );
                      },
                      itemCount: items.length,
                    ),
                  ),
                ),
                SafeArea(
                  bottom: true,
                  minimum: const EdgeInsets.only(top: 5, bottom: 5),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context, null),
                    child: Container(
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: kcolorPrimaryBlue,
                      ),
                      alignment: Alignment.center,
                      height: 50,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Text(
                        'تراجع',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
