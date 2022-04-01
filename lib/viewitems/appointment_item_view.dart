import 'package:dental_app/data/vos/appointment_vo.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class AppointmentItemView extends StatelessWidget {
  final AppointmentVO appointment;
  final int index;
  final Function onTapAppointment;
  final bool isOnHomePage;

  AppointmentItemView({
    required this.appointment,
    required this.index,
    required this.onTapAppointment,
    required this.isOnHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapAppointment(),
      child: Container(
        width: APPOINTMENT_LIST_ITEM_WIDTH,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          color: isOnHomePage ? APPOINTMENT_CARD_LEFT_BORDER_COLOR : Colors.white,
        ),
        margin: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
        child: Row(
          children: [
            // left border
            Container(
              width: APPOINTMENT_LIST_ITEM_WIDTH * 0.04,
              decoration: BoxDecoration(
                  color: isOnHomePage
                      ? APPOINTMENT_CARD_LEFT_BORDER_COLOR
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(MARGIN_MEDIUM),
                    bottomLeft: Radius.circular(MARGIN_MEDIUM),
                  )),
            ),
            Container(
              width: APPOINTMENT_LIST_ITEM_WIDTH * 0.96,
              decoration: BoxDecoration(
                color: _generateAppointmentItemColor(isOnHomePage, index),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(MARGIN_MEDIUM),
                  bottomRight: Radius.circular(MARGIN_MEDIUM),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  OfficeNumberAndTotalPatientsView(
                    office: appointment.office,
                    totalPatients: appointment.totalPatients,
                    isOnHomePage: isOnHomePage,
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  TimeFromTimeToView(
                    fromToTime: appointment.fromToTime,
                    isOnHomePage: isOnHomePage,
                  ),
                  const SizedBox(height: MARGIN_MEDIUM_2),
                  const PatientProfilesAndCheckIconView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _generateAppointmentItemColor(bool isOnHomePage, int index) {
    if (isOnHomePage) {
      return index.isEven
          ? APPOINTMENT_CARD_DARK_BLUE_COLOR
          : APPOINTMENT_CARD_LIGHT_BLUE_COLOR;
    } else {
      return Colors.white;
    }
  }
}

class PatientProfilesAndCheckIconView extends StatelessWidget {
  const PatientProfilesAndCheckIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MARGIN_MEDIUM_2),
        Row(
          children: const [
            CircleAvatar(
              radius: MARGIN_CARD_MEDIUM_2,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzfG4grVjejPN1T_WwTFu0ig24GINUAjokZA&usqp=CAU",
              ),
            ),
            SizedBox(width: MARGIN_SMALL),
            CircleAvatar(
              radius: MARGIN_CARD_MEDIUM_2,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzfG4grVjejPN1T_WwTFu0ig24GINUAjokZA&usqp=CAU",
              ),
            ),
            SizedBox(width: MARGIN_SMALL),
            CircleAvatar(
              radius: MARGIN_CARD_MEDIUM_2,
              backgroundImage: NetworkImage(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzfG4grVjejPN1T_WwTFu0ig24GINUAjokZA&usqp=CAU",
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(
          Icons.check_circle,
          color: APPOINTMENT_CARD_CHECK_ICON_COLOR,
        ),
        const SizedBox(width: MARGIN_MEDIUM_2),
      ],
    );
  }
}

class TimeFromTimeToView extends StatelessWidget {
  final String fromToTime;
  final bool isOnHomePage;

  TimeFromTimeToView({
    required this.fromToTime,
    required this.isOnHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MARGIN_MEDIUM_2),
        Icon(
          Icons.access_time,
          color: isOnHomePage ? Colors.white : Colors.black,
        ),
        const SizedBox(width: MARGIN_SMALL),
        Text(
          fromToTime,
          style: TextStyle(
            color: isOnHomePage ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}

class OfficeNumberAndTotalPatientsView extends StatelessWidget {
  final String office;
  final int totalPatients;
  final bool isOnHomePage;

  OfficeNumberAndTotalPatientsView({
    required this.office,
    required this.totalPatients,
    required this.isOnHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MARGIN_MEDIUM_2),
        Text(
          "$office ",
          style: TextStyle(
            color: isOnHomePage ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          " / $totalPatients patients",
          style: TextStyle(
            color: isOnHomePage ? Colors.white : Colors.black,
          ),
        ),
      ],
    );
  }
}
