import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/newsHome/cubit/cubit.dart';
import 'package:news_app/layout/newsHome/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class Search extends StatelessWidget {

var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit,statesNews>(
      listener: (context,state){},
      builder: (context,state){
        var list = newsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: defaultField(controller: searchController,
                    validate: ( String value){
                      if (value.isEmpty){
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    onChange : (value){
                  newsCubit.get(context).getSearch(value);
                    },
                    label: 'Search',

                    prefix: Icons.search,
                    keyboard: TextInputType.text),
              ),

              Expanded(child:  articleBuilder(list,context,isSearch: true), ),
            ],
          ),
        );
      } ,

    );
  }
}
