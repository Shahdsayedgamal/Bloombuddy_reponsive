import 'package:bloom_buddy/modules/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../layout/layout_app/bloom_layout.dart';

class BoardingModel {
  String title;
  String body;

  BoardingModel({
    required this.title,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    BoardingModel(
      title: 'Welcome',
      body: 'To Bloom buddy',
    ),
    BoardingModel(
      title: 'About us',
      body: 'Our application will be your friend when it comes '
          ' to improving your planting and ensuring the survival of your plants'
          ' by providing you with all the information you need to know about plants.',
    ),
  ];
  bool isLast = false;

  void navigateAndFinish(BuildContext context, Widget widget) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/login.jpg'), // Your background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: boardController,
                    onPageChanged: (int index) {
                      if (index == boarding.length - 1) {
                        setState(() {
                          isLast = true;
                        });
                        print('you reached the end');
                      } else {
                        print('not last');
                        isLast = false;
                      }
                    },
                    itemBuilder: (context, index) =>
                        buildBoardingItem(boarding[index]),
                    itemCount: boarding.length,
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.white70,
                        activeDotColor: Colors.green[900]!,
                        dotHeight: 10,
                        spacing: 5.0,
                      ),
                      count: boarding.length,
                    ),
                    Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if (isLast) {
                          navigateAndFinish(context, AppLayout());
                        } else {
                          boardController.nextPage(
                            duration: Duration(milliseconds: 750),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }
                      },
                      backgroundColor: Colors.green[900],
                      child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 80.0,
            right: 20.0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white.withOpacity(0.3),
              ),
              child: TextButton(
                onPressed: () {
                  navigateAndFinish(context, LoginScreen());
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 100), // Adjust the height as needed
      Text(
        '${model.title}',
        style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${model.body}',
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
    ],
  );
}
