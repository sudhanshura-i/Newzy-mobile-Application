import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:result_app/pages/UI%20assets/colors.dart';
import 'package:result_app/pages/news_notifier.dart';



class NewsDetail extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    NewsNotifier newsNotifier = Provider.of<NewsNotifier>(
      context,
    );
    return Scaffold(
       appBar: AppBar(
         title: Text('IIITG News updates'),
       ),
       
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.2),
            child: Image.network(newsNotifier.currentNews.image,
              
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
            child: Text(
              newsNotifier.currentNews.heading,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18.0),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                newsNotifier.currentNews.info,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
              )),
        ],
      ),
    floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(16.0, 16 * 2.0, 16.0, 4.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            //Utils.launchURL(url);
          },
          child: Container(
            width: double.infinity,
            height: 50,
            child: Center(
                child: Text(
              "For mor information click here",
              style: TextStyle(color: Colors.white),
            )),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

    );
  }
}













































































//       body: SafeArea(
      //   bottom: false,
      //   child: Stack(
      //     children: <Widget>[
      //       SingleChildScrollView(
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: <Widget>[
      //             Padding(
      //               padding: const EdgeInsets.all(32.0),
      //               child: Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: <Widget>[
      //                   SizedBox(height: 300),
      //                   Text(
      //                     //planetInfo.name,
      //                     'Kabbadi',
      //                     style: TextStyle(
      //                       fontFamily: 'Avenir',
      //                       fontSize: 56,
      //                       color: primaryTextColor,
      //                       fontWeight: FontWeight.w900,
      //                     ),
      //                     textAlign: TextAlign.left,
      //                   ),
      //                   Text(
      //                     'Solar System',
      //                     style: TextStyle(
      //                       fontFamily: 'Avenir',
      //                       fontSize: 31,
      //                       color: primaryTextColor,
      //                       fontWeight: FontWeight.w300,
      //                     ),
      //                     textAlign: TextAlign.left,
      //                   ),
      //                   Divider(color: Colors.black38),
      //                   SizedBox(height: 32),
      //                   Text(newsNotifier.currentNews.heading!=null? newsNotifier.currentNews.heading:'Loading',
      //                     //planetInfo.description ?? '',
      //                     maxLines: 5,
      //                     overflow: TextOverflow.ellipsis,
      //                     style: TextStyle(
      //                       fontFamily: 'Avenir',
      //                       fontSize: 20,
      //                       color: contentTextColor,
      //                       fontWeight: FontWeight.w500,
      //                     ),
      //                   ),
      //                   SizedBox(height: 32),
      //                   Divider(color: Colors.black38),
      //                 ],
      //               ),
      //             ),
      //             Padding(
      //               padding: const EdgeInsets.only(left: 32.0),
      //               child: Text(
      //                 'Gallery',
      //                 style: TextStyle(
      //                   fontFamily: 'Avenir',
      //                   fontSize: 25,
      //                   color: const Color(0xff47455f),
      //                   fontWeight: FontWeight.w300,
      //                 ),
      //                 textAlign: TextAlign.left,
      //               ),
      //             ),
      //             Container(
      //               height: 250,
      //               padding: const EdgeInsets.only(left: 32.0),
      //               child: ListView.builder(
      //                   //itemCount: 
      //                   scrollDirection: Axis.horizontal,
      //                   itemBuilder: (context, index) {
      //                     return Card(
      //                       clipBehavior: Clip.antiAlias,
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(24),
      //                       ),
      //                       child: AspectRatio(
      //                           aspectRatio: 1,
      //                           child: Image.network(
      //                             newsNotifier.currentNews.image,
      //                             fit: BoxFit.cover,
      //                           )),
      //                     );
      //                   }),
      //             ),
      //           ],
      //         ),
      //       ),
      //       // Positioned(
      //       //   right: -64,
      //       //   child: Hero(
      //       //       tag: news.id,
      //       //       child: Image.asset(id.iconImage)),
      //       // ),
      //       Positioned(
      //         top: 60,
      //         left: 32,
      //         child: Text(
      //           news.id.toString(),
      //           style: TextStyle(
      //             fontFamily: 'Avenir',
      //             fontSize: 247,
      //             color: primaryTextColor.withOpacity(0.08),
      //             fontWeight: FontWeight.w900,
      //           ),
      //           textAlign: TextAlign.left,
      //         ),
      //       ),
      //       IconButton(
      //         icon: Icon(Icons.arrow_back_ios),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ],
      //   ),
      // ),