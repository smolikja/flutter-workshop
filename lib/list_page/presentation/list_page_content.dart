import 'package:flutter/material.dart';
import 'package:flutter_workshop/list_page/domain/entity/character.dart';
import 'package:flutter_workshop/list_page/presentation/widgets/character_list_item.dart';
import 'package:flutter_workshop/list_page/presentation/widgets/character_list_item_header.dart';

class ListPageContent extends StatefulWidget {
  const ListPageContent({super.key});

  @override
  State<ListPageContent> createState() => _ListPageContentState();
}

class _ListPageContentState extends State<ListPageContent> {
  List<CharacterEntity> characters = [
    CharacterEntity(
      id: 111,
      image: 'https://rickandmortyapi.com/api/character/avatar/1.jpeg',
    ),
  ];

  @override
  void initState() {
    super.initState();
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
}
