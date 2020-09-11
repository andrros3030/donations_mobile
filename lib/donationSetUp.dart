import 'package:donations_mobile/icon_pack_icons.dart';
import 'package:donations_mobile/styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class donationsPage extends StatefulWidget{
  bool regular;
  donationsPage(this.regular);
  @override
  createState() => new _donationPage();
}
class _donationPage extends State<donationsPage>{

  Widget radioSight(bool selected){
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: selected?primaryBlue:greyBorder),
      ),
      //width: 10,
      child: selected?Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primaryBlue,
          border: Border.all(color: Colors.white),
        ),
        width: 20,
        height: 20,
      ):Container(
        //color: Colors.white,
        width: 20,
        height: 20,
      ),
    );
  }

  double _width, _height;
  bool hasImage = false;
  String name, value, target, descText;

  TextEditingController _enteredName = new TextEditingController();
  TextEditingController _enteredValue = new TextEditingController();
  TextEditingController _enteredTarget = new TextEditingController();
  TextEditingController _enteredDesc = new TextEditingController();

  String selectedPay = "guid_for_1234";
  String author = "Иван Иванов";
  int step = 0;
  final _current = new GlobalKey<FormState>();
  final _secondary = new GlobalKey<FormState>();

  nextStep(){
    if(!widget.regular)
      setState(() {
        step+=1;
      });
    else{
      print("that's all");
    }
  }
  previusStep(){
    if(step==0)
      Navigator.maybePop(context);
    else{
      step-=1;
      setState((){});
    }
  }

  mediaFile(){
    if(hasImage)
      return Container(
        width: _width,
        height: 120,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),),
        alignment: Alignment.center,
        child: Stack(
          children: [
            Image.asset("assets/zaglushka.png", width: _width, height: 120,),
            Positioned(top: 4, right: 4, child: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(2),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
                  child: Icon(Icons.close, color: Colors.white, size: 16,),
                ),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              ),
              onTap: (){
                setState(() {
                  hasImage = false;
                });
              },
            ),)
          ],
        )
      );
    return GestureDetector(
      onTap: (){
        setState(() {
          hasImage = true;
        });
      },
      child: DottedBorder(
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
              Icon(IconPack.addimage, color: primaryBlue, size: 36,),
              SizedBox(width: 15,),
              Text("Загрузить обложку", style: blue16,),
            ],
          ),
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
            controller: _enteredName,
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
        Text(widget.regular?"Сумма в месяц, ₽":"Сумма, ₽", style: grey14,),
        SizedBox(height: 4,),
        Container(
          decoration: BoxDecoration(
            color: greyField,
            border: Border.all(color: greyBorder),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
          child: TextFormField(
            controller: _enteredValue,
            keyboardType: TextInputType.number,
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
              controller: _enteredTarget,
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
            controller: _enteredDesc,
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
                descText = val.trim();
            },
            validator: (val)=>null,
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
  bool needDate = true;
  DateTime _date;
  whenToEnd(){
    List<Widget> _items = [
      Text("Сбор заверщится", style: grey14,),
      SizedBox(height: 16,),
      GestureDetector(child: Container(
        child: Row(
          children: [
            radioSight(!needDate),
            SizedBox(width: 16,),
            Text("Когда соберем сумму")
          ],
        ),
      ), onTap: (){
        setState(() {
          needDate = false;
        });
      },),
      SizedBox(height: 16,),
      GestureDetector(child: Container(
        child: Row(
          children: [
            radioSight(needDate),
            SizedBox(width: 16,),
            Text("В определенную дату")
          ],
        ),
      ), onTap: (){
        setState(() {
          needDate = true;
        });
      },),
      SizedBox(height: 24,),
    ];
    if(needDate){
      bool _emptyDate = _date==null;
      _items.add(Text("Дата окончания", style: grey14,));
      _items.add(SizedBox(height: 16,));
      _items.add(
        GestureDetector(
          onTap: ()async {
            print("taped");
            DateTime _new = await showDatePicker(
              context: context,
              initialDate: _emptyDate?DateTime.now():_date,
              firstDate: DateTime.now(),
              lastDate: DateTime(2035, 1, 1),
            );
            if(_new!=null){
              _date = _new;
              if(mounted)
                setState((){});
            }
          },
          child: Container(
            width: _width,
            decoration: BoxDecoration(
              color: greyField,
              border: Border.all(color: greyBorder),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(child: Text(_emptyDate?"Выберите дату":formateToLocalDate(_date), style: _emptyDate?grey16hint:black16,),),
                Icon(Icons.keyboard_arrow_down)
              ],
            ),
          ),
        )
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _items,
    );
  }

  Widget build(BuildContext context){
    bool _regular = widget.regular;
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
    if(step==1)
      return Form(
        key: _secondary,
        child: WillPopScope(
          onWillPop: ()async{
            previusStep();
            return false;
          },
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
                            GestureDetector(child: backButton, onTap: (){previusStep();},),
                            Text("Дополнительно", textAlign: TextAlign.center, style: black20Bold,),
                            Opacity(child: backButton, opacity: 0.0,),
                          ],
                        ),),
                      Expanded(child: SizedBox(), flex: 1,),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              color: primaryBackground,
              width: _width,
              height: _height,
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(height: 16,),
                  whoToTake(),
                  SizedBox(height: 24,),
                  whenToEnd(),
                  Expanded(flex: 1, child: SizedBox(),),
                  MaterialButton(
                    elevation: 0,
                    child: Text("Создать сбор", style: white18,),
                    padding: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: !needDate || _date!=null?primaryBlue:primaryBlue.withOpacity(0.4),
                    minWidth: _width*.9,
                    onPressed: (){
                      if(!needDate || _date!=null)
                        print("ok");
                      else{
                        print("not ok");
                      }
                    },
                  ),
                  SizedBox(height: 25,),
                ],
              ),
            ),
          ),
        ),
      );
    return Form(
      key: _current,
      child: WillPopScope(
        onWillPop: ()async{
          bool res = name==null && descText==null && target==null && value==null && hasImage==false;
          if(!res)
            res = await showDialog<bool>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  elevation: 2.0,
                  actionsPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  content: Text("Сделанные изменения будут утеряны, вы уверены?", style: black16, textAlign: TextAlign.center,),
                  actions: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      child: Text("Нет, вернуться к редактированию",
                        style: blue16.copyWith(fontSize: 14, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                    ),
                    //SizedBox(height: 5,),
                    FlatButton(
                      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
                      child: Text("Да, уверен(а)",
                        style: blue16.copyWith(fontWeight: FontWeight.bold, color: Colors.red),
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ],
                );
              },
            );
          if(res==null)
            res = false;
          return res;
        },
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
                          GestureDetector(child: backButton, onTap: (){previusStep();},),
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
                                _regular?whoToTake():SizedBox()
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: _width,
                        alignment: Alignment.topCenter,
                        padding: EdgeInsets.only(top: 12),
                        child: MaterialButton(
                          onPressed: (){
                            if(_current.currentState.validate())
                              nextStep();
                          },
                          color: primaryBlue,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          child: Text(!_regular?"Далее":"Создать сбор", style: white18,),
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
      ),
    );
  }
}