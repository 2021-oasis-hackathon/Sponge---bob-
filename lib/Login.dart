import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';
import 'Userguide.dart';
import 'main.dart';



class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<LoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clickLogin(String _id, String _pw) async {
    id = _id;
    pw = _pw;
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
    await FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: _id)
        .get()
        .then((QuerySnapshot querySnapshot) {
          querySnapshot.docs.forEach((doc) {
          // print('YEYEYEYE ~~ ${doc['age']}');
          if (doc['password'] == _pw) {
            print("YoonJae login success");
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return SlideScreen();
            }));
          } else {
            print("YoonJae wrong password");
          }
          });
        });
    print("YoonJae after login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: 200,
                ),
                SizedBox(
                    height: 150,
                    width: 200,
                    child: Image.asset('asset/gachiLogo.png')),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 21, 40, 5),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'ID',
                      hintText: '아이디를 입력해주세요',
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 40, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'PASSWORD',
                      hintText: '비밀번호를 입력해주세요',
                      contentPadding: EdgeInsets.all(15),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 4),
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: FloatingActionButton(
                    child: Text(
                      '로그인 하기',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      // debugPrint(nameController.text);
                      // debugPrint(passwordController.text);
                      clickLogin(nameController.text, passwordController.text);
                    },
                    backgroundColor: Color(0xffE20080),
                    isExtended: true,
                  ),
                ),
                Container(
                    child: Row(
                  children: <Widget>[
                    Text('아직 회원이 아니신가요?'),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Color(0xffE20080),
                      ),
                      child: Text(
                        '회원가입',
                        style: TextStyle(fontSize: 18),
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
