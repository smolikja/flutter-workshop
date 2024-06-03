import 'package:flutter_workshop/list_page/data/dto/character.dart';
import 'package:flutter_workshop/list_page/data/dto/character_list.dart';
import 'package:flutter_workshop/list_page/data/mapper/character.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';
import 'package:flutter_workshop/list_page/domain/entity/character_list.dart';

class CharacterListMapper {
  static CharacterListEntity? fromDto(CharacterListDto? dto) {
    if (dto == null) return null;

    final charactersEnt = dto.characters
        ?.map(CharacterMapper.fromDto)
        .whereType<CharacterEntity>()
        .toList();

    return CharacterListEntity(characters: charactersEnt);
  }

  static CharacterListDto? toDto(CharacterListEntity? entity) {
    if (entity == null) return null;

    final charactersDto = entity.characters
        ?.map(CharacterMapper.toDto)
        .whereType<CharacterDto>()
        .toList();

    return CharacterListDto(characters: charactersDto);
  }
}
