import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rolling/app/modules/auth/bindings/location_bindings.dart';
import 'package:rolling/app/modules/auth/views/Location_views.dart';
import 'package:rolling/app/modules/splash/views/OnboardingView.dart';

import '../modules/splash/bindings/Onboarding_bindings.dart';
import '../modules/splash/bindings/splash_bindings.dart';
import '../modules/splash/views/splashscreenView.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    //splashScreen section
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),

    //onboarding screen
    GetPage(
      name: _Paths.ONBOARDINGSCREEN,
      page: () => Onboardingview(),
      binding: OnboardingBindings(),
    ),

    GetPage(
      name: _Paths.LOCATIONSCREEN,
      page: () => LocationPermissionScreen(),
      binding: LocationBindings(),
    ),

    // //authentication section
    // GetPage(
    //   name: _Paths.LOGINSCREEN,
    //   page: () => const LoginView(),
    //   binding: AuthBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.SIGNUPSCREEN,
    //   page: () => const Signupview(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: _Paths.FORGETSCREEN,
    //   page: () =>  ForgotPasswordScreen(),
    //   binding: AuthBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.VERIFICATIONSCREEN,
    //   page: () =>  VerificationCodeView(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: _Paths.NEWPASSWORDSCREEN,
    //   page: () =>  NewPasswordScreen(),
    //   binding: AuthBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.NAVBARSCREEN,
    //   page: () =>  NavbarView(),
    //   binding: HomeBinding(),
    // ),
    // //  HomeScreen Module
    // GetPage(
    //   name: _Paths.HOMESCREEN,
    //   page: () =>  HomeScreen(),
    //   binding: HomeBinding(),
    // ),
    //
    // // Product Details Screen Module
    // GetPage(
    //   name: _Paths.PRODCUTDETAILSSCREEN,
    //   page: () => const ProductDetails(),
    //   binding: HomeBinding(),
    // ),
    // GetPage(
    //   name: _Paths.ReviewsViewSCREEN,
    //   page: () => const ReviewsView(),
    //   binding: HomeBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.ADDReviewsViewSCREEN,
    //   page: () => const  AddReviewView(),
    //   binding: HomeBinding(),
    // ),
    //
    // GetPage(
    //   name: _Paths.ACCOUNTINFO,
    //   page: () => const  AccountInformationScreen(),
    //   binding: HomeBinding(),
    // ),
  ];
}
