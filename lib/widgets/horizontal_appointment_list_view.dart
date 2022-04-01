import 'package:dental_app/data/vos/appointment_vo.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/viewitems/appointment_item_view.dart';
import 'package:flutter/material.dart';

class HorizontalAppointmentListView extends StatelessWidget {
  final Function onTapAppointment;
  final List<AppointmentVO> appointments;
  final bool isOnHomePage;

  HorizontalAppointmentListView({
    required this.onTapAppointment,
    required this.appointments,
    required this.isOnHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: APPOINTMENT_LIST_HEIGHT,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: MARGIN_XLARGE),
        scrollDirection: Axis.horizontal,
        itemCount: appointments.length,
        itemBuilder: (BuildContext context, int index) {
          return AppointmentItemView(
            appointment: appointments[index],
            index: index,
            onTapAppointment: onTapAppointment,
            isOnHomePage: isOnHomePage,
          );
        },
      ),
    );
  }
}
