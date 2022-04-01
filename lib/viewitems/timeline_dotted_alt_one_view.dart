import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class TimelineDottedAltOneView extends StatelessWidget {
  final bool isCurrent;
  final String timePosition;

  TimelineDottedAltOneView({
    this.isCurrent = false,
    this.timePosition = "before",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
      child: Stack(children: [
        Positioned.fill(
          child: Column(
            children: [
              Container(
                width: TIMELINE_DASH_WIDTH,
                height: TIMELINE_DASH_HEIGHT,
                color: Colors.black,
              ),
              (isCurrent && timePosition == "before")
                  ? Container(
                width: TIMELINE_DASH_WIDTH,
                height: TIMELINE_DASH_HEIGHT,
                color: Colors.black12,
              )
                  : const SizedBox(height: TIMELINE_DASH_HEIGHT),
              Container(
                width: TIMELINE_DASH_WIDTH,
                height: TIMELINE_DASH_HEIGHT,
                color: (isCurrent && timePosition == "before")
                    ? Colors.black12
                    : Colors.black,
              ),
              (isCurrent && ["before", "sharp"].contains(timePosition))
                  ? Container(
                width: TIMELINE_DASH_WIDTH,
                height: TIMELINE_DASH_HEIGHT,
                color: Colors.black12,
              )
                  : const SizedBox(height: TIMELINE_DASH_HEIGHT),
              Container(
                width: TIMELINE_DASH_WIDTH,
                height: TIMELINE_DASH_HEIGHT,
                color: (isCurrent && ["before", "sharp"].contains(timePosition))
                    ? Colors.black12
                    : Colors.black,
              ),
            ],
          ),
        ),
        Visibility(
          visible: isCurrent,
          child: Align(
            alignment: getCurrentTimePosition(timePosition),
            child: Container(
              width: TIMELINE_WIDTH,
              height: TIMELINE_WIDTH,
              decoration: BoxDecoration(
                color: DARK_BLUE_COLOR,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: Colors.grey,
                  width: TIMELINE_DASH_WIDTH,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  Alignment getCurrentTimePosition(String position) {
    Alignment result;
    switch (position) {
      case "before":
        result = Alignment.topCenter;
        break;
      case "sharp":
        result = Alignment.center;
        break;
      default:
        result = Alignment.bottomCenter;
        break;
    }
    return result;
  }
}