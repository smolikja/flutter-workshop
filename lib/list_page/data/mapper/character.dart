import 'package:flutter_workshop/list_page/data/dto/character.dart';
import 'package:flutter_workshop/list_page/data/mapper/location.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';

class CharacterMapper {
  static CharacterEntity? fromDto(CharacterDto? dto) {
    if (dto == null) return null;

    return CharacterEntity(
      id: dto.id,
      name: dto.name,
      status: dto.status,
      location: LocationMapper.fromDto(dto.location),
      image: dto.image,
    );
  }
}
