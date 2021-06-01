import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:triple_s_project/model/subjects.dart';
import 'package:triple_s_project/model/user.dart';
import 'package:triple_s_project/providers/allSubjects.dart';
import 'package:triple_s_project/providers/auth.dart';
class Results extends StatefulWidget {
  @override
  _ResultsState createState() => _ResultsState();
}
class _ResultsState extends State<Results> {
  @override
  Widget build(BuildContext context) {
    final selectedSubjects = Provider.of<Auth>(context).selectedSubjects;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(height: 32.0, color: Color(0xff5b418f),),
              Container(
                color: Color(0xff5b418f),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TopRow(),
                    Padding(
                      padding: const EdgeInsets.only(top: 26.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(6, (index) =>
                            DateWidget(index: index != 6 ? index : index - 1,
                            ),),),),],),),
              CardWidget(),
            ],
          ),
        ));}}
class CardWidget extends StatelessWidget {

  const CardWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children:<Widget> [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('08.30',
                  style: TextStyle(fontWeight:FontWeight.bold ,)
              ),
              LineGen(lines: [20.0 , 40.0, 60.0, 10.0],
              ),],
          ),
        ),
        SizedBox( width : 12.0),
        Expanded(
          child: Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Color(0xff654f91),
            ),
            child:  Container(
              margin: EdgeInsets.only(left:4.0),
              color: Color(0xfffcf9f5),
              padding: EdgeInsets.only(
                left :16.0 ,
                top : 8.0,
              ),
              child:
              Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget>[
                    Container(
                      height:25.0 ,
                      child: Row(
                        children: <Widget>[
                          Text("08.30 _ 10.00"),
                          VerticalDivider(),
                          Text("Online "),
                        ],
                      ),),
                    Text('d.ehabe',
                      style: TextStyle(
                          fontSize:22.0 ,
                          fontWeight: FontWeight.bold
                      ),),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
class  LineGen extends StatelessWidget {
  final  List lines;
  const LineGen ({
    Key key , this.lines
  }) : super (key:  key);
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(4, (index) => Container(
          height: 2.0,
          width: lines[index],
          color: Color(0xffd0d2d8),
          margin: EdgeInsets.symmetric( vertical : 14.0),
        )
        )
    );
  }
}
class DateWidget extends StatefulWidget {
  final index;

  const DateWidget({Key key, this.index}) : super(key: key);

  @override
  _DateWidgetState createState() => _DateWidgetState();
}
class _DateWidgetState extends State<DateWidget> {
  bool _selectDate = true;

  var list = ["sat", "sun", "mon" , "tue" , "wen","thu"];
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: Container(
        decoration: _selectDate ? null :BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.all(
                Radius.circular(4.0))
        ),
        child: Column(

            children:<Widget> [
              Text(list[widget.index],
                style: TextStyle(color: _selectDate ? Color(0xff8e7def):Colors.white),
              ),
              Text(
                '${10 + widget.index}',
                style:  TextStyle(
                    fontWeight: _selectDate ? FontWeight.normal : FontWeight.bold,
                    color: _selectDate ? Color(0xff8e7def): Colors.white),),
              Container(
                width :4.0,
                height: 4.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _selectDate ?  Color(0xff8e7def):Colors.white,
                ),
              )
            ]
        ),
      ),
    );
  }
}
class TopRow extends StatelessWidget {
  const TopRow({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text("Daily",
              style: TextStyle(
                  fontSize:24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(width: 10.0,),
            Text("time table",
              style: TextStyle(
                  color:Color(0xffa79abf),
                  fontSize:24.0,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        Spacer(),
        Text("April",
          style: TextStyle(
              color:Colors.white,
              fontSize:18.0,
              fontWeight: FontWeight.bold
          ),
        )
      ],
    );
  }
}
