import 'package:alvamind_library_two/app/theme/app_sizes.dart';
import 'package:alvamind_library_two/model/webview_model.dart';
import 'package:alvamind_library_two/view/screens/web_view/web_view.dart';
import 'package:alvamind_library_two/widget/atom/app_button.dart';
import 'package:flutter/material.dart';

import '../../../app/theme/app_text_style.dart';

class WebviewSample extends StatelessWidget {
  static const String routeName = '/web-view-sample';

  const WebviewSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WebView Sample',
          style: AppTextStyle.bold(context, fontSize: 18),
        ),
        elevation: 0.2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.padding),
        child: Column(
          children: [
            AppButton(
              text: 'Google',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  WebView.routeName,
                  arguments: WebViewModel(title: 'Google', url: 'https://google.com'),
                );
              },
            ),
            const SizedBox(height: AppSizes.padding),
            AppButton(
              text: 'Facebook',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  WebView.routeName,
                  arguments: WebViewModel(title: 'Facebook', url: 'https://facebook.com'),
                );
              },
            ),
            const SizedBox(height: AppSizes.padding),
            AppButton(
              text: 'YouTube',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  WebView.routeName,
                  arguments: WebViewModel(title: 'Youtube', url: 'https://youtube.com'),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
