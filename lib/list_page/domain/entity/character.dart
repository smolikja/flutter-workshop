import 'package:equatable/equatable.dart';
import 'package:flutter_workshop/list_page/domain/entity/location.dart';

class CharacterEntity with EquatableMixin {
  CharacterEntity({
    required this.id,
    this.name,
    this.status,
    this.location,
    required this.image,
  });

  final int id;
  final String? name;
  final String? status;
  final LocationEntity? location;
  final String image;

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        location,
        image,
      ];

  bool get isAlive => status == 'Alive';
}
