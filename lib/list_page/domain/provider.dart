import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_workshop/list_page/data/character_repository_impl.dart';
import 'package:flutter_workshop/list_page/data/provider.dart';
import 'package:flutter_workshop/list_page/domain/repository/character.dart';
import 'package:flutter_workshop/list_page/domain/usecase/get_all_characters.dart';

final characterRepositoryProvider = Provider<CharacterRepository>(
  (ref) => CharacterRepositoryImpl(api: ref.read(apiProvider)),
);

final getAllCharctersProvider = Provider(
  (ref) =>
      GetAllCharactersUC(repository: ref.read(characterRepositoryProvider)),
);
