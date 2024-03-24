abstract class PlantStates {}
class PlantInitialState extends PlantStates{}
class PlantBottomNavState extends PlantStates{}
class PlantChangeBottomNavBarState extends PlantStates{}

class PlantLoadingState extends PlantStates{}
class PlantGetSeedsSucessState extends PlantStates{}
class PlantGetSeedsErrorState extends PlantStates{
  final String error;

  PlantGetSeedsErrorState(this.error);
}