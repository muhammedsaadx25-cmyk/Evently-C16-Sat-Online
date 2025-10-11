import 'dart:math';

import 'package:evently_online_sat/core/extensions/date_ex.dart';
import 'package:evently_online_sat/core/resources/assets_manager.dart';
import 'package:evently_online_sat/core/resources/colors_manager.dart';
import 'package:evently_online_sat/core/widgets/custom_elevated_button.dart';
import 'package:evently_online_sat/core/widgets/custom_tab_bar.dart';
import 'package:evently_online_sat/core/widgets/custom_text_button.dart';
import 'package:evently_online_sat/core/widgets/custom_text_form_field.dart';
import 'package:evently_online_sat/l10n/app_localizations.dart'
    show AppLocalizations;
import 'package:evently_online_sat/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  late CategoryModel selectedCategory = CategoryModel.getCategories(context)[0];
  DateTime selectedDateTime = DateTime.now();
  TimeOfDay pickedTimeTemp = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.create_event)),
      body: Padding(
        padding: REdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(selectedCategory.imagePath),
              ),
              SizedBox(height: 16.h),
              CustomTabBar(
                onCategoryItemClicked: (category) {
                  setState(() {
                    selectedCategory = category;
                  });
                },
                categories: CategoryModel.getCategories(context),
                selectedBgColor: ColorsManager.blue,
                selectedFgColor: ColorsManager.whiteBlue,
                unSelectedBgColor: Colors.transparent,
                unSelectedFgColor: ColorsManager.blue,
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalizations.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: appLocalizations.event_title,
                prefixIcon: Icon(Icons.edit_note_sharp),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 16.h),
              Text(
                appLocalizations.description,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                hintText: appLocalizations.event_description,
                keyboardType: TextInputType.text,
                maxLines: 4,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.date_range_outlined),
                  SizedBox(width: 4.w),
                  Text(
                    selectedDateTime.toFormattedDate,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: appLocalizations.choose_date,
                    onTap: _selectEventDate,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 4.w),
                  Text(
                    selectedDateTime.getTime,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Spacer(),
                  CustomTextButton(
                    text: appLocalizations.choose_time,
                    onTap: _selectEventTime,
                  ),
                ],
              ),
              SizedBox(height: 24),
              CustomElevatedButton(
                text: appLocalizations.create_event,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  String toFormattedDate(DateTime dateTime) {
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    return formatter.format(dateTime);
  }

  void _selectEventDate() async {
    selectedDateTime =
        await showDatePicker(
          context: context,
          firstDate: DateTime.now(),
          lastDate: DateTime.now().add(Duration(days: 365)),
        ) ??
        selectedDateTime;
    selectedDateTime = selectedDateTime.copyWith(hour: pickedTimeTemp.hour, minute: pickedTimeTemp.minute);

    setState(() {});
  }

  void _selectEventTime() async {
    pickedTimeTemp =
        await showTimePicker(context: context, initialTime: TimeOfDay.now()) ??
        pickedTimeTemp;

    selectedDateTime = selectedDateTime.copyWith(
      hour: pickedTimeTemp.hour,
      minute: pickedTimeTemp.minute,
    );
    setState(() {});
  }
}
