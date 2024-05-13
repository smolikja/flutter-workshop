import 'package:flutter_workshop/list_page/data/dto/character_list.dart';
import 'package:flutter_workshop/list_page/domain/entity/character_list.dart';

class CharacterListMapper {
  static CharacterListEntity? fromDto(CharacterListDto? dto) {
    if (dto == null) return null;

    return CharacterListEntity(characters: dto.characters)
  }
}
