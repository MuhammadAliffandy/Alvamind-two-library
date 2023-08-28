import 'package:flutter/material.dart';

import '../../../app/asset/app_assets.dart';
import '../../atom/my_asset_image.dart';

class SpLogo extends StatelessWidget {
  const SpLogo({super.key, required this.widthLogo});
  final double widthLogo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyAssetImage(
        path: AppAssets.shortLogoPath,
        widthImage: widthLogo,
      ),
    );
  }
}
