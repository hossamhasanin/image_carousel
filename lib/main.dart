import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int index = 0;

  List<String> photos = [
    "assets/knowledg.jpg",
    "assets/sunrise.jpg",
    "assets/workplace.jpg"
  ];

  void _previousImage() {
    setState(() {
      index = index > 0 ? index - 1 : 0;
    });
  }

  void _nextImage(){
    setState(() {
      index = index < photos.length-1 ? index+1 : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image carousel"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Stack(
              children: <Widget>[
                Container(
                  height: 400.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    image: DecorationImage(image: AssetImage(photos[index]) , fit: BoxFit.cover)
                  ),
                ),
                Positioned(
                  top: 375.0,
                  left: 25.0,
                  right: 25.0,
                  child: SelectedPhoto(numberOfDots: photos.length , selectedIndex: index),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("Previous" , style: TextStyle(color: Colors.white)),
                onPressed: _previousImage,
                elevation: 5.0,
                color: Colors.red,
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                child: Text("Next", style: TextStyle(color: Colors.white)),
                onPressed: _nextImage,
                elevation: 5.0,
                color: Colors.blue,
              )
            ],
          )
        ],
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {

  int numberOfDots;
  int selectedIndex;

  SelectedPhoto({this.numberOfDots , this.selectedIndex});

  Widget _inActivePhote(){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: 8.0,
          width: 8.0,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(4.0)
          ),
        ),
      ),
    );
  }

  Widget _activePhote(){
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0
              )
            ]
          ),
        ),
      ),
    );
  }

  List<Widget> _buildDots(){
    List<Widget> dots = [];

    for(int i = 0;i<numberOfDots;++i){
      dots.add(
        i == selectedIndex ? _activePhote(): _inActivePhote()
      );
    }

    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}

