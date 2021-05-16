import 'dart:io';

import 'package:flutter/material.dart';
import 'package:huayati/ui/widgets/busy_overlay.dart';
import 'package:huayati/ui/widgets/loading_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ComplaintView extends StatefulWidget {
  const ComplaintView({Key? key}) : super(key: key);

  @override
  _ComplaintViewState createState() => _ComplaintViewState();
}

class _ComplaintViewState extends State<ComplaintView>
    with AutomaticKeepAliveClientMixin<ComplaintView> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: [
        WebView(
          initialUrl: 'https://mobile.tatweer.ly:44323/Complaint',
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        isLoading ? const CenterLoadingIndicator() : const SizedBox.shrink()
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
