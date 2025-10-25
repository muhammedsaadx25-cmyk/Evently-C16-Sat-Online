import 'package:evently_online_sat/core/resources/assets_manager.dart';
import 'package:evently_online_sat/core/resources/colors_manager.dart';
import 'package:evently_online_sat/core/routes_manager/app_routes.dart';
import 'package:evently_online_sat/features/main_layout/profile/custom_drop_down_item.dart';
import 'package:evently_online_sat/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:evently_online_sat/models/user_model.dart';
import 'package:evently_online_sat/providers/language_provider.dart';
import 'package:evently_online_sat/providers/theme_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
          width: double.infinity,

          decoration: BoxDecoration(
            color: ColorsManager.blue,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36.r)),
          ),
          child: SafeArea(
            bottom: false,
            left: false,
            right: false,
            child: Row(
              children: [
                Image.asset(ImageAssets.profileImage),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                       UserModel.currentUser!.name,
                        style: GoogleFonts.inter(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                      Text(
                       UserModel.currentUser!.email,
                        style: GoogleFonts.inter(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 24.h),
        CustomDropDownItem(
          onChange: (newTheme){
            themeProvider.changeAppTheme(newTheme == appLocalizations.light? ThemeMode.light : ThemeMode.dark);
          },
          label: appLocalizations.theme,
          selectedLabel: themeProvider.isDark ? appLocalizations.dark : appLocalizations.light,
          menuItems: [appLocalizations.light, appLocalizations.dark],
        ),
        SizedBox(height: 16.h),
        CustomDropDownItem(
          onChange: (newLang){
            langProvider.changeAppLanguage(newLang == "English"? "en": "ar");
          },
          label: appLocalizations.language,
          selectedLabel: langProvider.isEnglish ? "English":"Arabic" ,
          menuItems: ["English", "Arabic"],
        ),
        Spacer(flex: 7),
        Container(
          margin: REdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 16),
              backgroundColor: ColorsManager.red,
              foregroundColor: ColorsManager.white,
              textStyle: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
                color: ColorsManager.white,
              ),
            ),
            onPressed: _logout,
            child: Row(
              children: [
                Icon(Icons.logout),

                SizedBox(width: 8.h),
                Text(appLocalizations.logout),
              ],
            ),
          ),
        ),
        Spacer(flex: 3),
      ],
    );
  }

  void _logout()async {
   await   FirebaseAuth.instance.signOut();

    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}
