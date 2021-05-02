import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/app/locator.dart';
import 'package:huayati/models/image_file.dart';
import 'package:huayati/services/third_party/media_picker.dart';
import 'package:huayati/services/third_party/snackbar_service.dart';
import 'package:huayati/utils/file_utils.dart';
import 'package:image_picker/image_picker.dart';

import 'text_field_label.dart';

class ImageUpdateField extends StatelessWidget {
  final ImageFile imageFile;
  final File newFile;
  final ValueChanged<File> onChanged;
  const ImageUpdateField({
    @required this.imageFile,
    this.newFile,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var _oldImageBytes = FileUtils.base64ToBytes(
      imageFile?.base64Content ?? '',
    );
    Color borderColor = imageFile.editBtnShow && newFile == null
        ? Colors.red
        : Colors.grey.shade400;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFieldLabel(
          label: imageFile?.name ?? '',
        ),
        SizedBox(height: 15.h),
        Row(
          children: [
            GestureDetector(
              onTap: imageFile.isEditDisabled ? null : _selectFile,
              child: Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: borderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  height: 200,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: newFile != null
                          ? FileImage(newFile)
                          : MemoryImage(_oldImageBytes),
                    ),
                  ),
                  alignment: Alignment.bottomRight,
                  child: imageFile.isEditDisabled
                      ? SizedBox.shrink()
                      : Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 5),
                              const Icon(
                                Icons.swap_vert_circle_outlined,
                                color: Colors.white,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'تعديل',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ),
          ],
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
      print(e.toString());
    } catch (e) {
      print(e.toString());
      locator<SnackbarService>().showTopErrorSnackbar(
        message: 'حدث خطأ أثناء معالجة الصورة ، نرجو اختيار صورة اخرى',
      );
    }
  }
}
