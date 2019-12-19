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
}
