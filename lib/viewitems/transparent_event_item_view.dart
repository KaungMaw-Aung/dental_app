import 'package:dental_app/resources/dimens.dart';
import 'package:flutter/material.dart';

class TransparentEventItemView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: LIST_ITEM_HEIGHT_IN_TIME_EVENT,
      color: Colors.transparent,
    );
  }
}
