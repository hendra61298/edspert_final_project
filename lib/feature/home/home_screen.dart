
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:submission_finpro/feature/home/home_course_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.shortestSide < 600;
    return ListView(
      children: [
        Container(
          height: 50,
          color: Colors.green,
          child: Text('Profile Header'),
        ),
        Container(
          height: 100,
          color: Colors.red,
          child: Text('Single Banner'),
        ),
        const HomeCourseWidget(),
        Container(
          height: 100,
          color: Colors.red,
          child: Text('Event Banners'),
        ),
      ],
    );
  }
}
