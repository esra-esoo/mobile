import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/services/third_party/media_picker.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerField extends StatelessWidget {
  final File imageFile;
  final ValueChanged<File> onChanged;
  final VoidCallback onDelete;
  final bool disabled;
  const ImagePickerField({
    this.imageFile,
    this.onDelete,
    this.onChanged,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: disabled ? null : _selectFile,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            decoration: BoxDecoration(
              color: disabled ? Colors.grey.shade300 : Colors.white,
              border: Border.all(color: Colors.grey.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              height: 200,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: imageFile != null
                    ? DecorationImage(
                        fit: BoxFit.cover,
                        image: FileImage(
                          imageFile,
                        ),
                      )
                    : null,
              ),
              alignment: Alignment.bottomRight,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    Icon(
                      imageFile != null
                          ? Icons.swap_vert_circle_outlined
                          : Icons.add,
                      color: disabled ? Colors.white60 : Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      imageFile != null ? 'تعديل' : 'إضافة',
                      style: TextStyle(
                        color: disabled ? Colors.white60 : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
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
      PickedFile pickedFile = await ImagePicker().getImage(
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

      onChanged(imageFile);
    } on Exception catch (e) {
      print(e);
      locator<SnackbarService>().showTopErrorSnackbar(
        message: 'حدث خطأ أثناء معالجة الصورة ، نرجو اختيار صورة اخرى',
      );
    } catch (e) {
      print(e.toString());
      locator<SnackbarService>().showTopErrorSnackbar(
        message: 'حدث خطأ أثناء معالجة الصورة ، نرجو اختيار صورة اخرى',
      );
    }
  }
}
