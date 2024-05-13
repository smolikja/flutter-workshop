import 'package:equatable/equatable.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';

class CharacterListEntity with EquatableMixin {
  CharacterListEntity({this.characters});

  final List<CharacterEntity>? characters;

  @override
  List<Object?> get props => [
        characters,
      ];
}
