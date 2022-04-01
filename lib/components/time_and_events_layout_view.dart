import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/viewitems/timeline_dotted_alt_one_view.dart';
import 'package:dental_app/viewitems/timeline_dotted_alt_two_view.dart';
import 'package:dental_app/widgets/vertical_event_list_view.dart';
import 'package:flutter/material.dart';

class TimeAndEventsLayoutView extends StatelessWidget {
  final String currentTime;
  final String timePosition;
  final List<String> timeList;
  final List<EventVO> eventList;
  final Function onEventListEndReached;
  final Function onEventListRefreshed;
  final Function onTapEvent;

  TimeAndEventsLayoutView({
    required this.currentTime,
    required this.timePosition,
    required this.timeList,
    required this.eventList,
    required this.onEventListEndReached,
    required this.onEventListRefreshed,
    required this.onTapEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          VerticleTimeListSectionView(
            timeList: timeList,
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: TimelineBackgroundDividerView(
                    currentTime: currentTime,
                    timePosition: timePosition,
                    timeList: timeList,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TimelineWithCurrentTimeView(
                    currentTime: currentTime,
                    timePosition: timePosition,
                    timeList: timeList,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Builder(
                    builder: (context) {
                      return VerticalEventListSectionView(
                        events: eventList,
                        onEventListEndReached: onEventListEndReached,
                        onEventListRefreshed: onEventListRefreshed,
                        onTapEvent: onTapEvent,
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
}

class VerticalEventListSectionView extends StatelessWidget {
  final List<EventVO> events;
  final Function onEventListEndReached;
  final Function onEventListRefreshed;
  final Function onTapEvent;

  VerticalEventListSectionView({
    required this.events,
    required this.onEventListEndReached,
    required this.onEventListRefreshed,
    required this.onTapEvent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(left: MARGIN_XLARGE),
          height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Events",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: MARGIN_LARGE),
            child: VerticalEventListView(
              events: events,
              onEventListEndReached: onEventListEndReached,
              onEventListRefreshed: onEventListRefreshed,
              onTapEvent: onTapEvent,
            ),
          ),
        ),
      ],
    );
  }
}

class TimelineBackgroundDividerView extends StatelessWidget {
  final String currentTime;
  final String timePosition;
  final List<String> timeList;

  TimelineBackgroundDividerView({
    required this.currentTime,
    required this.timePosition,
    required this.timeList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: MARGIN_SMALL),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: timeList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return generateTimelineDividerListItemView(
            index,
            getCurrentTimeIndexOnTimeline(currentTime),
            timePosition,
          );
        },
      ),
    );
  }

  Widget generateTimelineDividerListItemView(
    int index,
    int currentTimeIndex,
    String timePosition,
  ) {
    if (index < currentTimeIndex) {
      return Container(
        height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
        color: SCAFFOLD_BACKGROUND_COLOR,
      );
    } else if (index == currentTimeIndex) {
      return generateCurrentTimeDividerItem(timePosition);
    } else {
      return Container(
        height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
        color: Colors.black12,
      );
    }
  }

  Widget generateCurrentTimeDividerItem(String timePosition) {
    if (timePosition == "sharp") {
      return Container(
        child: Column(
          children: [
            Container(
              height: LIST_ITEM_HEIGHT_IN_TIME_EVENT / 2,
              color: SCAFFOLD_BACKGROUND_COLOR,
            ),
            Container(
              height: LIST_ITEM_HEIGHT_IN_TIME_EVENT / 2,
              color: Colors.black12,
            ),
          ],
        ),
      );
    } else if (timePosition == "before") {
      return Container(
        child: Column(
          children: [
            Container(
              height: LIST_ITEM_HEIGHT_IN_TIME_EVENT / 10,
              color: SCAFFOLD_BACKGROUND_COLOR,
            ),
            Container(
              height: LIST_ITEM_HEIGHT_IN_TIME_EVENT - 5,
              color: Colors.black12,
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            Container(
              height: LIST_ITEM_HEIGHT_IN_TIME_EVENT - 8,
              color: SCAFFOLD_BACKGROUND_COLOR,
            ),
            Container(
              height: LIST_ITEM_HEIGHT_IN_TIME_EVENT - 45,
              color: Colors.black12,
            ),
          ],
        ),
      );
    }
  }

  int getCurrentTimeIndexOnTimeline(String current) {
    int index;
    switch (current) {
      case "8:00":
        index = 1;
        break;
      case "8:30":
        index = 2;
        break;
      case "9:00":
        index = 3;
        break;
      case "9:30":
        index = 4;
        break;
      case "10:00":
        index = 5;
        break;
      case "10:30":
        index = 6;
        break;
      case "11:00":
        index = 7;
        break;
      case "11:30":
        index = 8;
        break;
      case "12:00":
        index = 9;
        break;
      case "12:30":
        index = 10;
        break;
      case "1:00":
        index = 11;
        break;
      case "1:30":
        index = 12;
        break;
      case "2:00":
        index = 13;
        break;
      case "2:30":
        index = 14;
        break;
      case "3:00":
        index = 15;
        break;
      case "3:30":
        index = 16;
        break;
      default:
        index = 17;
        break;
    }
    return index;
  }
}

class TimelineWithCurrentTimeView extends StatelessWidget {
  final String currentTime;
  final String timePosition;
  final List<String> timeList;

  TimelineWithCurrentTimeView({
    required this.currentTime,
    required this.timePosition,
    required this.timeList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: TIMELINE_WIDTH,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: timeList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return generateTimelineListItemView(
            index,
            getCurrentTimeIndexOnTimeline(currentTime),
            timePosition,
          );
        },
      ),
    );
  }

  Widget generateTimelineListItemView(
    int index,
    int currentTimeIndex,
    String timePosition,
  ) {
    if (index <= currentTimeIndex) {
      return index.isEven
          ? TimelineDottedAltOneView(
              isCurrent: index == currentTimeIndex,
              timePosition: timePosition,
            )
          : TimelineDottedAltTwoView(
              isCurrent: index == currentTimeIndex,
              timePosition: timePosition,
            );
    } else {
      return Center(
        child: Container(
          height: 50,
          width: 3,
          color: Colors.black12,
        ),
      );
    }
  }

  int getCurrentTimeIndexOnTimeline(String current) {
    int index;
    switch (current) {
      case "8:00":
        index = 1;
        break;
      case "8:30":
        index = 2;
        break;
      case "9:00":
        index = 3;
        break;
      case "9:30":
        index = 4;
        break;
      case "10:00":
        index = 5;
        break;
      case "10:30":
        index = 6;
        break;
      case "11:00":
        index = 7;
        break;
      case "11:30":
        index = 8;
        break;
      case "12:00":
        index = 9;
        break;
      case "12:30":
        index = 10;
        break;
      case "1:00":
        index = 11;
        break;
      case "1:30":
        index = 12;
        break;
      case "2:00":
        index = 13;
        break;
      case "2:30":
        index = 14;
        break;
      case "3:00":
        index = 15;
        break;
      case "3:30":
        index = 16;
        break;
      default:
        index = 17;
        break;
    }
    return index;
  }
}

class VerticleTimeListSectionView extends StatelessWidget {
  final List<String> timeList;

  VerticleTimeListSectionView({required this.timeList});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: MARGIN_MEDIUM),
      width: MediaQuery.of(context).size.width * 0.2,
      child: Column(
        children: [
          Container(
            height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
            child: const Center(
              child: Text(
                "Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: timeList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
                  child: Center(
                    child: Text(
                      timeList[index],
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
