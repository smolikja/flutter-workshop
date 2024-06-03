import 'package:flutter_workshop/list_page/data/dto/character_list.dart';
import 'package:flutter_workshop/list_page/data/mapper/character_list.dart';
import 'package:flutter_workshop/list_page/data/source/api.dart';
import 'package:flutter_workshop/list_page/domain/entity/character_list.dart';
import 'package:flutter_workshop/list_page/domain/repository/character.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({required Api api}) : _api = api;

  final Api _api;

  @override
  Future<CharacterListEntity?> getCharacters({int page = 0}) async {
    // dostat DTO z BE
    final charactersDto = await _getCharactersAsDto(page: page);

    // mapovat DTO na Entity
    final charactersEntity = CharacterListMapper.fromDto(charactersDto);

    // vratit Entity
    return charactersEntity;
  }

  Future<CharacterListDto?> _getCharactersAsDto({int page = 0}) async {
    // opt: kontrola cache
    final fetchedCharacters = await _api.loadCharacters(page: page);
    // opt: chachovani
    return fetchedCharacters;
  }
}
