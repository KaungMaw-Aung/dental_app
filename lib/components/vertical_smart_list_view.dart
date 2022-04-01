import 'package:flutter/material.dart';

class VerticalSmartListView extends StatefulWidget {
  final EdgeInsets padding;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function onListEndReached;
  final Function onListRefreshed;

  VerticalSmartListView({
    required this.padding,
    required this.itemCount,
    required this.itemBuilder,
    required this.onListEndReached,
    required this.onListRefreshed,
  });

  @override
  _VerticalSmartListViewState createState() => _VerticalSmartListViewState();
}

class _VerticalSmartListViewState extends State<VerticalSmartListView> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          print("Start of the list reached");
        } else {
          print("End of the list reached");
          widget.onListEndReached();
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (widget.itemCount > 0)
        ? RefreshIndicator(
          onRefresh: () => refresh(onListRefresh: widget.onListRefreshed),
          child: ListView.builder(
              controller: _scrollController,
              padding: widget.padding,
              scrollDirection: Axis.vertical,
              itemCount: widget.itemCount,
              itemBuilder: widget.itemBuilder,
            ),
        )
        : const Center(
            child: Text("No Events Today!"),
          );
  }

  Future<void> refresh({required Function onListRefresh}) {
    return Future.delayed(Duration(seconds: 3), () => onListRefresh());
  }

}
