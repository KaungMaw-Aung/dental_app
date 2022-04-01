import 'package:dental_app/components/circle_clock_view.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/utils/app_constants.dart';
import 'package:dental_app/widgets/horizontal_appointment_list_view.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SCAFFOLD_BACKGROUND_COLOR,
      appBar: AppBar(
        backgroundColor: LIGHT_BLUE_COLOR,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Today",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_sharp),
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: MARGIN_CARD_MEDIUM_2),
          Icon(Icons.menu_sharp),
          SizedBox(width: MARGIN_MEDIUM_2),
        ],
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: LIGHT_BLUE_COLOR,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: DARK_BLUE_COLOR,
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: MARGIN_XLARGE),
                const Padding(
                  padding: EdgeInsets.only(left: MARGIN_XLARGE),
                  child: Text(
                    "Office No.248",
                    style: TextStyle(
                        color: Colors.white, fontSize: TEXT_REGULAR_3X),
                  ),
                ),
                const SizedBox(height: MARGIN_SMALL),
                const Padding(
                  padding: EdgeInsets.only(left: MARGIN_XLARGE),
                  child: Text(
                    "3 patients",
                    style: TextStyle(
                      color: Colors.white54,
                    ),
                  ),
                ),
                const SizedBox(height: MARGIN_XXLARGE),
                Center(child: CircleClockView()),
                const SizedBox(height: DETAIL_PAGE_APPOINTMENT_LIST_TOP_MERGIN),
                HorizontalAppointmentListView(
                  onTapAppointment: () {},
                  appointments: dummyAppointmentList,
                  isOnHomePage: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
