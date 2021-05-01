import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/models/image_file.dart';
import 'package:huayati/services/third_party/media_picker.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'text_field_label.dart';

class ImageUpdateField extends StatefulWidget {
  final ImageFile imageFile;
  final ValueChanged<File> onChanged;
  const ImageUpdateField({
    @required this.imageFile,
    this.onChanged,
  });

  @override
  _ImageUpdateFieldState createState() => _ImageUpdateFieldState();
}

class _ImageUpdateFieldState extends State<ImageUpdateField> {
  File _image;
  Uint8List _oldImageBytes;
  final ImagePicker _imagePicker = ImagePicker();
  @override
  void initState() {
    super.initState();
    _oldImageBytes = FileUtils.base64ToBytes(widget.imageFile.base64Content);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFieldLabel(
          label: widget.imageFile?.name ?? '',
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: widget.imageFile.isEditDisabled ? null : _selectFile,
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 200.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: _image != null
                          ? FileImage(
                              _image,
                            )
                          : MemoryImage(
                              _oldImageBytes,
                            ),
                    ),
                  ),
                ),
                FlatButton.icon(
                  splashColor: kColorCard,
                  textColor: kcolorPrimaryBlue,
                  onPressed:
                      widget.imageFile.isEditDisabled ? null : _selectFile,
                  icon: Icon(
                    Icons.swap_vert_circle_outlined,
                    size: 22.sp,
                  ),
                  label: Text('تعديل'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future _selectFile() async {
    try {
      var imageSource = await locator<MediaPickerService>().showBottomSheet();
      if (imageSource == null) return;
      await Future.delayed(const Duration(milliseconds: 350));
      PickedFile pickedFile = await _imagePicker.getImage(
        source: imageSource,
        maxHeight: 810,
        maxWidth: 1080,
      );
      if (pickedFile == null) return;
      File imageFile = File(pickedFile.path);
      double megabyte = (await imageFile.length()) / 1024 / 1024;
      if (megabyte >= 2.0) {
        locator<SnackbarService>().showTopInfoSnackbar(
          message: 'حجم الصورة يجب ان يكون أقل من 2 ميجا',
        );
        return;
      }
      setState(() {
        _image = imageFile;
      });
      widget.onChanged(imageFile);
    } on Exception catch (e) {
      print(e.toString());
    } catch (e) {
      print(e.toString());
      locator<SnackbarService>().showTopErrorSnackbar(
        message: 'حدث خطأ أثناء معالجة الصورة ، نرجو اختيار صورة اخرى',
      );
    }
  }
}
