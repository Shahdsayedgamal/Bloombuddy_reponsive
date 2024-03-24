abstract class ShopStates {}
class ShopInitialState extends ShopStates{}
class ShopBottomNavState extends ShopStates{}
class ShopChangeBottomNavBarState extends ShopStates{}

class ShopLoadingState extends ShopStates{}
class ShopGetSeedsSucessState extends ShopStates{}
//class ShopGetSeedsErrorState extends ShopStates{
//   final String error;
//
//   ShopErrorState(this.error);
// }