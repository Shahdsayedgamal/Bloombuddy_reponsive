import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/shared.components/components.dart';
import 'cubit.dart';
import 'states.dart';

class ShopLayout extends StatefulWidget {
  @override
  _ShopLayoutState createState() => _ShopLayoutState();
}

class _ShopLayoutState extends State<ShopLayout> {
  void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (Route<dynamic> route) => false,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (BuildContext context, ShopStates state) {},
        builder: (BuildContext context, ShopStates state) {
          ShopCubit cubit = ShopCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: cubit.bottomScreens[cubit.currentIndex],
                ),
                BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: cubit.currentIndex,
                  onTap: (index) {
                    setState(() {
                      cubit.changeIndex(index);
                    });
                  },
                  selectedItemColor: Colors.green[900], // Emerald green color
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.accessibility_new_outlined),
                      label: 'Guide',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.store),
                      label: ' Store',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.landscape),
                      label: 'Landscape',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.add_a_photo_outlined),
                      label: 'Camera',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined),
                      label: 'Profile',
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
