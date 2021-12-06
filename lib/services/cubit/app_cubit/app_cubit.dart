import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/services/cubit/app_cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppIntialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/images/ic_home.png')),
      label: 'HOME',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/images/ic_search.png')),
      label: 'SEARCH',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/images/ic_browse.png')),
      label: 'BROWSE',
    ),
    BottomNavigationBarItem(
      icon: ImageIcon(AssetImage('assets/images/ic_watch_list.png')),
      label: 'WATCHLIST',
    ),
  ];
}
