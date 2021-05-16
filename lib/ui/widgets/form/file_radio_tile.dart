import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/consts/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'image_picker_field.dart';

class FileRadioTile extends StatefulWidget {
  final List<String> options;
  final int? groupValue;
  final ValueChanged<int> onChanged;
  final File? imageFile;
  final ValueChanged<File>? onFileChanged;

  FileRadioTile({
    Key? key,
    required this.options,
    required this.groupValue,
    required this.onChanged,
    required this.imageFile,
    this.onFileChanged,
  }) : super(key: key);

  @override
  _FileRadioTileState createState() => _FileRadioTileState();
}

class _FileRadioTileState extends State<FileRadioTile> {
  int? _selectedIndex;
  @override
  void initState() {
    _selectedIndex = widget.groupValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          children: List<Widget>.generate(
            widget.options.length,
            (int i) => RadioListTile<int>(
              activeColor: kcolorBluelight,
              title: Text(
                widget.options[i],
                style: TextStyle(color: kColorText),
              ),
              value: i,
              groupValue: _selectedIndex,
              onChanged: (file) {
                setState(() {
                  _selectedIndex = i;
                });
                widget.onChanged(i);
              },
            ),
          ),
        ),
        SizedBox(height: 10.h),
        ImagePickerField(
          onChanged: widget.onFileChanged,
          imageFile: widget.imageFile,
          disabled: _selectedIndex == null,
        ),
      ],
    );
  }
}
