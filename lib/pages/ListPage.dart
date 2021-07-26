import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:superhero/components/CardList.dart';
import 'package:superhero/controllers/controller.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Controller controller = Controller();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    FocusNode searchFocus = FocusNode();
    return Scaffold(
        backgroundColor: Colors.white,
        body: Observer(builder: (_) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(8, 50, 8, 0),
                child: Card(
                  child: new ListTile(
                    leading: new IconButton(
                        onPressed: () {
                          controller.getHeroes(searchController.text);
                        },
                        icon: Icon((Icons.search))),
                    title: new TextField(
                      controller: searchController,
                      onSubmitted: (e) {
                        controller.getHeroes(e);
                      },
                      decoration: new InputDecoration(
                          hintText: 'Search', border: InputBorder.none),
                    ),
                    trailing: new IconButton(
                      icon: new Icon(Icons.cancel),
                      onPressed: () {
                        searchController.clear();
                        if (searchFocus.hasFocus) searchFocus.unfocus();
                        controller.getHeroes("");
                      },
                    ),
                  ),
                ),
              ),
              _buildList(context, searchController.text),
            ],
          );
        }));
  }

  Widget _buildList(BuildContext context, searching) {
    List heros = controller.listSuperHeros;
    if (controller.loading == true) {
      return Container(
          height: MediaQuery.of(context).size.height/4,
          child: Center(child: CircularProgressIndicator()));
    }
    if (heros.isEmpty) {
      return Container(
          height: MediaQuery.of(context).size.height/4,
          child: Center(child: Text("Nenhum item encontado")));
    }
    return RefreshIndicator(
        onRefresh: () async{
             controller.getHeroes(searching);
        },
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: heros.length,
            itemBuilder: (context, index) {
              final item = heros[index];
              return CardList(item);
            }));
  }
}
