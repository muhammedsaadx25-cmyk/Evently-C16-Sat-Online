import 'package:evently_online_sat/core/resources/colors_manager.dart';
import 'package:evently_online_sat/core/widgets/custom_tab_bar.dart';
import 'package:evently_online_sat/core/widgets/custom_tab_item.dart';
import 'package:evently_online_sat/core/widgets/event_item.dart' show EventItem;
import 'package:evently_online_sat/l10n/app_localizations.dart';
import 'package:evently_online_sat/models/category_model.dart';
import 'package:evently_online_sat/models/event_model.dart';
import 'package:evently_online_sat/providers/language_provider.dart';
import 'package:evently_online_sat/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
var themeProvider = Provider.of<ThemeProvider>(context);
var langProvider = Provider.of<LanguageProvider>(context);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          width: double.infinity,

          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16.r)),
          ),
          child: SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${appLocalizations.welcome_back} ✨",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          "Moo Saad",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color:themeProvider.isDark ?  ColorsManager.ofWhite: ColorsManager.white),
                            Text(
                              "Cairo, Egypt",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                   IconButton(onPressed: (){
                     themeProvider.changeAppTheme(themeProvider.isDark ? ThemeMode.light : ThemeMode.dark);
                   }, icon:  Icon(themeProvider.isDark ? Icons.light_mode: Icons.dark_mode_rounded, color: themeProvider.isDark ? ColorsManager.ofWhite :ColorsManager.white)),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: (){
                        langProvider.changeAppLanguage(langProvider.isEnglish ? "ar": "en");
                      },
                      child: Card(
                        color: themeProvider.isDark ? ColorsManager.ofWhite : ColorsManager.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            langProvider.isEnglish ?"Ar": "En",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                CustomTabBar(
                  categories: CategoryModel.getCategoriesWithAll(context),
                  selectedBgColor: ColorsManager.whiteBlue,
                  selectedFgColor: ColorsManager.blue,
                  unSelectedBgColor: Colors.transparent,
                  unSelectedFgColor: ColorsManager.whiteBlue,
                ),

                //Expanded(child: ListView.builder(itemBuilder: (context, index)=> , itemCount: 20,))
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) => EventItem(
              event: EventModel(
                category: CategoryModel.getCategories(context)[2],
                title: "Meeting for Updating The Development Method ",
                description: "Meeting for Updating The Development Method ",
                dateTime: DateTime.now(),
                timeOfDay: TimeOfDay.now(),
              ),
            ),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
