import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformCircularProgressIndicator(
      material: (_, __) => MaterialProgressIndicatorData(
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}

class CenterLoadingIndicator extends StatelessWidget {
  const CenterLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: const LoadingIndicator());
  }
}
