import 'package:flutter/material.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';
import 'package:flutter_workshop/list_page/domain/entity/location.dart';
import 'package:flutter_workshop/list_page/presentation/widgets/character_list_item.dart';
import 'package:flutter_workshop/list_page/presentation/widgets/character_list_item_header.dart';

class ListPageContent extends StatefulWidget {
  const ListPageContent({super.key});

  @override
  State<ListPageContent> createState() => _ListPageContentState();
}

class _ListPageContentState extends State<ListPageContent> {
  late List<CharacterEntity> characters;

  @override
  void initState() {
    super.initState();
    characters = _setCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final item = characters[index];
          return index == 0
              ? Column(
                  children: [
                    const CharacterListItemHeader(
                      titleText: 'All Characters',
                    ),
                    CharacterListItem(item: item),
                  ],
                )
              : CharacterListItem(item: item);
        },
      ),
    );
  }

  List<CharacterEntity> _setCharacters() {
    final locationCitadelOfRicks = LocationEntity(
      name: 'Citadel of Ricks',
      url: 'https://rickandmortyapi.com/api/location/3',
    );
    final locationEarth = LocationEntity(
      name: 'Earth (Replacement Dimension)',
      url: 'https://rickandmortyapi.com/api/location/20',
    );

    return [
      CharacterEntity(
        id: 1,
        name: 'Rick Sanchez',
        status: 'Alive',
        image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
        location: locationCitadelOfRicks,
      ),
      CharacterEntity(
        id: 2,
        name: 'Morty Smith',
        status: 'Alive',
        image: 'https://rickandmortyapi.com/api/character/avatar/2.jpeg',
        location: locationCitadelOfRicks,
      ),
      CharacterEntity(
        id: 3,
        name: 'Summer Smith',
        status: 'Alive',
        image: 'https://rickandmortyapi.com/api/character/avatar/3.jpeg',
        location: locationEarth,
      ),
      CharacterEntity(
        id: 4,
        name: 'Beth Smith',
        status: 'Alive',
        image: 'https://rickandmortyapi.com/api/character/avatar/4.jpeg',
        location: locationEarth,
      ),
      CharacterEntity(
        id: 5,
        name: 'Jerry Smith',
        status: 'Alive',
        image: 'https://rickandmortyapi.com/api/character/avatar/5.jpeg',
        location: locationEarth,
      ),
    ];
  }
}
