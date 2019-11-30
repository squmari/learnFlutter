// import 'package:bloc/bloc.dart';

// enum BottomNaviPages{
//   Home,
//   NOTIFICATIONS,
//   MY_PAGE,
// }

// class BottomNaviBloc extends Bloc<BottomNaviPages, int> {
//   @override
//   int get initialState => BottomNaviPages.Home.index;
  
//   @override
//   Stream<int> mapEventToState(BottomNaviPages event) async*{
//     switch (event) {
//       case BottomNaviPages.Home:
//         yield BottomNaviPages.Home.index;
//         break;
//       case BottomNaviPages.NOTIFICATIONS:
//         yield BottomNaviPages.NOTIFICATIONS.index;
//         break;
//       case BottomNaviPages.MY_PAGE:
//         yield BottomNaviPages.MY_PAGE.index;
//         break;
//     }
//   }
// }