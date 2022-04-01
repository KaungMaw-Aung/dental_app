class EventVO {
  String eventTitle;
  String eventFromToTime;
  bool isEmptyContainer;
  bool isExpired;

  EventVO(
    this.eventTitle,
    this.eventFromToTime,
    this.isEmptyContainer,
    this.isExpired,
  );
}
