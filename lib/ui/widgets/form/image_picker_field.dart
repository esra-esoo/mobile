import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/services/third_party/media_picker.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatefulWidget {
  final File imageFile;
  final ValueChanged<File> onChanged;
  final VoidCallback onDelete;

  const ImagePickerField({
    this.imageFile,
    this.onDelete,
    this.onChanged,
  });

  @override
  _ImagePickerFieldState createState() => _ImagePickerFieldState();
}

class _ImagePickerFieldState extends State<ImagePickerField> {
  File _image;
  final ImagePicker _imagePicker = ImagePicker();
  @override
  void initState() {
    _image = widget.imageFile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectFile,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
        height: _image != null ? 120 : 55,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(10),
        ),
        child: _image == null
            ? Row(
                children: <Widget>[
                  Icon(
                    Icons.image,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'إضغط هنا لاختيار الصورة ..',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey.shade600,
                    size: 20,
                  ),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.file(
                      _image,
                      fit: BoxFit.contain,
                    ),
                  ),
                  IconButton(
                    splashColor: kColorCard,
                    icon: Icon(
                      CupertinoIcons.delete_right,
                      color: Colors.grey.shade600,
                    ),
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                      widget.onChanged(null);
                    },
                  ),
                ],
              ),
      ),
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
