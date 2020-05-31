import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp12/bloc/navigation_bloc/navigation_bloc.dart';






class MyOrdersPage extends StatefulWidget with NavigationStates{
  @override
  _MyOrdersPage createState() => _MyOrdersPage();

}


class _MyOrdersPage extends State<MyOrdersPage>{
  List<String> Names = [
    'Réclamation 1','Réclamation 2','Réclamation 3','Réclamation 4', 'Réclamation 5','Réclamation 6','Réclamation 7'
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text(
            "Baladity",
          style: TextStyle(
            color: Colors.white,
          ),

        ),
        backgroundColor: Colors.purple,
      ),
      body: new Container(
        child:Padding(
      padding: new EdgeInsets.only(top:50.0),
        child: new ListView.builder(
          reverse: false,
          itemBuilder: (_,int index)=>EachList(this.Names[index]),
          itemCount: this.Names.length,
        ),
      ),
    )
    );
  }
}
class EachList extends StatelessWidget{
  final String name;
  EachList(this.name);
  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new Container(
        padding: EdgeInsets.all(8.0),
        child: new Row(
          children: <Widget>[
            new CircleAvatar(child: new Text(name[0]),),
            new Padding(padding: EdgeInsets.only(right: 10.0)),
            new Text(name,style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
}
