import 'package:dictionary_app/DetailPage.dart';
import 'package:dictionary_app/WordsDao.dart';
import 'package:flutter/material.dart';

import 'Words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  bool isSearching = false;
  String searchWord = "";

  Future<List<Words>> getAllWord() async {
    var list = await WordsDao().allWords();
    return list;
  }

  Future<List<Words>> search(String search) async {
    var list = await WordsDao().searchWord(search);
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching ?  TextField(
          decoration: InputDecoration(hintText: "Search"),
          onChanged: (searchResult) {
            print(searchResult);
            setState(() {
              searchWord = searchResult;
            });
          },
        ) : Text("Dictionary App") ,
        actions: [
          isSearching ? IconButton(onPressed: () {
            setState(() {
              isSearching = false;
            });
          }, icon: Icon(Icons.cancel))
          :
          IconButton(onPressed: () {
            setState(() {
              isSearching = true;
            });
          }, icon: Icon(Icons.search))
        ],
      ),
      body: FutureBuilder<List<Words>>(
        future: isSearching ? search(searchWord) : getAllWord(),
        builder: (context,snapshot) {
          if(snapshot.hasData){
            var list = snapshot.data;
            return ListView.builder(
              itemCount: list!.length,
              itemBuilder: (context,i) {
                var word = list[i];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(list[i])));
                  },
                  child: SizedBox(
                    height: 50,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("${word.eng}",style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("${word.tur}",textAlign: TextAlign.start,),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },
      ),
    );
  }
}
