import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Home.dart';
import 'Userguide.dart';
import 'main.dart';
import 'dart:math' show cos, sqrt, asin;

class UserInformation extends StatefulWidget {
  @override
    _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();

  double coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  num diffTime(h1, m1, h2, m2) {
    num res = 0;
    if(h1 > h2) {
      res = res + 60 * (h1 - h2);
      if(m1 - m2 > 0) { res = res + (m1 - m2); }
      else { res = res - (m2 - m1); }
    }
    else if(h1 < h2) {
      res = res + 60 * (h2 - h1);
      if(m2 - m1 > 0) { res = res + (m2 - m1); }
      else { res = res - (m1 - m2); }
    } 
    else {
      if(m1 - m2 > 0) { res = m1 - m2; }
      else { res = m2 - m1; }
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        int lenFul = snapshot.data!.docs
          .where((DocumentSnapshot documentSnapshot) => coordinateDistance(strLat, strLng, documentSnapshot['strLat'], documentSnapshot['strLng']) <= 0.5)
          .where((DocumentSnapshot documentSnapshot) => coordinateDistance(desLat, desLng, documentSnapshot['desLat'], documentSnapshot['desLng']) <= 0.5)
          .where((DocumentSnapshot documentSnapshot) => diffTime(timeH, timeM, documentSnapshot['timeH'], documentSnapshot['timeM']) <= 20)
          .length;
        print('NOONA $lenFul');
        int lenApr = snapshot.data!.docs
          .where((DocumentSnapshot documentSnapshot) => coordinateDistance(strLat, strLng, documentSnapshot['strLat'], documentSnapshot['strLng']) <= 0.5)
          .where((DocumentSnapshot documentSnapshot) => coordinateDistance(desLat, desLng, documentSnapshot['desLat'], documentSnapshot['desLng']) <= 0.5)
          .where((DocumentSnapshot documentSnapshot) => documentSnapshot['approval'] == true)
          .where((DocumentSnapshot documentSnapshot) => diffTime(timeH, timeM, documentSnapshot['timeH'], documentSnapshot['timeM']) <= 20)
          .length;
        print('NooNAAAA $lenApr');


        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator(
            backgroundColor: Color(0xffE20089)
          );
        }
        
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                bottom: MediaQuery.of(context).size.height * 0.3,
                child: Image(
                  width: 250,
                  height: 300,
                  image: lenFul == lenApr?
                    AssetImage('asset/matching.png')
                    :AssetImage('asset/etiquette.png')
                  )),
              Positioned.fill(
                child: DraggableScrollableSheet(
                  maxChildSize: 0.8,
                  minChildSize: 0.3,
                  builder: (_, controller) {
                  return Material(
                    elevation: 20.0,
                    borderRadius:
                      BorderRadius.vertical(top: Radius.circular(35)),
                    color: Colors.white,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Container(
                              width: 40,
                              color: Color(0xffE20080),
                              height: 3,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Expanded(
                          child: ListView(
                            children: snapshot.data!.docs
                              .where((DocumentSnapshot documentSnapshot) => coordinateDistance(strLat, strLng, documentSnapshot['strLat'], documentSnapshot['strLng']) <= 0.5)
                              .where((DocumentSnapshot documentSnapshot) => coordinateDistance(desLat, desLng, documentSnapshot['desLat'], documentSnapshot['desLng']) <= 0.5)
                              .where((DocumentSnapshot documentSnapshot) => diffTime(timeH, timeM, documentSnapshot['timeH'], documentSnapshot['timeM']) <= 20)
                              .map((DocumentSnapshot document) { // children: <widget> [HeaderTile, PersonTile(1), (2) ...] 이 원래 들어감
                                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                                return ListTile(
                                  leading: Icon(
                                    Icons.face_outlined,
                                    color: Color(0xffE20080),
                                    size: 40.0,
                                  ),
                                  title: Text(
                                    '이름  :  ${data['name']}',
                                    style: TextStyle(
                                    letterSpacing: 0.5,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                  ),
                                  subtitle: data['approval'] == true?
                                    Text(
                                      '전화번호  :  ${data['phone']}',
                                      style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                      letterSpacing: 0.5),
                                    )
                                    :Text(
                                    '전화번호  :  (쉿~! 아직이예요!..)',
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.0,
                                    letterSpacing: 0.5),
                                    ),
                                  trailing: data['approval'] == true?
                                    Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 30.0,
                                    )
                                    :Icon(
                                      Icons.done,
                                      color: Colors.green,
                                      size: 0,
                                    )
                                );
                            }).toList(),
                          ))
                      ],
                    )));
              })),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Color(0xffE20080),
            child: Icon(
              Icons.done,
              size: 37,
            ),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Color(0xffE20080),
                elevation: 10.0,
                content: Text(
                  '매칭 수락하셨습니다.',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    fontFamily: 'Poppins',
                    letterSpacing: 1.5),
                ),
                duration: Duration(seconds: 2),
              ));
              CollectionReference users = FirebaseFirestore.instance.collection('users');
              await FirebaseFirestore.instance
                .collection('users')
                .where('id', isEqualTo: id)
                .get()
                .then((QuerySnapshot querySnapshot) {
                  querySnapshot.docs.forEach((doc) {
                    var docId = doc.id;
                    users.doc(docId).set({
                      'approval' : true
                      }, SetOptions( merge: true ));
                    print("yesss done!");
                  });
                });
            },
          ),
        );
      },
    );
  }
}

