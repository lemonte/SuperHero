// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Controller on ControllerBase, Store {
  final _$listSuperHerosAtom = Atom(name: 'ControllerBase.listSuperHeros');

  @override
  List<dynamic> get listSuperHeros {
    _$listSuperHerosAtom.reportRead();
    return super.listSuperHeros;
  }

  @override
  set listSuperHeros(List<dynamic> value) {
    _$listSuperHerosAtom.reportWrite(value, super.listSuperHeros, () {
      super.listSuperHeros = value;
    });
  }

  final _$loadingAtom = Atom(name: 'ControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  @override
  String toString() {
    return '''
listSuperHeros: ${listSuperHeros},
loading: ${loading}
    ''';
  }
}
