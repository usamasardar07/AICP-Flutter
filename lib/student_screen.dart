import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/app.dart';

import 'loginUi.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  String email ='',age ='',type = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email=sp.getString('Email') ?? '';
    age=sp.getString('age') ?? '';
    type=sp.getString('userType') ?? '';
    setState(() {

    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff764abc),
        title: Center(child: Text('Student Screen')),
        automaticallyImplyLeading: false,
        // centerTitle: true,
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              CircleAvatar(
                backgroundColor: null,
                radius: 70,
                child:Image(image: AssetImage('assets/images/usama.JPG')),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const  Padding(
                padding:  EdgeInsets.all(13),
                child: Text('Email'),
              ),
              Text(email.toString()),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(13),
                child: Text('Age'),
              ),
              Text(age.toString()),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding:  EdgeInsets.all(13),
                child: Text('User Type'),
              ),
              Text(type.toString()),
            ],
          ),
          InkWell(
            onTap: ()  async{
              SharedPreferences sp =await SharedPreferences.getInstance();
              sp.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => MainApp()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Back to MyTodo App ',style: TextStyle(color: Colors.white),)),
              ),
            ),
          )
        ],
      ),

    );
  }
}
