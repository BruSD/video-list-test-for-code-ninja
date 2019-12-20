class VideoCN {
  String documentID; //firebase document ID
  String name;
  final String videoImagePreview;
  final String videoURL;
  final DateTime creationDate;

  VideoCN({
    this.documentID,
    this.name,
    this.videoImagePreview,
    this.videoURL,
    this.creationDate,
  });

  VideoCN videoFromJson(Map<String, dynamic> json) {
    return VideoCN(
      name: json['barcode'] as String,
      videoImagePreview: json['videoImagePreview'] as String,
      videoURL: json['videoURL'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
    );
  }

  Map<String, dynamic> videoModelToJson() => <String, dynamic>{
        'name': this.name,
        'videoImagePreview': this.videoImagePreview,
        'videoURL': this.videoURL,
        'creationDate': this.creationDate.toIso8601String(),
      };
}
