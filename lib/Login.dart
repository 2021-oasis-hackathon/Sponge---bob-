import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clickLogin(String _id, String _pw) async {
    debugPrint(_id);
    debugPrint(_pw);
    debugPrint('clicked');

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // 이 add 기능은 성공!
    // student.add({
    //   'name': 'Hyejin', // John Doe
    //   'age': '23' // 42
    // });


    // var ds;
    // 이 data 전체 다 뽑는 거도 성공!
    // await FirebaseFirestore.instance
    //   .collection('student')
    //   .doc('20195035')
    //   .get()
    //   .then((DocumentSnapshot documentSnapshot) {
    //     if (documentSnapshot.exists) {
    //       ds = documentSnapshot.data();
    //       print('Document data: ${documentSnapshot.data()}');
    //     } else {
    //       print('Document does not exist on the database');
    //     }
    //   });
    
    // if (ds is Map) { print('Hi, it is Map type'); }
    // else { print('Nope, it is not Map type'); }
    // print('YOOO~~, ${ds['name']}');

    // 이 data field 특정해서 뽑는거도 성공!!!
    // await FirebaseFirestore.instance
    //   .collection('student')
    //   .where('name', isEqualTo: 'Troy')
    //   .get()
    //   .then((QuerySnapshot querySnapshot) {
    //     querySnapshot.docs.forEach((doc) {
    //       print('YEYEYEYE ~~ ${doc['age']}');
    //     });
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '같이탈래',
                      style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pink,
                      child: Text('Login'),
                      onPressed: () {
                        // debugPrint(nameController.text);
                        // debugPrint(passwordController.text);
                        clickLogin(nameController.text, passwordController.text);
                      },
                    )),
                Container(
                    child: Row(
                      children: <Widget>[
                        Text('Does not have account?'),
                        TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.pink,
                          ),
                          child: Text(
                            'Sign in',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () {
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ))
              ],
            )));
  }
}