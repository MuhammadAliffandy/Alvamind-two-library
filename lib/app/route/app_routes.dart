import 'package:alvamind_library_two/widget/organism/widget_sample_web.dart';
import 'package:flutter/material.dart';

import '../../view/screens/about/about_view.dart';
import '../../view/screens/checkout/checkout_view.dart';
import '../../view/screens/checkout/student_checkout_view.dart';
import '../../view/screens/dashboard/dashboard_view.dart';
import '../../view/screens/hotel_picker/hotel_picker_view.dart';
import '../../view/screens/hotel_picker/student_hotel_picker_view.dart';
import '../../view/screens/login/login_view.dart';
import '../../view/screens/login/reset_pass_view.dart';
import '../../view/screens/marketing/marketing_gallery_screen.dart';
import '../../view/screens/onboarding/onboarding_view.dart';
import '../../view/screens/payment_status/payment_status.dart';
import '../../view/screens/program_list/program_list_view.dart';
import '../../view/screens/referral/referral_detail_view.dart';
import '../../view/screens/referral/referral_invitation_view.dart';
import '../../view/screens/referral/referral_view.dart';
import '../../view/screens/register/register_view.dart';
import '../../view/screens/reward_list/reward_list_view.dart';
import '../../view/screens/settings_sreen/edit_profile_view.dart';
import '../../view/screens/settings_sreen/settings_view.dart';
import '../../view/screens/splash/splash_view.dart';
import '../../view/screens/student/student_registration_view.dart';
import '../../view/screens/web_view/web_view.dart';
import '../../view/screens/web_view/web_view_sample.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    SplashView.routeName: (context) => const SplashView(),
    OnboardingView.routeName: (context) => const OnboardingView(),
    LoginView.routeName: (context) => const LoginView(),
    RegisterView.routeName: (context) => const RegisterView(),
    ResetPassView.routeName: (context) => const ResetPassView(),
    HotelPicker.routeName: (context) => const HotelPicker(),
    CheckoutView.routeName: (context) => const CheckoutView(),
    ProgramListView.routeName: (context) => const ProgramListView(),
    RewardListView.routeName: (context) => const RewardListView(),
    PaymentStatusView.successRouteName: (context) => const PaymentStatusView.success(),
    PaymentStatusView.failedRouteName: (context) => const PaymentStatusView.failed(),
    DashboardView.routeName: (context) => const DashboardView(),
    ReferralView.viewAsMeRouteName: (context) => const ReferralView.viewAsMe(),
    ReferralView.viewAsOtherRouteName: (context) => const ReferralView.viewAsOther(),
    ReferralInvitationView.viewAsMeRouteName: (context) => const ReferralInvitationView.viewAsMe(),
    ReferralDetailView.viewAsMeRouteName: (context) => const ReferralDetailView.viewAsMe(),
    SettingsView.routeName: (context) => const SettingsView(),
    EditProfileView.routeName: (context) => const EditProfileView(),
    MarketingGalleryView.routeName: (context) => const MarketingGalleryView(),
    StudentRegistrationView.routeName: (context) => const StudentRegistrationView(),
    StudentHotelPickerView.routeName: (context) => const StudentHotelPickerView(),
    StudentCheckoutView.routeName: (context) => const StudentCheckoutView(),
    AboutView.routeName: (context) => const AboutView(),
    WebviewSample.routeName: (context) => const WebviewSample(),
    WebView.routeName: (context) => const WebView(),
    WidgetTestSample.routeName: (context) => const WidgetTestSample(),
  };
}
