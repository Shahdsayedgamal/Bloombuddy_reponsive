import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:card_swiper/card_swiper.dart';
import '../instructions/instructions.dart'; // Adjust the path if needed
import 'last_Arrival.dart'; // Assuming this imports your LatestArrivalProductsWidget
import '../login/login_screen.dart'; // Import the login screen

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context,
        designSize: const Size(375, 812)); // iPhone X as design size example

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15.w), // Responsive padding
                child: CustomGreetingWidget(searchController: searchController),
              ),
              Padding(
                padding: EdgeInsets.all(14.w), // Responsive padding
                child: SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.3, // Adjusted height for the swiper pictures
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.asset(
                        "assets/images/home1.jpg",
                        fit: BoxFit.cover, // Fill the available space
                      );
                    },
                    autoplay: true,
                    itemCount: 3,
                    pagination: const SwiperPagination(),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 8.w, top: 15.h),
                child: Row(
                  children: [
                    Text(
                      "Latest arrival",
                      style: TextStyle(
                          fontSize:
                          ScreenUtil().setSp(24)), // Responsive font size
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.28, // Screen height percentage
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const LatestArrivalProductsWidget();
                    }),
              ),
              SizedBox(
                height: 18.h,
              ),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.all(8.0),
          child:FloatingActionButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
              );
            },
            backgroundColor: Colors.green[900], // Set background color
            child: Icon(Icons.logout, color: Colors.white), // Set icon color
          ),

        ),
      ),
    );
  }
}

class CustomGreetingWidget extends StatelessWidget {
  final TextEditingController searchController;

  const CustomGreetingWidget({required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Good morning',
                    style: TextStyle(
                      color: Colors.green[900],
                      fontSize: ScreenUtil().setSp(18), // Responsive font size
                      fontWeight: FontWeight.bold,
                    ),
                    children: const <TextSpan>[
                      TextSpan(text: ' 🌞', style: TextStyle(fontSize: 22)),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(8), // Responsive height
                ),
                Text(
                  'Shahd sayed',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(24), // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5), // Responsive height
                ),
                Row(
                  children: const [
                    Icon(Icons.wb_cloudy, color: Colors.grey, size: 24),
                    Padding(
                      padding: EdgeInsets.only(left: 9),
                      child: Text(
                        'Sun Cloudy 22°',
                        style: TextStyle(
                          fontSize: 14, // Consider making font size responsive
                        ),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.black, size: 24),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 20), // Add more space
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Material(
            elevation: 4, // Set elevation
            borderRadius: BorderRadius.circular(25.0), // Apply border radius
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    onChanged: (value) {},
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Search must not be empty';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Find your favourite plant here',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
