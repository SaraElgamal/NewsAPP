import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/layout/newsHome/cubit/cubit.dart';
import 'package:news_app/shared/App_cubit.dart';
import 'package:news_app/shared/App_states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'layout/newsHome/news_home.dart';

void main() async
{
  //بيتأكد ان كل حاجه تمام
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.Init();
  await CacheHelper.init();
 bool isDark = CacheHelper.getbool(key: 'isDark');
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget {

final bool isDark;
MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
        BlocProvider(create: (BuildContext context) => newsCubit()..getBusiness(),),
    BlocProvider(create: (BuildContext context) => AppCubit()..changeMode(
    fromShared: isDark,
    ),),
    ], child: BlocConsumer< AppCubit,AppState>(
        listener: ( context, state) {  },
        builder: ( context, state) {
          return MaterialApp(
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('#263238'),
              appBarTheme: AppBarTheme(
                titleSpacing: 20.0,
                backwardsCompatibility: false,
                actionsIconTheme: IconThemeData(
                  color: Colors.white,

                ),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: HexColor('#263238'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: HexColor('#263238'),
                elevation: 0.0,
              ),

              primarySwatch: Colors.red,
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                elevation: 40.0,
                backgroundColor: HexColor('#263238') ,
                unselectedItemColor: Colors.grey,
              ),

            ),
          theme: ThemeData(
          appBarTheme: AppBarTheme(
          titleSpacing: 20.0,
          backwardsCompatibility: false,
          actionsIconTheme: IconThemeData(
          color: Colors.black,

          ),
          titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.red,
          statusBarIconBrightness: Brightness.light,
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          ),
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
          bodyText1: TextStyle(
          color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      ),
      ),
      primarySwatch: Colors.red,

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.red,
      elevation: 40.0,
      ),
      ),

      themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light  ,
      debugShowCheckedModeBanner: false,
      home: news_home(),
      );
        } ,

      ),
    );
  }
}
