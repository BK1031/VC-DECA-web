import 'package:firebase/firebase.dart';

class Announcement {
  String key;
  String title;
  String author;
  String date;
  String body;

  Announcement(this.title, this.date, this.body);

  Announcement.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.val()["title"].toString(),
        author = snapshot.val()["author"].toString(),
        date = snapshot.val()["date"].toString(),
        body = snapshot.val()["body"].toString();

  @override
  String toString() {
    return "$title - $author - $body";
  }


}