import 'package:dictionary_app/DatabaseHelper.dart';
import 'package:dictionary_app/Words.dart';

class WordsDao {

  Future<List<Words>> allWords() async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Words(row["kelime_id"], row["ingilizce"], row["turkce"]);
    });
  }

  Future<List<Words>> searchWord(String searchWord) async {
    var db = await DatabaseHelper.databaseAccess();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM kelimeler WHERE ingilizce like '%$searchWord%' or turkce like '%$searchWord%'");

    return List.generate(maps.length, (index) {
      var row = maps[index];
      return Words(row["kelime_id"], row["ingilizce"], row["turkce"]);
    });
  }
}