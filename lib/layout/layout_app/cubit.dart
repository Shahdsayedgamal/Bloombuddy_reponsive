
import 'package:bloom_buddy/layout/layout_app/states.dart';
import 'package:bloom_buddy/modules/home/home_screen.dart';
import 'package:bloom_buddy/modules/instructions/instructions.dart';
import 'package:bloom_buddy/modules/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/camera/camera.dart';
import '../../modules/land_scaping/land_scapping.dart';
import '../../modules/store/store_screen.dart';



class AppCubit extends Cubit<AppStates>
{
  AppCubit(): super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens = [
    HomeScreen(),
    InstructionsScreen(),
    StoreScreen(),
    LandscapeScreen(),
    CameraScreen(),
    ProfileScreen(),
  ];



  void changeIndex(int index)
  {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

}