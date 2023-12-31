import 'package:flutter/material.dart';

import '../../../../app/asset/app_assets.dart';
import '../../../../app/theme/app_colors.dart';
import '../../../../app/theme/app_sizes.dart';
import '../../../widget/organism/auth_header.dart';
import '../../../widget/organism/authentication/auth_footer.dart';
import '../../../widget/organism/authentication/auth_form.dart';
import '../screens/reset_password/reset_password_screen.dart';

class AuthLoginContent extends StatelessWidget {
  const AuthLoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding * 2),
          child: Column(
            children: [
              AuthHeader(
                sizeWidth: sizeWidth,
                pathLogo: AppAssets.longLogoPath,
                textButtonHeader: "Lupa Password",
                textTitle: "Selamat Datang",
                textSubTitle: "Masukkan Info login untuk Akses Member Area",
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ResetPasswordScreen(),
                )),
              ),
              const AuthForm(),
              const AuthFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
