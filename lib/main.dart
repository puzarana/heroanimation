import 'package:flutter/material.dart';

void main() {
  runApp(MyFirstProject());
}

class MyFirstProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHeroAnimation(),

    );
  }
}

class PhotoHero extends StatelessWidget {
  PhotoHero({Key key,this.photo,this.width,this.onTap}):super(key: key);  //constructor created

final double width;
final String photo;
final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new SizedBox(
      width: width,
      child: new Hero(
        tag: photo,     //this is compulsory for both pages
        child: Material(
          child: InkWell(
            onTap: onTap,
            child: Image.asset(photo),
          ),
        ),),
    );
  }
}


class MyHeroAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(actions: <Widget>[
        new Text("My Hero Animation Page"),
      ],),

      body: Center(
        child: new PhotoHero(
          photo: 'assets/girl.jpg',
          width: 300.0,
          onTap: (){
            Navigator.of(context).push(new MaterialPageRoute<Null>(
              builder: (BuildContext context){
                return new Scaffold(
                  appBar: new AppBar(
                    title: new Text("second page"),
                  ),
                 body: new Container(
                   child: new PhotoHero(
                     photo: 'assets/girl.jpg',
                     width: 100.0,
                     onTap: (){
                       Navigator.of(context).pop();
                     },
                   ),
                 ),
                );
              }
            ));
          },
        ),
      ),
    );
  }
}