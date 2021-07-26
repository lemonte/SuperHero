import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  final hero;
  HeroPage(this.hero);
  @override
  _HeroPageState createState() => _HeroPageState(hero);
}

class _HeroPageState extends State<HeroPage> {
  final hero;
  _HeroPageState(this.hero);
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image(
                image: NetworkImage(hero["image"]["url"]),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Container(
                  height: 90.0,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 35.0),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15, 200, 15, 15),
              child: Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(top: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 95),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    hero['name'] != null
                                        ? hero['name']
                                        : "Nenhum nome cadastrado",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  ListTile(
                                    contentPadding: EdgeInsets.all(0),
                                    title: Text(
                                        hero["biography"]['full-name'] ?? ""),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        hero["appearance"]['gender'] ?? "",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.height_outlined,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        hero["appearance"]['height'][1] ?? "",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.fitness_center,
                                        color: Colors.blue,
                                      ),
                                      Text(
                                        hero["appearance"]['weight'][1] ?? "",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.15),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(hero["image"]["url"]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Informações do herói",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Nome Completo"),
                          subtitle: Text(hero['biography']["full-name"] ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Outro(s) nome(s)"),
                          subtitle: Text(hero['biography']["alter-egos"] ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Apelido(s)"),
                          subtitle: Text(hero['biography']["aliases"].join(",") ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                         ListTile(
                          title: Text("Naturalidade"),
                          subtitle: Text(hero['biography']["place-of-birth"] ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                         ListTile(
                          title: Text("Primeira aparição"),
                          subtitle: Text(hero['biography']["first-appearance"] ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                         ListTile(
                          title: Text("Editora"),
                          subtitle: Text(hero['biography']["publisher"] ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                         ListTile(
                          title: Text("Alinhamento"),
                          subtitle: Text(hero['biography']["alignment"] ?? ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "Super Poderes",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                         Divider(),
                        ListTile(
                          title: Text("Inteligência"),
                          subtitle: Text(
                              hero['powerstats']["intelligence"] + " pontos" ??
                                  ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Força"),
                          subtitle: Text(
                              hero['powerstats']["strength"] + " pontos" ?? ""),
                          leading: Icon(Icons.fitness_center),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Velocidade"),
                          subtitle: Text(
                              hero['powerstats']["speed"] + " pontos" ?? ""),
                          leading: Icon(Icons.speed),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Resistência"),
                          subtitle: Text(
                              hero['powerstats']["durability"] + " pontos" ??
                                  ""),
                          leading: Icon(Icons.access_time),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Poder"),
                          subtitle: Text(
                              hero['powerstats']["power"] + " pontos" ?? ""),
                          leading: Icon(Icons.fireplace_outlined),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Combate"),
                          subtitle: Text(
                              hero['powerstats']["combat"] + " pontos" ?? ""),
                          leading: Icon(Icons.people),
                        ),
                        Divider(),
                        ListTile(
                          title: Text(
                            "Conexòes",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Times afiliados"),
                          subtitle: Text(
                              hero['connections']["group-affiliation"] + " pontos" ??
                                  ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                        Divider(),
                        ListTile(
                          title: Text("Parentes"),
                          subtitle: Text(
                              hero['connections']["relatives"] + " pontos" ??
                                  ""),
                          leading: Icon(Icons.check_circle_outline),
                        ),
                         SizedBox(
                              height: 80,
                            ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  

}
