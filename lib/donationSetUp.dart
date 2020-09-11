import 'package:donations_mobile/styles.dart';
import 'package:flutter/material.dart';

class donationsPage extends StatefulWidget{
  bool regular;
  donationsPage(this.regular);
  @override
  createState() => new _donationPage();
}
class _donationPage extends State<donationsPage>{
  double _width, _height;
  mediaFile(){
    return Container(
      width: _width,
      height: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: primaryBlue),),
      alignment: Alignment.center,
      child: Row(
        children: [
          Icon(Icons.photo, color: primaryBlue, size: 36,),
          Text("Загрузить обложку", style: blue18,),
        ],
      ),
    );
  }

  naming(){
    //TODO
    return Column(
      children: [
        Text("Название сбора", style: grey12,),
        SizedBox(height: 4,),
        Container()
      ],
    );
  }

  payValue(){
    //TODO
    return Container();
  }

  point(){
    if(widget.regular)
      return SizedBox();
    else{
      //TODO
      return Container();
    }
  }

  description(){
    return Container();
  }

  Widget build(BuildContext context){
    bool _regular = widget.regular;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(_width, 60),
        child: Container(
          width: _width,
          color: Colors.white,
          alignment: Alignment.bottomCenter,
          child: SafeArea(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: SizedBox(), flex: 1,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(child: backButton, onTap: (){Navigator.pop(context);},),
                      Text(_regular?"Регулярный сбор":"Целевой сбор", textAlign: TextAlign.center, style: black20Bold,),
                      Opacity(child: backButton, opacity: 0.0,),
                    ],
                  ),),
                Expanded(child: SizedBox(), flex: 1,),
              ],
            ),
          ),
        ),
      ),
      body:Container(
        width: _width,
        height: _height,
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            mediaFile(),
            SizedBox(height: 12,),
            naming(),
            SizedBox(height: 12,),
            payValue(),
            _regular?SizedBox():SizedBox(height: 12,),
            point(),
            SizedBox(height: 12,),
            description(),
          ],
        ),
      ),
    );
  }
}