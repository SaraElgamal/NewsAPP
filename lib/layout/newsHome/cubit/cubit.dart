import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/newsHome/cubit/states.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/settings/settings.dart';
import 'package:news_app/modules/sports/sports.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class newsCubit extends Cubit<statesNews>{
  newsCubit() : super(statesInitialNews());

    static newsCubit get(context) => BlocProvider.of(context);
    int currentIndex = 0;
    List<BottomNavigationBarItem> BottomItems = [
      BottomNavigationBarItem(icon: Icon(Icons.business_sharp),
        label: 'Business',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.sports_tennis_rounded),
        label: 'Sports',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.science_outlined),
        label: 'Science',
      ),

    ];
    List<Widget> screens=[
      BusinessScreen(),
      SportsScreen(),
      ScienceScreen(),

    ];
    void changeBottomNav(int index){
      currentIndex= index ;
      if(index==1)
        getSports();
      if(index==2)
        getScience();
      emit(statesBottomNavNews());
    }
    List<dynamic> business = [];
    void getBusiness (){

      emit(statesBusinessLoadingNews());
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'business',
        'apikey':'1a40464614da4e71b08654c31d4135de',
      },
      ).then((value){
      //  print (value.data['articles'][0]['title']);
        business = value.data['articles'];
        print (business[0]['title']);
        emit(statesbusinessSuccessNews());
      }).catchError((error){
        print (error.toString());
        emit(statesbusinessErrorNews(error.toString()));
      });
    }
  List<dynamic> sports = [];
  void getSports (){
    emit(statesSportsLoadingNews());
    if (sports.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'sports',
        'apikey':'1a40464614da4e71b08654c31d4135de',
      },
      ).then((value){
        //  print (value.data['articles'][0]['title']);
        sports = value.data['articles'];
        print (sports[0]['title']);
        emit(statesSportsSuccessNews());
      }).catchError((error){
        print (error.toString());
        emit(statesSportsErrorNews(error.toString()));
      });
    } else  emit(statesSportsSuccessNews());

  }
  List<dynamic> science = [];
  void getScience (){
    emit(statesscienceLoadingNews());
    if (science.length==0){
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country':'eg',
        'category':'science',
        'apikey':'1a40464614da4e71b08654c31d4135de',
      },
      ).then((value){
        //  print (value.data['articles'][0]['title']);
        science = value.data['articles'];
        print (science[0]['title']);
        emit(statesScienceSuccessNews());
      }).catchError((error){
        print (error.toString());
        emit(statesScienceErrorNews(error.toString()));
      });
    } else  emit(statesScienceSuccessNews());

  }
  List<dynamic> search = [];
  void getSearch (String value){
    emit(statesearchLoadingNews());

    DioHelper.getData(url: 'v2/everything', query: {

      'q':'$value',
      'apikey':'1a40464614da4e71b08654c31d4135de',
    },
    ).then((value){
      //  print (value.data['articles'][0]['title']);
      search = value.data['articles'];
      print (search[0]['title']);
      emit(statesSearchSuccessNews());
    }).catchError((error){
      print (error.toString());
      emit(statesSearchErrorNews(error.toString()));
    });
  }
}