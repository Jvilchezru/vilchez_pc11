import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:vilchez_pc11/models/user.dart';
import 'package:http/http.dart' as http;

class ListController {

  late BuildContext context;
  late ProgressDialog _progressDialog;
  set refresh(Function refresh) {}

  Future? init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
    _progressDialog = new ProgressDialog(context: context);
    refresh();
  }

  Future<List<User>> getDatos() async {
    _progressDialog.show(max: 100, msg: 'Cargando datos...');

    var url = Uri.parse('http://aptr2021.000webhostapp.com/ejemploser/Publicar/listadopersona');
    var response = await http.get(url).timeout(Duration(seconds: 90));
    _progressDialog.close();
    var datos = jsonDecode(response.body);
    var registros = <User>[];
    for (datos in datos) {
      registros.add(User.fromListJson(datos));
    }
    return registros; 
  }

  void goToNewUser() {
    Navigator.pushNamed(context, '/register');
  }
}