import 'package:dental_app/data/vos/appointment_vo.dart';
import 'package:dental_app/data/vos/event_vo.dart';

List<AppointmentVO> dummyAppointmentList = [
  AppointmentVO("Office No.248", 3, "08:30 AM - 02:00 PM"),
  AppointmentVO("Office No.258", 4, "09:00 AM - 09:30 PM"),
  AppointmentVO("Office No.268", 1, "02:30 AM - 04:00 PM"),
  AppointmentVO("Office No.278", 2, "08:30 AM - 02:00 PM"),
];

List<String> dummyTimeList = [
  "8:00",
  "8:30",
  "9:00",
  "9:30",
  "10:00",
  "10:30",
  "11:00",
  "11:30",
  "12:00",
  "12:30",
  "1:00",
  "1:30",
  "2:00",
  "2:30",
  "3:00",
  "3:30",
  "4:00",
];

List<EventVO> dummyEventList = [
  EventVO(
    "Event Title One",
    "8:00 AM - 8:30 PM",
    false,
    true,
  ),
  EventVO(
    "",
    "",
    true,
    false,
  ),
  EventVO(
    "Event Title Two",
    "9:00 AM - 9:30 PM",
    false,
    false,
  ),
  EventVO(
    "",
    "",
    true,
    false,
  ),
  EventVO(
    "Event Title Three",
    "10:00 AM - 10:30 PM",
    false,
    false,
  ),
  EventVO(
    "",
    "",
    true,
    false,
  ),
  EventVO(
    "Event Title Three",
    "10:00 AM - 10:30 PM",
    false,
    false,
  ),
  EventVO(
    "",
    "",
    true,
    false,
  ),
  EventVO(
    "Event Title Three",
    "10:00 AM - 10:30 PM",
    false,
    false,
  ),
];