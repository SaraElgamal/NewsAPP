import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/newsHome/cubit/cubit.dart';
import 'package:news_app/layout/newsHome/cubit/states.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/shared/App_cubit.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class news_home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  //..getSports()..getScience(), عشان اجيب كله مع بعضه
    BlocConsumer<newsCubit, statesNews>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = newsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(
              'News App',
            ),

              actions: [IconButton(icon: Icon(Icons.search), onPressed: (){
                navigateTo(context, Search(),);
              }),
          IconButton(icon: Icon(Icons.brightness_4_rounded), onPressed: (){
            AppCubit.get(context).changeMode();
          } ),   ],
            ),

            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.BottomItems,
              currentIndex: cubit.currentIndex,
              onTap: (index){
          cubit.changeBottomNav(index);
              },
            ),
          );
        },

    );
  }
}
