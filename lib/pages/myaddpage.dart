import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp12/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:flutterapp12/main.dart';
import 'package:flutterapp12/sidebar/menu_item.dart';
import 'package:image_picker/image_picker.dart';


class MyAddPage extends StatefulWidget with NavigationStates{
  @override
  _MyAddPage createState() => _MyAddPage();

}

class _MyAddPage extends State<MyAddPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child:MaterialApp(
            title: 'Flutter login UI',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: MyAdd(title: 'Flutter Login'),
        )
    );
  }
}
class MyAdd extends StatefulWidget {
  MyAdd({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyAddPageState createState() => _MyAddPageState();
}
class _MyAddPageState extends State<MyAdd> {
  var titre =['Eclairage', 'Routes et trottoirs', 'chiens lâches', 'le bruit','Empilage de la saleté et des déchets de construction','Construire sans licence','Sélectionnez un titre'];
  var titresel='Sélectionnez un titre';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  File imageFile;

  _openGallery(BuildContext context)async{
   var picture=await ImagePicker.pickImage(source: ImageSource.gallery);
   this.setState(() {
     imageFile=picture;
   });
   Navigator.of(context).pop();
 }

 _openCamera(BuildContext context)async{
   var picture=await ImagePicker.pickImage(source: ImageSource.camera);
   this.setState(() {
     imageFile=picture;
   });
   Navigator.of(context).pop();
 }

Future <void> _showChoiceDialog (BuildContext context){
  return showDialog (context: context,builder: (BuildContext context){
    return AlertDialog(
      title:Text('Fais un choix !'),
    content:  SingleChildScrollView(
    child: ListBody(
  children: <Widget>[
      GestureDetector(
        child:Text('Gallery'),
        onTap: (){
          _openGallery(context);
          },
  ),
    Padding(padding: EdgeInsets.all(8.0),),
     GestureDetector(
       child:Text('Camera'),
       onTap: (){
       _openCamera(context);
      },
     )
  ],
  ),
  ),
  );
  }
  );
}

Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Déclaration Ajouter'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Merci pour votre réclamtion'),
                Text('vous pouvez suivre votre réclamtion'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Retour'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {


    final descriptionField = TextField(
      obscureText: false,
      style: style,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 100.0, 20.0, 100.0),
          hintText: "Description",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );


    final addButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _neverSatisfied();
                      },
        child: Text("Ajouter",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                        );


    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          'Baladity',
          textAlign: TextAlign.center,
        ),
      ) ,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: new EdgeInsets.all(30.0),

            child: ListView(


              children: <Widget>[
                SizedBox(height: 40.0),

               DropdownButton<String>(
                 isExpanded: true,

                items:titre.map((String item){
                  return DropdownMenuItem<String> (

                   value: item,
                    child: Text(item),
                  );
                }
                ).toList() ,
                 onChanged: (String letitre){
                  setState(() {
                    titresel=letitre;
                  });
                 },
                 value: titresel,
               ),


                SizedBox(height: 30.0),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,


                 children: <Widget>[
                   Text(
                       "Ajouter une photo",
                       style:TextStyle(
                         fontSize: 15,
                       )
                   ),
                   MenuItem(
                  icon: Icons.add_a_photo,
                  title: "",



                  onTap:(){
                    _showChoiceDialog(context);
                  },
                  
                   ),


]),
                SizedBox(height: 30.0),
                descriptionField,

                SizedBox(
                  height: 30.0,
                ),
                addButon,

              ],
            ),
          ),
        ),

      ),
    );
  }

}