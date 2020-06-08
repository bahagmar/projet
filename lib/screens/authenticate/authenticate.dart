import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp12/screens/home/hello.dart';


class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();

}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:MaterialApp(
        title: 'Flutter login UI',
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: MyHome(title: 'Flutter Login'),
    routes: <String,WidgetBuilder>{
      "/sidebar": (BuildContext context) => new Hello()
    }
    )
    );
  }
}
class MyHome extends StatefulWidget {
  MyHome({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHome> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController cinController=TextEditingController();
    TextEditingController nameController=TextEditingController();
      TextEditingController emailController=TextEditingController();
        TextEditingController passwordController=TextEditingController();
          TextEditingController numeroController=TextEditingController();

  @override
  Widget build(BuildContext context) {

    final cinField = TextField(
      controller:  cinController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "CIN",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final nameField = TextField(
      controller: nameController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: " Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField = TextField(
      controller: emailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final numField = TextField(
      controller: numeroController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Numéro",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: passwordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final creatButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.purple,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          registerFirebase();
                   // Navigator.of(context).pushNamed("/sidebar");
                  },
                  child: Text("Inscription",
                      textAlign: TextAlign.center,
                      style: style.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ),
              );
              return Scaffold(
                  appBar:AppBar(
                  backgroundColor: Colors.purple,
                  title: Text('Baladity'),
                  ),
                body: Center(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(36.0),
                      child: ListView(
          
                        children: <Widget>[
                       SizedBox(
                            height: 155.0,
                            child: Image.asset(
                              "a7/logo.png",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 25.0),
                          cinField,
                          SizedBox(height:25.0),
                          nameField,
                          SizedBox(height: 25.0),
                          emailField,
                          SizedBox(height: 25.0),
                          passwordField,
                          SizedBox(height: 25.0),
                          numField,
                          SizedBox(
                            height: 15.0,
                          ),
                          creatButon,
                          SizedBox(
                            height: 15.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }
          
            Future<void> registerFirebase() async {
              String errorMsg;
                try {
               AuthResult authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text,password: passwordController.text) ;
                FirebaseUser user=authResult.user;
                  UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
                  userUpdateInfo.displayName = nameController.text;
                  user.updateProfile(userUpdateInfo).then((onValue) {
                Navigator.of(context).pushNamed("/sidebar");
                Firestore.instance.collection('users').document().setData(
                    {'email': emailController.text, 'displayName': nameController.text,'displayCIN': cinController.text,'displayNumero': numeroController.text}).then((onValue) {
                 
                });
              });
                } catch (error) {
          switch (error.code) {
            case "ERROR_EMAIL_ALREADY_IN_USE":
              {
                
                  errorMsg = "This email is already in use.";
               
              
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: Text(errorMsg),
                        ),
                      );
                    });
              }
              break;
            case "ERROR_WEAK_PASSWORD":
              {
              
                  errorMsg = "The password must be 6 characters long or more.";
                
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Container(
                          child: Text(errorMsg),
                        ),
                      );
                    });
              }
              break;
            default:
              {
              
                  errorMsg = "";
               
              }
          }
            
                }}
}
