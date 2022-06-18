import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';
import 'package:vilchez_pc11/models/user.dart';
import 'package:vilchez_pc11/utils/my_snackbar.dart';
import 'package:http/http.dart' as http;

class RegisterController {
  late BuildContext context;
  late ProgressDialog _progressDialog;
  TextEditingController dniController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();

  set refresh(Function refresh) {}

  Future? init(BuildContext context, Function refresh) {
    this.context = context;
    this.refresh = refresh;
    _progressDialog = new ProgressDialog(context: context);
    refresh();
  }

  void register() async {
    String dni = dniController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;

    if (dni.isEmpty || name.isEmpty || lastName.isEmpty) {
      MySnackbar.show(context, '¡Debe completar todos los campos!');
      return;
    }

    if (dni.length != 8) {
      MySnackbar.show(context, '¡Debe ingresar un DNI válido!');
      return;
    }

    try {
      var url = Uri.parse('http://aptr2021.000webhostapp.com/ejemploser/Publicar/registrapersona');
      _progressDialog.show(max: 100, msg: 'Registrando usuario...');
      var response = await http.post(url, body: {
        'dni': dni,
        'nombre': name,
        'apellidos': lastName
      }).timeout(Duration(seconds: 90));

      _progressDialog.close();
      var datos = jsonDecode(response.body);

      if (User.fromSaveJson(datos).estado == "1") {
        Navigator.pushNamedAndRemoveUntil(context, '/list', (route) => false);
      }

      MySnackbar.show(context, "${User.fromSaveJson(datos).mensaje}");
      clean();

    } on TimeoutException catch (e) {
      print("Tiempo de conexión: ${e.toString()}");

    } on Error catch (e) {
      print("Error: ${e.toString()}");
    }
  }

  void clean() {
    dniController.clear();
    nameController.clear();
    lastNameController.clear();
  }
}
