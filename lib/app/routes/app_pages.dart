import 'package:airsoft/app/modules/home/bindings/edit_binding.dart';
import 'package:airsoft/app/modules/home/bindings/post_binding.dart';
import 'package:airsoft/app/modules/home/views/addproduct_view.dart';
import 'package:airsoft/app/modules/home/views/editproduct_view.dart';
import 'package:airsoft/app/modules/transaction/views/detailtransaction_view.dart';
import 'package:get/get.dart';
import 'package:airsoft/app/modules/auth/bindings/login_binding.dart';
import 'package:airsoft/app/modules/auth/bindings/register_binding.dart';
import 'package:airsoft/app/modules/auth/views/login_view.dart';
import 'package:airsoft/app/modules/auth/views/register_view.dart';
import 'package:airsoft/app/modules/home/bindings/detail_binding.dart';
import 'package:airsoft/app/modules/home/bindings/home_binding.dart';
import 'package:airsoft/app/modules/home/views/detail_view.dart';
import 'package:airsoft/app/modules/home/views/home_view.dart';
import 'package:airsoft/app/modules/splash/bindings/splash_binding.dart';
import 'package:airsoft/app/modules/splash/views/splash_view.dart';
import 'package:airsoft/app/modules/transaction/bindings/transaction_binding.dart';
import 'package:airsoft/app/modules/transaction/views/transaction_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.TRANSACTION,
      page: () => TransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.DETAILTRANSACTION,
      page: () => DetailtransactionView(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: _Paths.ADDPRODUCT,
      page: () => AddProductView(),
      binding: PostBinding(),
    ),
    GetPage(
      name: _Paths.EDITPRODUCT,
      page: () => EditProductView(),
      binding: EditBinding(),
    )
  ];
}
