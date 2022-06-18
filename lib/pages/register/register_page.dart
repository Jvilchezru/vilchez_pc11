import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vilchez_pc11/pages/register/register_controller.dart';
import 'package:vilchez_pc11/utils/my_colors.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = new RegisterController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.primaryColor,
        title: Text('Nuevo Usuario'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 60),
            _imageUser(),
            SizedBox(height: 30),
            _txtFieldDni(),
            _txtFieldName(),
            _txtFieldLastName()
          ],
        ),
      ),
      bottomNavigationBar: _btnRegister(),
    );
  }

  Widget _imageUser() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: MyColors.primaryOpacityColor,
    );
  }

  Widget _txtFieldDni() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        controller: _con.dniController,
        decoration: InputDecoration(
          hintText: 'DNI',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.badge, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _txtFieldName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _con.nameController,
        decoration: InputDecoration(
          hintText: 'Nombre',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _txtFieldLastName() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 8),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _con.lastNameController,
        decoration: InputDecoration(
          hintText: 'Apellido',
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          prefixIcon: Icon(Icons.person_outline, color: MyColors.primaryColor),
        ),
      ),
    );
  }

  Widget _btnRegister() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 38, horizontal: 50),
      child: ElevatedButton(
        onPressed: _con.register,
        child: Text('REGISTRAR'),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: MyColors.primaryColor
        ),
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
