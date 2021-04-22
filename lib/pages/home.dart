import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
//  import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:result_app/detail.dart';
import 'package:result_app/pages/api/api.dart';
import 'package:result_app/pages/news_notifier.dart';
import 'student_login.dart';
import './news.dart';

//import 'package:result_app/Resources/uploadimage.dart';

/*class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text('Logout'),
          onPressed: () {
            auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => StudentLogin()));
          },
        ),
      ),
    );
  }
}
 */

/*class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Student page',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: homepage(),
    );
  }
}

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Widget custombutton(String btnvalue) {
    return MaterialButton(
        padding: EdgeInsets.all(25.0),
        color: Colors.greenAccent,
        highlightColor: Colors.red,
        highlightElevation: 24.0,
        onPressed: () {},
        child: Text(
          "$btnvalue",
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.black,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Push News and Notification',
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16),
                  child: custombutton("Add  Title "),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: custombutton("Add  Title "),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: custombutton("Add  Text  "),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: custombutton("Add  Url     "),
                ),

                /*FlatButton(
              onPressed: () {
            auth.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => StudentLogin()));
          },*/
              ],
            ),
          ),
        )
        //floatingActionButton: 'Logout',

        );
  }
}*/

class Newsform extends StatefulWidget {
  @override
  _NewsformState createState() => _NewsformState();
}

class _NewsformState extends State<Newsform> {
  TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  News _currentNews;
  String _imageUrl;
  File _imageFile;
  final _picker = ImagePicker();
  PickedFile imageFile;
  void initState() {
    super.initState();
    //NewsNotifier foodNotifier = Provider.of<NewsNotifier>(context, listen: false);

    //if (foodNotifier.currentNews != null) {
    //   _currentNews = foodNotifier.currentNews;
    // } else {
    //   _currentNews = News();
    // }
    _currentNews = News();
    _imageUrl = _currentNews.image;
  }

  Future _getLocalImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Widget _showImage() {
    //return Text('Image here');
    if (_imageFile == null && _imageUrl == null) {
      return Text('Select your image');
    } else if (_imageFile != null) {
      return Container(child: Image.file(_imageFile));
    }
  }

  // Widget _buildHeadingField() {
  //   return TextFormField(
  //       decoration: InputDecoration(labelText: 'Heading'),
  //       keyboardType: TextInputType.text,
  //       style: TextStyle(fontSize: 20),
  //       validator: (String value) {
  //         if (value.isEmpty) {
  //           return 'Heading is required';
  //         }

  //         if (value.length < 3 || value.length > 30) {
  //           return 'dsfhdsf';
  //         }
  //         return null;
  //       },
  //       onSaved: (String value) {
  //         if (_currentNews.info != null) {
  //           _currentNews.heading = value;
  //           print('hi ha ha ha');
  //         }
  //       });
  // }

  // Widget _buildInfoField() {
  //   return TextFormField(
  //       decoration: InputDecoration(labelText: 'Context'),
  //       keyboardType: TextInputType.text,
  //       style: TextStyle(fontSize: 20),
  //       validator: (String value) {
  //         if (value.isEmpty) {
  //           return 'Context is required';
  //         }

  //         if (value.length < 3 || value.length > 60) {
  //           return 'dsfhdsf';
  //         }
  //         return null;
  //       },
  //       onSaved: (String value) {
  //         setState(() {
  //           _currentNews.info = value;
  //         });
  //       });
  // }

  _saveNews(context) {
    if (!_formKey.currentState.validate()) {
      return Text('somethings wrong');
    }

    _formKey.currentState.save();

    print("heading: ${_currentNews.heading}");
    print("context: ${_currentNews.info}");
    //print("imageFile: ${_imageFile.tostring()}");
    print("heading: ${_currentNews.heading}");
    print("context: ${_currentNews.info}");

    UploadNewsAndImage(_currentNews, _imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('News Form'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                _showImage(),
                SizedBox(height: 16),
                Text(
                  "Create News",
                  //widget.isUpdating ? "Edit Food" : "Create Food",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 16),
                ButtonTheme(
                    child: RaisedButton(
                  onPressed: () => _getLocalImage(),
                  child: Text(
                    'Add image',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Heading'),
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Heading is required';
                      }

                      //if (value.length < 3 || value.length > 100) {
                        //return 'Heading length should not exceed more than 15 words';
                      //}
                      return null;
                    },
                    onSaved: (String value) {
                      _currentNews.heading = value;
                    }),

                TextFormField(
                    decoration: InputDecoration(labelText: 'Context'),
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Context is required';
                      }

                      //if (value.length < 3 || value.length > 300) {
                        //return 'Heading length should not exceed more than 60 words';
                      //}
                      return null;
                    },

                

                    
                    onSaved: (String value) {
                      setState(() {
                        _currentNews.info = value;
                      });
                    }),

              TextFormField(
                    decoration: InputDecoration(labelText: 'URL associated with the news'),
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'URL is required';
                      }

                      //if (value.length < 3 || value.length > 200) {
                        //return 'Heading length should not exceed more than 60 words';
                      //}
                      return null;
                    },

                

                    
                    onSaved: (String value) {
                      setState(() {
                        _currentNews.info = value;
                      });
                    }),
                // _buildHeadingField(),
                // _buildInfoField(),
              ],
            ),
          ),
        ),
       
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
             Navigator.pushNamed(context, '/');
            return _saveNews(context);
          },
          label: Text('Push Notification'),
          icon: Icon(Icons.save),
        ));
  }
}

