import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:result_app/pages/news_notifier.dart';
import '../news.dart';
import 'package:path/path.dart' as path;
import 'package:uuid/uuid.dart';

Future<NewsNotifier> getNews(NewsNotifier newsNotifier) async {
  List<News> _newsList = [];

  var query = await FirebaseFirestore.instance.collection('News').get();

  for (var doc in query.docs) {
    //print(doc.data());
    News news = News.fromMap(doc.data());
    _newsList.add(news);
  }
  newsNotifier.news_List = _newsList;
  return newsNotifier;
}

UploadNewsAndImage(News news, File localFile) async {
  if (localFile != null) {
    print('uploading image');

    var fileExtension = path.extension(localFile.path);
    print(fileExtension);

    var uuid = Uuid().v4();

    //final StorageRefernce fireBaseStorageRef =
    //  FirebaseStorage.instance.ref().child('/$uuid$fileExtension');
    final Reference Ref =
        FirebaseStorage.instance.ref().child('/$uuid$fileExtension');

    await Ref.putFile(localFile);

    String url = await Ref.getDownloadURL();
    print('download url $url');
    _uploadNews(news, imageUrl: url);

  } else {
    print('skiipping image upload');
    _uploadNews(news);
    
  }
}

_uploadNews(News news, {String imageUrl}) async {
  CollectionReference newsRef =
      await FirebaseFirestore.instance.collection('News');

  if (imageUrl != null) {
    news.image = imageUrl;
  }

  news.createdAt = Timestamp.now();

  DocumentReference docRef = await newsRef.add(news.toMap());

  news.id = docRef.id;

  print('uploaded news succesfully ${news.toString()}');

  await docRef.set(news.toMap());
}
