import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'Map.dart';

class SlideScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ImageSlideshow(
          width: double.infinity,
          height: 600,
          initialPage: 0,
          indicatorColor: Colors.pink,
          indicatorBackgroundColor: Colors.black,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          isLoop: false,
          children: [
            Image.asset(
              'asset/slide1.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'asset/slide2.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'asset/slide3.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'asset/slide4.png',
              fit: BoxFit.cover,
            ),
            Image.asset(
              'asset/slide5.png',
              fit: BoxFit.cover,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<void>(builder: (BuildContext context) {
              return MapScreen();
            }));
          },
          backgroundColor: Color(0xffE20080),
          label: const Text(
            '닫기',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          isExtended: true,
        ),
      ),
    );
  }
}
