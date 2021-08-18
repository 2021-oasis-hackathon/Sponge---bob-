import 'package:flutter/material.dart';

class MatchingFailed extends StatelessWidget {
  const MatchingFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment(1.0, 1.0),
          child: Text(
            '매칭 취소',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 0.0,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(20.0, 0, 0, 100),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('/New/new.png'),
                radius: 100.0,
                backgroundColor: Colors.white,
              ),
            ),
            Center(
              child: Divider(
                color: Colors.purple,
                thickness: 1.0,
                endIndent: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('/New/load.gif'),
              backgroundColor: Colors.white,
              radius: 60,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('매칭 중입니다.',
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            Text(
              '잠시만 기다려주세요.',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold),
            )
          ])),
    );
  }
}