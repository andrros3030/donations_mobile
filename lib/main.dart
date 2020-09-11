import 'dart:io';

import 'package:donations_mobile/styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobile task 2',
      debugShowCheckedModeBanner: false,
      home: startPage(),
    );
  }
}

class startPage extends StatefulWidget {
  @override
  _startPageState createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  int step = 0;
  goNext(){
    step+=1;
    if(mounted)
      setState((){});
  }
  goBack(){
    if(step==0)
      exit(0);
    else{
      step-=1;
      setState((){});
    }
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    if(step==0)
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(_width, 60),
          child: Container(
              width: _width,
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: SizedBox(), flex: 1,),
                    Text("Пожертвования", textAlign: TextAlign.center, style: black20Bold),
                    Expanded(child: SizedBox(), flex: 1,),
                    Container(child: Divider(color: Colors.grey.withOpacity(0.3), thickness: 0.5, height: 0.5,),),
                  ],
                ),
              ),
            ),
        ),
        body: Container(
          color:Colors.white,
          height: _height,
          width: _width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Container(
                child: Text("У Вас пока нет сборов.\nНачните доброе дело", textAlign: TextAlign.center, style: grey18),
              )),
              SizedBox(height: 28,),
              MaterialButton(
                onPressed: (){
                  goNext();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                color: primaryBlue,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: Text("Создать сбор", textAlign: TextAlign.center, style: white18),
              ),
            ],
          )
        ),
    );
    else if(step==1){
      return WillPopScope(
        onWillPop: ()async {
          goBack();
          return false;
        },
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(_width, 60),
            child: Container(
              width: _width,
              padding: EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              color: Colors.white,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: SizedBox(), flex: 1,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(child: backButton, onTap: (){goBack();},),
                          Text("Тип сбора", textAlign: TextAlign.center, style: black20Bold,),
                          Opacity(child: backButton, opacity: 0.0,),
                        ],
                      ),),
                    Expanded(child: SizedBox(), flex: 1,),
                    Container(child: Divider(color: Colors.grey.withOpacity(0.3), thickness: 0.5, height: 0.5,),),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            width: _width,
            height: _height,
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      color: Colors.grey.withOpacity(0.05)
                  ),
                  child: ListTile(
                    title: Text("Целевой сбор", style: black20Bold.copyWith(fontSize: 18),),
                    subtitle: Text("Когда есть определенная цель", style: grey18.copyWith(fontSize: 16),),
                    leading: Container(child: Icon(Icons.add_circle_outline, color: primaryBlue,),),
                    trailing: Container(child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),),
                    onTap: (){
                      print("1");
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                      color: Colors.grey.withOpacity(0.05)
                  ),
                  child: ListTile(
                    title: Text("Регулярный сбор", style: black20Bold.copyWith(fontSize: 18),),
                    subtitle: Text("Когда помощь нужна ежемесячно", style: grey18.copyWith(fontSize: 16),),
                    leading: Container(child: Icon(Icons.calendar_today, color: primaryBlue,),),
                    trailing: Container(child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),),
                    onTap: (){
                      print("2");
                    },
                  ),
                ),
              ],
            ),
          )
        ),
      );
    }
  }
}