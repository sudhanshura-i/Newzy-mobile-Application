import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:result_app/pages/UI%20assets/colors.dart';
import 'package:result_app/pages/api/api.dart';
import 'package:result_app/pages/news_notifier.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../detail.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  void initState() {
    super.initState();
    print('asda');
  }

  Widget build(BuildContext context) {
    NewsNotifier newsNotifier = Provider.of<NewsNotifier>(context);

    return Scaffold(
   
      body: FutureBuilder<NewsNotifier>(
          future: getNews(newsNotifier),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
            
              
                return Scaffold(
                    appBar: AppBar(
                      title: Text("IIITG News App"),
                    ),
                    body: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              snapshot.data.currentNews =
                                  snapshot.data.newsList[index];
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return NewsDetail();
                              }));
                            },
                            child: Stack(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(35.0),
                                      topRight: Radius.circular(35.0),
                                    ),
                                    child: Image.network(
                                      snapshot.data.newsList[index].image,
                                      fit: BoxFit.cover,
                                      height: 400.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 350.0, 0.0, 0.0),
                                  child: Container(
                                    height: 200.0,
                                    width: 400.0,
                                    child: Material(
                                      borderRadius: BorderRadius.circular(35.0),
                                      elevation: 10.0,
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20.0, 20.0, 10.0, 20.0),
                                            child: Text(
                                              snapshot
                                                  .data.newsList[index].heading,
                                              style: TextStyle(
                                                fontSize: 25.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: snapshot.data.newsList.length,
                        //autoplay: true,
                        viewportFraction: 0.8,
                        scale: 0.9,
                      ),
                    ));
            }
            return Center(child: CircularProgressIndicator());
          }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          //NewsNotifier.currentNews = null;
          Navigator.pushNamed(context, '/student_login');
        },
        label: Text('Push News'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
