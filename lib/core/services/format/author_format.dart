import 'package:smoothy/app/core/domain/entities/song_entity.dart';

class AuthorFormat {
  AuthorFormat._();
  static String format(SongEntity songEntity) {
    String result = '';
    for(var author in songEntity.author) {
      if(author != songEntity.author.last) {
        result += '${author.name}, ';
      } else {
        result += author.name;
      }
    }
    return result;
  }
}