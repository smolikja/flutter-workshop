import 'package:flutter_workshop/list_page/domain/entity/character_list.dart';
import 'package:flutter_workshop/list_page/domain/repository/character.dart';

class GetAllCharactersUC {
  GetAllCharactersUC({required CharacterRepository repository})
      : _repository = repository;

  final CharacterRepository _repository;

  Future<CharacterListEntity?> call({int page = 0}) async {
    final list = await _repository.getCharacters(page: page);
    return list;
  }
}
