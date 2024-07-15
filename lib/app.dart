import 'package:todo_app/loginUi.dart';
import 'package:todo_app/views/todo_view.dart';
import 'package:todo_app/views/done_view.dart';
import 'package:flutter/material.dart';

import 'student_screen.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.purple,
                ), //BoxDecoration
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.purple),
                  accountName: Text(
                    "Usama Sardar",
                    style: TextStyle(fontSize: 18),
                  ),
                  accountEmail: Text("usamasardar5566@gmail.com"),
                  currentAccountPictureSize: Size.square(40),
                  currentAccountPicture: CircleAvatar(
                    radius: 150,
                    child: Image(image: AssetImage('assets/images/usama.JPG')),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
              //DrawerHeader
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text(' My Profile '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                },
              ),

              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text(' Edit Profile '),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('LogOut'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('My Todos'),
          backgroundColor: Colors.purple,
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                right: 40,
              ),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://s3-alpha.figma.com/hub/file/2893009731/269ab397-737b-4c80-9350-744919d48f78-cover.png')),
            )
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list_alt_rounded)),
              Tab(icon: Icon(Icons.done_outline)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            TodoView(),
            DoneView(),
          ],
        ),
      ),
    );
  }
}
