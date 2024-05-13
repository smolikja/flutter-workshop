import 'package:flutter_workshop/list_page/data/dto/location.dart';
import 'package:flutter_workshop/list_page/domain/entity/location.dart';

class LocationMapper {
  static LocationEntity? fromDto(LocationDto? dto) {
    if (dto == null) return null;

    return LocationEntity(name: dto.name, url: dto.url);
  }

  static LocationDto? toDto(LocationEntity? entity) {
    if (entity == null) return null;

    return LocationDto(name: entity.name, url: entity.url);
  }
}
