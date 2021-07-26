import 'package:flutter/material.dart';
import 'package:superhero/pages/HeroPage.dart';

class CardList extends StatelessWidget {
  final item;

  CardList(this.item);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(item["image"]["url"])),
      title: Text(
        item["name"].length > 30
            ? item["name"].substring(0, 30)
            : item["name"] ?? "",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
       subtitle: Text(
        item["appearance"]["race"] ?? "Raça não cadastrada"
      ),
      onTap: () {
         Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => HeroPage(item)));
      },
    ),
    Divider()
    ],); 
  }
}
