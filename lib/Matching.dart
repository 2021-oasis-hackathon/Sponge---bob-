import 'package:flutter/material.dart';
import 'package:osembly/MatchingFailed.dart';
class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Container(
              alignment: Alignment(1.0, 1.0),
              child: Text(
                '매칭 취소',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              )),
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(Icons.navigate_before),
            onPressed: () {},
          ),
        ),
        body: Padding(
            padding: EdgeInsets.fromLTRB(65.0, 70.0, 10.0, 0.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '500m 내 상대와',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                '매칭에 실패하였습니다.',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 140.0,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: 14.0, horizontal: 60.0),
                    primary: Color(0xffE20080),
                    minimumSize: Size(100, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35))),
                child: Text(
                  '다시 시도',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      fontFamily: 'KoPubWorldDotum'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MatchingFailed()),
                  );
                },
              )
            ])));
  }
}