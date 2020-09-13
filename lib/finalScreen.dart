import 'package:donations_mobile/styles.dart';
import 'package:flutter/material.dart';
enum DonationTypes{
  repeatable,
  toDate,
  toSumm
}
class finalView extends StatelessWidget{
  int value, moneyLeft;//необходимая и оставшаяся сумма
  Image preview; //изображение
  String name, target, descText; //параметры пожертвования
  String selectedPay; //выбранный ID кошелька
  String author; //выбранный ID человека (или сообщества), назначающего сборы
  DateTime date; //дата окончания сбора (если есть)
  DonationTypes currentType; //тип пожертвования

  finalView({
    @required this.name,
    @required this.value,
    @required this.selectedPay,
    @required this.author,
    @required this.currentType,
    this.target,
    this.preview,
    this.descText,
    this.date,
    this.moneyLeft
  });

  Widget item(BuildContext context){
    double _width = MediaQuery.of(context).size.width;
    String _toEnd;
    if(currentType==DonationTypes.repeatable){
      _toEnd = "Помощь нужна каждый месяц";
    }
    else if(currentType==DonationTypes.toSumm){
      _toEnd = "Необходима вся сумма";
    }
    else{
      int _days = date.difference(DateTime.now()).inDays.abs();
      _toEnd = "Закончится через ${_days.toString()} дней";
    }
    return Container(
      width: _width,
      child: Card(
        elevation: 12,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            preview!=null?Container(child: Image.asset("assets/zaglushka.png", width: _width, height: 120, fit: BoxFit.fill,),):SizedBox(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              alignment:Alignment.centerLeft,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(name, style: black16,),
                  Text(author+" ∙ "+_toEnd, style: grey16hint.copyWith(fontSize: 14),),
                ],
              ),
            ),
            Container(padding: EdgeInsets.symmetric(horizontal:12), child: Divider(color: greyDiv, thickness: 0.5, height: 0.5,),),
            SizedBox(height: 12,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Помогите первым", style: black16.copyWith(fontSize: 14), textAlign: TextAlign.start,),
                      SizedBox(height: 8,),
                      Container(
                        width: _width*.5,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: secondaryBlue.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                  OutlineButton(
                    onPressed: (){print("actually nothing");},
                    borderSide: BorderSide(color: secondaryBlue,),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: secondaryBlue)),
                    child: Text("Помочь", style: grey14.copyWith(color: secondaryBlue), textAlign: TextAlign.center,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: item(context),
      ),
    );
  }

}