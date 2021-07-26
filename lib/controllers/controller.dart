import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobx/mobx.dart';

part 'controller.g.dart';

class Controller = ControllerBase with _$Controller;

abstract class ControllerBase with Store {
  @observable
  List listSuperHeros = [];

  @observable
  bool loading = false;

  void getHeroes(String text) async {
    const apikey = "<API>";
    if (text == "") {
      listSuperHeros = [];
    } else {
      loading = true;
      final res = await http.get(
          Uri.http("superheroapi.com", "/api/$apikey/search/$text"));
      Map<String, dynamic> map = json.decode(res.body);
      List<dynamic> data = map["results"] ?? [];
      int code = res.statusCode;
      loading = false;
      if (code == 200) {
        listSuperHeros = data;
      } else {
        listSuperHeros = [];
      }
    }
  }
}
