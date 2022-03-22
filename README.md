# Dictionary App by Flutter



## About The Project

I have made a Turkish-English dictionary app in this project. I can receive dictionaries from the database thanks to sqlite. And You can search words in this application. I also did this thanks to sqlite. <br>

With the following sql query,I can search the words from database
```dart
 Future<List<Words>> searchWord(String searchWord) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$searchWord%' or turkce like '%$searchWord%'");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Words(row["kelime_id"], row["ingilizce"], row["turkce"]);
    });
```


![image](https://user-images.githubusercontent.com/79968953/159443679-4d7cc9aa-91a0-47d5-8c52-a18f5765bf9e.png)
![image](https://user-images.githubusercontent.com/79968953/159443762-07950ca3-3623-4129-ba74-6b4e4a97b8fe.png)
![image](https://user-images.githubusercontent.com/79968953/159443831-b9a1885f-b8bf-4be8-a580-004656159bf8.png)


