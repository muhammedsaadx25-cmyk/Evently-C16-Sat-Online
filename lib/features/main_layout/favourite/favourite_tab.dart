import 'package:evently_online_sat/core/resources/colors_manager.dart';
import 'package:evently_online_sat/core/widgets/event_item.dart';
import 'package:evently_online_sat/firebase/firebase_service.dart';
import 'package:evently_online_sat/l10n/app_localizations.dart' show AppLocalizations;
import 'package:evently_online_sat/models/category_model.dart' show CategoryModel;
import 'package:evently_online_sat/models/event_model.dart' show EventModel;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: ColorsManager.blue,),
                hintText: appLocalizations.search_for_event,
                hintStyle: GoogleFonts.inter(fontSize: 14.sp, color: ColorsManager.blue, fontWeight: FontWeight.bold
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w)
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: ColorsManager.blue, width: 1.w)
                ),
              ),
            ),
          ),

          FutureBuilder(future: FirebaseService.getFavouriteEvents(context),

              builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError ){
              return Center(child: Text(snapshot.error.toString()),);
            }

            List<EventModel> favouriteEvents = snapshot.data ?? [];
            return Expanded(child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: favouriteEvents.length,
                itemBuilder: (context, index)=> EventItem(event: favouriteEvents[index],markAsFavourite: true,)));
              })

      
        ],
      ),
    );
  }
}
