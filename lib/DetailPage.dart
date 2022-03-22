import 'package:dictionary_app/Words.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  Words word;

  DetailPage(this.word);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dictionary App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "${widget.word.eng}",
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.word.tur}",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
