import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/newsHome/cubit/cubit.dart';
import 'package:news_app/layout/newsHome/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SportsScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,statesNews>(
      listener: (context,states) {} ,
      builder: (context,states){
        var list = newsCubit.get(context).sports;
        return articleBuilder (list,context);
      },

    );
  }
}