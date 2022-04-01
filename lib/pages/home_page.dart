import 'package:dental_app/components/time_and_events_layout_view.dart';
import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/pages/detail_page.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/utils/app_constants.dart';
import 'package:dental_app/widgets/horizontal_appointment_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// states
  List<EventVO> eventList = dummyEventList;
  String selectedDate = "Today";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SCAFFOLD_BACKGROUND_COLOR,
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: HomePageTopGradientView(),
          ),
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: HOME_PAGE_TOP_MARGIN),
                const SearchBarAndCircleAvatarView(),
                const SizedBox(height: MARGIN_LARGE),
                PatientsCountAndChooseDateView(
                  onChangedDate: (date) {
                    setState(() {
                      eventList = (date == "Today") ? dummyEventList : [];
                      selectedDate = date;
                    });
                  },
                  selectedDate: selectedDate,
                ),
                const SizedBox(height: MARGIN_LARGE),
                HorizontalAppointmentListView(
                  appointments: dummyAppointmentList,
                  onTapAppointment: () => _navigateToDetailPage(context),
                  isOnHomePage: true,
                ),
                const SizedBox(height: MARGIN_LARGE),
                Expanded(
                  child: TimeAndEventsLayoutView(
                    currentTime: '8:30',
                    timePosition: 'ahead',
                    timeList: dummyTimeList,
                    eventList: eventList,
                    onEventListEndReached: () {
                      _showSnackBar(
                        context,
                        "Event List End Reached",
                      );
                    },
                    onTapEvent: () => _navigateToDetailPage(context),
                    onEventListRefreshed: () {
                      _showSnackBar(
                        context,
                        "Event List Refreshed",
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
            label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

class PatientsCountAndChooseDateView extends StatelessWidget {
  final Function(String) onChangedDate;
  final String selectedDate;

  PatientsCountAndChooseDateView({
    required this.onChangedDate,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: MARGIN_XLARGE),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "My Patients",
              style: TextStyle(
                color: Colors.white,
                fontSize: TEXT_REGULAR_3X,
              ),
            ),
            SizedBox(height: MARGIN_SMALL),
            Text(
              "12 total",
              style: TextStyle(
                color: Color.fromRGBO(255, 255, 255, 0.7),
              ),
            ),
          ],
        ),
        const Spacer(),
        ChooseDateDropDownView(
          onChangedDate: onChangedDate,
          selectedDate: selectedDate,
        ),
        const SizedBox(width: MARGIN_XLARGE),
      ],
    );
  }
}

class ChooseDateDropDownView extends StatelessWidget {
  final Function(String) onChangedDate;
  final String selectedDate;

  ChooseDateDropDownView({
    required this.onChangedDate,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
      decoration: BoxDecoration(
        color: HOME_PAGE_DROPDOWN_BUTTON_COLOR,
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
      ),
      child: DropdownButton(
        items: const [
          DropdownMenuItem(
            child: Text("Today"),
            value: "Today",
          ),
          DropdownMenuItem(
            child: Text("Tomorrow"),
            value: "Tomorrow",
          ),
        ],
        value: selectedDate,
        onChanged: (value) => onChangedDate(value.toString()),
        underline: Container(
          width: 0,
          height: 0,
        ),
        iconEnabledColor: Colors.white,
        style: const TextStyle(color: Colors.white),
        dropdownColor: HOME_PAGE_DROPDOWN_BUTTON_COLOR,
      ),
    );
  }
}

class SearchBarAndCircleAvatarView extends StatelessWidget {
  const SearchBarAndCircleAvatarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        SizedBox(width: MARGIN_XLARGE),
        SearchBarView(),
        SizedBox(width: MARGIN_MEDIUM_2),
        CircleAvatarWithBadgeView(),
        SizedBox(width: MARGIN_XLARGE),
      ],
    );
  }
}

class CircleAvatarWithBadgeView extends StatelessWidget {
  const CircleAvatarWithBadgeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: HOME_PAGE_AVATAR_SIZE,
      height: HOME_PAGE_AVATAR_SIZE,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: HOME_PAGE_AVATAR_SIZE,
              height: HOME_PAGE_AVATAR_SIZE,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  HOME_PAGE_AVATAR_SIZE / 2,
                ),
                border: Border.all(
                  color: Colors.white,
                  width: HOME_PAGE_AVATAR_BORDER_WIDTH,
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzfG4grVjejPN1T_WwTFu0ig24GINUAjokZA&usqp=CAU"),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: MARGIN_MEDIUM_2,
              height: MARGIN_MEDIUM_2,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
              ),
              child: const Center(
                child: Text(
                  "4",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: TEXT_SMALL,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SearchBarView extends StatelessWidget {
  const SearchBarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          top: MARGIN_MEDIUM,
          bottom: MARGIN_MEDIUM,
          left: MARGIN_LARGE,
          right: MARGIN_SMALL,
        ),
        height: HOME_PAGE_SEARCH_BAR_HEIGHT,
        decoration: BoxDecoration(
          color: HOME_PAGE_SEARCH_BAR_COLOR,
          borderRadius: BorderRadius.circular(MARGIN_LARGE),
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class HomePageTopGradientView extends StatelessWidget {
  const HomePageTopGradientView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [LIGHT_BLUE_COLOR, DARK_BLUE_COLOR])),
    );
  }
}
