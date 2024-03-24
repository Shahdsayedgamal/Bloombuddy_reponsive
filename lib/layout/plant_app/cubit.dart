
import 'package:bloom_buddy/layout/plant_app/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/plants/plants_screen.dart';
import '../../modules/pots/pots_screen.dart';
import '../../modules/seeds/seeds_screen.dart';


class PlantCubit extends Cubit<PlantStates>
{
  PlantCubit(): super(PlantInitialState());
  static PlantCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> screens = [
    SeedsScreen(),
    PotsScreen(),
    PlantsScreen(),
  ];

  List<String> titles = [
    'Seeds Screen',
    'Pots Screen',
    'Plants Screen',
  ];

void changeIndex(int index)
{
  currentIndex = index;
  emit(PlantChangeBottomNavBarState());
}

}