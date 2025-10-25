import 'package:evently_online_sat/config/theme/theme_manager.dart';
import 'package:evently_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:evently_online_sat/core/routes_manager/app_routes.dart';
import 'package:evently_online_sat/core/routes_manager/router.dart';
import 'package:evently_online_sat/features/main_layout/main_layout.dart';
import 'package:evently_online_sat/firebase/firebase_service.dart';
import 'package:evently_online_sat/l10n/app_localizations.dart';
import 'package:evently_online_sat/models/user_model.dart';
import 'package:evently_online_sat/providers/language_provider.dart';
import 'package:evently_online_sat/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
 await PrefsManager.init();
 if(FirebaseAuth.instance.currentUser != null){
   UserModel.currentUser = await FirebaseService.getUserFromFireStore(FirebaseAuth.instance.currentUser!.uid);
 }
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ThemeProvider()),
        ChangeNotifierProvider(create: (context)=> LanguageProvider()),
      ],
      child: const Evently()));
}

class Evently extends StatelessWidget {
  const Evently({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var languageProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesManger.router,
        initialRoute: FirebaseAuth.instance.currentUser == null ?AppRoutes.login: AppRoutes.mainLayout ,
        theme: ThemeManager.light,
        darkTheme: ThemeManager.dark,
        themeMode: themeProvider.currentTheme,
        locale: Locale(languageProvider.currentLanguage),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: [
          Locale("en"),
          Locale("ar")
        ],
      ),

    );
  }
}
