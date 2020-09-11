import 'dart:io';

import 'package:donations_mobile/donationSetUp.dart';
import 'package:donations_mobile/styles.dart';
import 'package:flutter/material.dart';
import 'icon_pack_icons.dart';
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
              color: primaryBackground,
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: SizedBox(), flex: 1,),
                    Text("Пожертвования", textAlign: TextAlign.center, style: black20Bold),
                    Expanded(child: SizedBox(), flex: 1,),
                    Container(child: Divider(color: greyDiv, thickness: 0.5, height: 0.5,),),
                  ],
                ),
              ),
            ),
        ),
        body: Container(
          color: primaryBackground,
          height: _height,
          width: _width,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Container(
                child: Text("У Вас пока нет сборов.\nНачните доброе дело", textAlign: TextAlign.center, style: grey16hint),
              )),
              SizedBox(height: 28,),
              MaterialButton(
                onPressed: (){
                  goNext();
                },
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                color: primaryBlue,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              color: primaryBackground,
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
                    Container(child: Divider(color: greyDiv, thickness: 0.5, height: 0.5,),),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            width: _width,
            height: _height,
            alignment: Alignment.center,
            color: primaryBackground,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: greyBorder),
                      color: greyField
                  ),
                  child: ListTile(
                    title: Text("Целевой сбор", style: black20Bold.copyWith(fontSize: 18),),
                    subtitle: Text("Когда есть определенная цель", style: grey14.copyWith(fontSize: 16),),
                    leading: Container(child: Icon(IconPack.scope, color: primaryBlue,),),
                    trailing: Container(child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>new donationsPage(false)));
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: greyBorder),
                      color: greyField
                  ),
                  child: ListTile(
                    title: Text("Регулярный сбор", style: black20Bold.copyWith(fontSize: 18),),
                    subtitle: Text("Когда помощь нужна ежемесячно", style: grey14.copyWith(fontSize: 16),),
                    leading: Container(child: Icon(IconPack.calendar, color: primaryBlue,),),
                    trailing: Container(child: Icon(Icons.keyboard_arrow_right, color: Colors.grey),),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>new donationsPage(true)));
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
