import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/resources/colors.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class EventItemView extends StatelessWidget {
  final EventVO event;
  final Function onTapEvent;

  EventItemView({
    required this.event,
    required this.onTapEvent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!event.isExpired) {
          onTapEvent();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: MARGIN_MEDIUM),
        height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: MARGIN_MEDIUM),
            const Icon(
              Icons.access_time_filled,
              color: DARK_BLUE_COLOR,
            ),
            const SizedBox(width: MARGIN_MEDIUM),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(event.eventTitle),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: MARGIN_MEDIUM_2,
                    ),
                    const SizedBox(width: MARGIN_SMALL),
                    Text(
                      event.eventFromToTime,
                      style: const TextStyle(
                        fontSize: TEXT_SMALL_2,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
