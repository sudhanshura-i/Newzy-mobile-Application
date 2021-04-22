import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'news.dart';


class NewsNotifier extends ChangeNotifier {
  List<News> news_List = [];
  News _currentNews;

  UnmodifiableListView<News> get newsList => UnmodifiableListView(news_List);

  News get currentNews => _currentNews;

  set newsList(List<News> newsList) {
    if (news_List != null) {
      news_List = newsList;
      notifyListeners();
    }
  }

  set currentNews(News news) {
    if (news_List != null) {
      _currentNews = news;
      notifyListeners();
    }
  }
}
