class TaskModel {
  final int? id;
  final String title;
  final String body;
  final String startTime;
  final String endTime;
  final int color;
  final int isCompelet;
  final String date;

  TaskModel({
    this.id,
    required this.title,
    required this.body,
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.isCompelet,
    required this.date,
  });
  factory TaskModel.fromjson(Map<String, dynamic> json) {
    return TaskModel(
        id:json['id'] ,
        title:json['title'] ,
        body: json['note'] ,
        startTime: json['startTime'] ,
        endTime: json['endTime'] ,
        color: json['color'] ,
        isCompelet: json['isCompleted'] ,
        date: json['date'] ,
        );
  }
}
