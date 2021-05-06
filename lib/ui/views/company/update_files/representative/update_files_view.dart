import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:huayati/consts/styles.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/form/bottom_submit_button.dart';
import 'package:huayati/ui/widgets/form/form_title.dart';
import 'package:huayati/ui/widgets/form/image_update_field.dart';
import 'package:huayati/ui/widgets/refuse_error_message.dart';
import 'package:stacked/stacked.dart';

import 'update_files_viewmodel.dart';

class RepresentativeUpdateFilesView extends StatelessWidget {
  const RepresentativeUpdateFilesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RepresentativeUpdateFilesViewModel>.reactive(
      viewModelBuilder: () => RepresentativeUpdateFilesViewModel(),
      onModelReady: (viewModel) => viewModel.initilizeView(),
      builder: (context, viewModel, child) => BusyOverlay(
        primaryColors: true,
        show: viewModel.isBusy,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios, color: kcolorPrimaryBlue),
            ),
            centerTitle: true,
            title: FormTitle(
              title: 'مستندات المخولين',
              color: kcolorPrimaryBlue,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              left: 30.w,
              right: 30.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RefuseFilesErrorMessage(viewModel.refuseMessage),
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: viewModel.imageFiles.length,
                    itemBuilder: (context, index) {
                      var isFirst = viewModel.imageFiles[index].isFirst;
                      return ImageUpdateField(
                        fileName: viewModel.imageFiles[index].name +
                            (isFirst ? ' (بياناتك)' : ''),
                        base64Content:
                            viewModel.imageFiles[index].base64Content,
                        isEditDisabled:
                            viewModel.imageFiles[index].isEditDisabled,
                        newFile: viewModel.getNewRawImageFileById(
                          viewModel.imageFiles[index].representativeFileId,
                        ),
                        onChanged: (file) => viewModel.addToNewImageFiles(
                          viewModel.imageFiles[index],
                          file,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomSubmitButton(
            label: 'حفظ التغييرات',
            accentColors: false,
            onPressed: () => viewModel.saveData(),
          ),
        ),
      ),
    );
  }
}
