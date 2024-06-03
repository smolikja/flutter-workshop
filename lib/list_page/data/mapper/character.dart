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

  static CharacterDto? toDto(CharacterEntity? entity) {
    if (entity == null) return null;

    return CharacterDto(
      id: entity.id,
      name: entity.name,
      status: entity.status,
      location: LocationMapper.toDto(entity.location),
      image: entity.image,
    );
  }
}
