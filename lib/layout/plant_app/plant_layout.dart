import 'package:bloom_buddy/modules/search/search_screen.dart';
import 'package:bloom_buddy/shared/shared.components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';
import 'states.dart';


class PlantLayout extends StatefulWidget {
  @override
  _PlantLayoutState createState() => _PlantLayoutState();
}

class _PlantLayoutState extends State<PlantLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PlantCubit(), // create an instance of PlantCubit
      child: BlocConsumer<PlantCubit, PlantStates>(
        listener: (BuildContext context, PlantStates state) {},
        builder: (BuildContext context, PlantStates state) {
          PlantCubit cubit = PlantCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen(),);
                  },
                  icon: Icon(Icons.search),
                ),
              ],
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                setState(() {
                  cubit.changeIndex(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.grass),
                  label: 'Seeds',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Pots',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.eco),
                  label: 'Plants',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
