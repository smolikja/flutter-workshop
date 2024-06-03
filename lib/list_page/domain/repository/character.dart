import 'package:flutter_workshop/list_page/domain/entity/character_list.dart';

abstract class CharacterRepository {
  Future<CharacterListEntity?> getCharacters({int page = 0});
}
