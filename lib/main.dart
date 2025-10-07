import 'package:evently_online_sat/config/theme/theme_manager.dart';
import 'package:evently_online_sat/core/prefs_manager/prefs_manager.dart';
import 'package:evently_online_sat/core/routes_manager/app_routes.dart';
import 'package:evently_online_sat/core/routes_manager/router.dart';
import 'package:evently_online_sat/l10n/app_localizations.dart';
import 'package:evently_online_sat/providers/language_provider.dart';
import 'package:evently_online_sat/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
 await PrefsManager.init();
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
        initialRoute: AppRoutes.mainLayout,
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
