import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:vilchez_pc11/models/user.dart';
import 'package:vilchez_pc11/pages/list/list_controller.dart';
import 'package:vilchez_pc11/utils/my_colors.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ListController _con = new ListController();
  List<User> data = <User>[];

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
        leading: Icon(Icons.person),
        title: Text('Usuarios'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20),
            _usersList()
          ],
        ),
      ),
      bottomNavigationBar: _btnNewUser(),
    );
  }

  Widget _usersList() {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(
              Icons.person_pin,
              size: 38,
            ),
            title: Text("${data[index].dni}"),
            subtitle: Text("${data[index].apellidos} ${data[index].nombre}"),
          );
        },
      ),
    );
  }

  Widget _btnNewUser() {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 38, horizontal: 50),
      child: ElevatedButton(
        onPressed: _con.goToNewUser,
        child: Text('NUEVO USUARIO'),
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            primary: MyColors.primaryColor),
      ),
    );
  }

  void refresh() {
    _con.getDatos().then((value) {
      setState(() {
        data.addAll(value);
        print("${data}");
      });
    });
  }
}
