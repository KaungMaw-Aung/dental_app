import 'package:dental_app/components/vertical_smart_list_view.dart';
import 'package:dental_app/data/vos/event_vo.dart';
import 'package:dental_app/resources/dimens.dart';
import 'package:dental_app/viewitems/event_item_view.dart';
import 'package:dental_app/viewitems/transparent_event_item_view.dart';
import 'package:flutter/material.dart';

class VerticalEventListView extends StatelessWidget {
  final List<EventVO> events;
  final Function onEventListEndReached;
  final Function onEventListRefreshed;
  final Function onTapEvent;

  VerticalEventListView({
    required this.events,
    required this.onEventListEndReached,
    required this.onEventListRefreshed,
    required this.onTapEvent,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalSmartListView(
      padding: const EdgeInsets.only(top: EVENT_LIST_MARGIN),
      itemCount: events.length,
      onListEndReached: onEventListEndReached,
      onListRefreshed: onEventListRefreshed,
      itemBuilder: (BuildContext context, int index) {
        return (events[index].isEmptyContainer == false)
            ? EventItemView(
                event: events[index],
                onTapEvent: onTapEvent,
              )
            : TransparentEventItemView();
      },
    );
    // return ListView.builder(
    //   padding: const EdgeInsets.only(top: EVENT_LIST_MARGIN),
    //   scrollDirection: Axis.vertical,
    //   itemCount: events.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return (events[index].isEmptyContainer == false)
    //         ? Container(
    //             padding: const EdgeInsets.only(top: MARGIN_MEDIUM),
    //             height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
    //             decoration: BoxDecoration(
    //               color: Colors.white,
    //               borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2),
    //             ),
    //             child: Row(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 const SizedBox(width: MARGIN_MEDIUM),
    //                 const Icon(
    //                   Icons.access_time_filled,
    //                   color: DARK_BLUE_COLOR,
    //                 ),
    //                 const SizedBox(width: MARGIN_MEDIUM),
    //                 Column(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(events[index].eventTitle),
    //                     const Spacer(),
    //                     Row(
    //                       children: [
    //                         const Icon(
    //                           Icons.access_time,
    //                           size: MARGIN_MEDIUM_2,
    //                         ),
    //                         const SizedBox(width: MARGIN_SMALL),
    //                         Text(
    //                           events[index].eventFromToTime,
    //                           style: const TextStyle(
    //                             fontSize: TEXT_SMALL_2,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     const Spacer(),
    //                   ],
    //                 )
    //               ],
    //             ),
    //           )
    //         : Container(
    //             height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
    //             color: Colors.transparent,
    //           );
    //   },
    // );
  }
}
