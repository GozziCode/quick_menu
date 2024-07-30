import 'package:flutter/material.dart';
<<<<<<< HEAD

=======
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> 119b048260cad1ebea17cc76f8b84dc4518fb4ba
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quick_menu/screens/write/bloc/menu_bloc.dart';

import 'constant/app_color.dart';
import 'providers/menu_provider.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MenuBloc>(
      create: (context) => MenuBloc(),
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            title: 'Quick Menu',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.bgColor,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
