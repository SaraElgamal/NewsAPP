import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/layout/newsHome/cubit/states.dart';
import 'package:news_app/modules/web_view/web_view.dart';

Widget buildArticleItem (articles, context) => InkWell(
  onTap: (){
    navigateTo(context, Web_View(articles['url']),);
  },
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(children: [
  
      Container(
  
        height: 120.0,
  
        width: 120.0,
  
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0) ,
  
          image: DecorationImage(
  
            image: NetworkImage('${articles['urlToImage']}') ,
  
            fit: BoxFit.cover, ) ,
  
          ),
  
  
  
  
  
      ),
  
      SizedBox(width: 20.0,),
  
      Expanded(
  
        child: Container(
  
          height: 120.0,
  
          child: Column(
  
            mainAxisAlignment: MainAxisAlignment.start,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Expanded(
  
                child: Text('${articles['title']}',
  
  // عشان السيم يتغير معايا
  
                  style: Theme.of(context).textTheme.bodyText1,
  
                  maxLines: 4,
  
                  overflow: TextOverflow.ellipsis,
  
                ),
  
  
  
  
  
              ),
  
              Text('${articles['publishedAt']}',
  
  
  
                style: TextStyle(
  
  
  
                  color: Colors.grey,
  
                ),),
  
            ],
  
          ),
  
        ),
  
      ),
  
    ],),
  
  ),
);
Widget myDivider ()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20.0),
  child: Container(
    width: double.infinity,
    color: Colors.grey[400],

    height: 1.0,
  ),
);
Widget defaultField( {
  @required TextEditingController controller,
  Function onSubmitted,
  bool isPassword = false ,
  @required Function validate,
  @required  String label,
  Function onChange,
  @required IconData prefix,
  IconData suffix,
  Function onpressed,
  @required TextInputType keyboard,
}) => TextFormField(

  controller: controller,
  keyboardType: keyboard,
  obscureText: isPassword,
onChanged: onChange,
  onFieldSubmitted: onSubmitted,
  validator: validate,
  decoration: InputDecoration(

    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix != null ? IconButton(icon : Icon (suffix) , onPressed: onpressed,) : null ,
    border: OutlineInputBorder(),


  ),
);
 void navigateTo(context, widget) => Navigator.push(context, MaterialPageRoute(
builder:
(context) => widget, ));
 Widget articleBuilder (list,context, {isSearch = false}) => ConditionalBuilder(

condition: list.length>0,
builder: (context) => ListView.separated(
  itemBuilder:
    (context , index) => buildArticleItem(list[index],context),
separatorBuilder:  (context , index)=> myDivider(),
itemCount: 10,
physics: BouncingScrollPhysics(),),
fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator(),),

);