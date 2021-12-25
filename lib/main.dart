import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'helper/binding.dart';
import 'view/control_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  Stripe.publishableKey =
      'pk_live_51KAidUCjMeq4FkO6Bn77WsiHHGiz25HHKzM8rRbF48jPuAGiEhYI7cHSimiM5u16rZ2HIZI5EQr6RVvop4Aut13j00XtRf5f0U';
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => ScreenUtilInit(
        designSize: orientation == Orientation.portrait
            ? Size(414, 736)
            : Size(736, 414),
        builder: () => GetMaterialApp(
          initialBinding: Binding(),
          theme: ThemeData(
            fontFamily: 'SourceSansPro',
          ),
          home: ControlView(),
          debugShowCheckedModeBanner: false,
          title: 'Digati',
        ),
      ),
    );
  }
}
