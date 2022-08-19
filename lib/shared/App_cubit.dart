import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/App_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';


class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);

  int currentB = 0;

  List<String> title = [
    ' Tasks',
    'Done' ,
    'Archive',
  ];
  void Change(int index){
    currentB=index;
    emit(AppChangeBottomNav());
  }
  bool isDark = true ;

  void changeMode ({bool fromShared}){
    if(fromShared != null ){
     isDark = fromShared;
     emit(AppChangeMode());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeMode());
      });
    }
  }
}

