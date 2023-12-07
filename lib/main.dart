import 'package:diu_qr_code_scanner/core/global_theme.dart';
import 'package:diu_qr_code_scanner/core/services/injection_container.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:diu_qr_code_scanner/features/authentication/presentation/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DIU CMS',
          theme: GTheme.lightTheme,
          darkTheme: GTheme.darkTheme,
          themeMode: ThemeMode.system,
          home: LoginScreen(),
        ),
      ),
    );
  }
}
