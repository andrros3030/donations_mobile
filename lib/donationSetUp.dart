import 'package:donations_mobile/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class donationsPage extends StatefulWidget{
  bool regular;
  donationsPage(this.regular);
  @override
  createState() => new _donationPage();
}
class _donationPage extends State<donationsPage>{
  double _width, _height;
  String name, value, target, descText;
  String selectedPay = "guid_for_1234";
  String author = "Иван Иванов";

  final _current = new GlobalKey<FormState>();

  mediaFile(){
    return DottedBorder(
      radius: Radius.circular(16),
      color: primaryBlue,
      dashPattern: [5, 3],
      borderType: BorderType.RRect,
      child: Container(
        width: _width,
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.photo, color: primaryBlue, size: 36,),
            Text("Загрузить обложку", style: blue16,),
          ],
        ),
      ),
    );
  }

  naming(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Название сбора", style: grey14,),
        SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
            color: greyField,
            border: Border.all(color: greyBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Название сбора",
              labelStyle: grey16hint,
              border: InputBorder.none,
            ),
            style: black16,
            onChanged: (val){
              if(val!=null)
                name = val.trim();
            },
            validator: (val){
              if(val.length>0 && val.trim().length>0)
                return null;
              else return "Введите название";
            },
          ),
        )
      ],
    );
  }

  payValue(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.regular?"Сумма в месяц, руб":"Сумма, руб", style: grey14,),
        SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
            color: greyField,
            border: Border.all(color: greyBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: widget.regular?"Сколько нужно в месяц?":"Сколько нужно собрать?",
              labelStyle: grey16hint,
              border: InputBorder.none,
            ),
            style: black16,
            onChanged: (val){
              if(val!=null)
                value = val.trim();
            },
            validator: (val){
              if(val.length>0 && val.trim().length>0)
                return null;
              else return widget.regular?"Введите сумму в месяц":"Введите сумму";
            },
          ),
        )
      ],
    );
  }

  point(){
    if(widget.regular)
      return SizedBox();
    else{
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Цель", style: grey14,),
          SizedBox(height: 4,),
          Container(
            decoration: BoxDecoration(
              color: greyField,
              border: Border.all(color: greyBorder),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Например, лечение человека",
                labelStyle: grey16hint,
                border: InputBorder.none,
              ),
              style: black16,
              onChanged: (val){
                if(val!=null)
                  target = val.trim();
              },
              validator: (val){
                if(val.length>0 && val.trim().length>0)
                  return null;
                else return "Введите цель";
              },
            ),
          )
        ],
      );
    }
  }

  description(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Описание", style: grey14,),
        SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
            color: greyField,
            border: Border.all(color: greyBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "На что пойдут деньги и как они кому-то помогут?",
              labelStyle: grey16hint,
              border: InputBorder.none,
            ),
            style: black16,
            textInputAction: TextInputAction.newline,
            keyboardType: TextInputType.multiline,
            expands: false,
            maxLines: null,
            minLines: 1,
            onChanged: (val){
              if(val!=null)
                target = val.trim();
            },
            validator: (val){
              if(val.length>0 && val.trim().length>0)
                return null;
              else return "Введите описание";
            },
          ),
        )
      ],
    );
  }

  whereToTake(){
    return Container(
      width: _width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Куда получать деньги", style: grey14,),
          SizedBox(height: 4,),
          Container(
            decoration: BoxDecoration(
              color: greyField,
              border: Border.all(color: greyBorder),
              borderRadius: BorderRadius.circular(10),
            ),
            width: _width,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: DropdownButton(
              icon: Container(child: Expanded(flex: 1, child: Container(child: Icon(Icons.keyboard_arrow_down), alignment: Alignment.centerRight,),),),
              isExpanded: true,
              value: selectedPay,
              items: [
                DropdownMenuItem(
                  value: "guid_for_1234",
                  child: Text("Счет VK Pay 1234", style: black16,),
                ),
                DropdownMenuItem(
                  value: "guid_for_4321",
                  child: Text("Счет VK Pay 4321", style: black16,),
                ),
              ],
              onChanged: (val){
                setState(() {
                  selectedPay = val;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  whoToTake(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Автор", style: grey14,),
        SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
            color: greyField,
            border: Border.all(color: greyBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: DropdownButton(
            icon: Container(child: Expanded(flex: 1, child: Container(child: Icon(Icons.keyboard_arrow_down), alignment: Alignment.centerRight,),),),
            value: author,
            items: [
              DropdownMenuItem(
                value: "Иван Иванов",
                child: Text("Иван Иванов", style: black16,),
              ),
              DropdownMenuItem(
                value: "der Python",
                child: Text("Сообщество der Python", style: black16,),
              ),
            ],
            onChanged: (val){
              setState(() {
                author = val;
              });
            },
          ),
        )
      ],
    );
  }

  Widget build(BuildContext context){
    bool _regular = widget.regular;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    return Form(
      key: _current,
      child: Scaffold(
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
        body: Stack(
          children: [
            Container(
                width: _width,
                height: _height,
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: _height-180,
                      child: ListView(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
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
                              SizedBox(height: 12,),
                              whereToTake(),
                              SizedBox(height: 12,),
                              whoToTake()
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: _width,
                      //height: 100,
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(top: 12),
                      child: MaterialButton(
                        onPressed: (){
                          if(_current.currentState.validate())
                            print("good");
                        },
                        color: primaryBlue,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text(_regular?"Далее":"Создать сбор", style: white18,),
                        padding: EdgeInsets.symmetric(vertical: 12),
                        minWidth: _width*.9,
                      ),
                    )
                  ],
                )
            ),
          ],
        )
      ),
    );
  }
}