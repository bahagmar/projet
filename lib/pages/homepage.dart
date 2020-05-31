import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp12/bloc/navigation_bloc/navigation_bloc.dart';
import 'myaddpage.dart';


class HomePage extends StatefulWidget with NavigationStates{
  @override
  _HomePage createState() => _HomePage();

}

class _HomePage extends State<HomePage> {
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
              "/add": (BuildContext context) => new MyAddPage(),


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
 final searchField =TextField(

 );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.purple,
        title: Text(
            'Baladity',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){

            },
          )
        ],
      ) ,
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              children: <Widget>[
              SizedBox(height: 50.0,),
                Text(
                      'Foulen ben Foulen',
                      style: TextStyle(
                        fontSize: 20,
                      )
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      '01/01/2020',
                      style: TextStyle(
                        fontSize: 10,
                      )
                  ),

                  SizedBox(
                    height: 150.0,
                    child: Image.asset(
                        "a7/rue1.jpg",

                    ),
                  ),
                  SizedBox(height: 45.0),
                  Text(
                      'Foulen ben Foulen',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,

                      )
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      '01/01/2020',
                      style: TextStyle(
                        fontSize: 10,
                      )
                  ),

                  SizedBox(
                    height: 150.0,

                    child: Image.asset(
                        "a7/rue2.JPG",


                    ),
                  ),
                SizedBox(height: 45.0),
                Text(
                    'Foulen ben Foulen',
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                SizedBox(height: 20.0),
                Text(
                    '01/01/2020',
                    style: TextStyle(
                      fontSize: 10,
                    )
                ),

                SizedBox(
                  height: 150.0,
                  child: Image.asset(
                      "a7/2.jpg",

                  ),
                ),
                SizedBox(height: 45.0),
                Text(
                    'Foulen ben Foulen',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,

                    )
                ),
                SizedBox(height: 20.0),
                Text(
                    '01/01/2020',
                    style: TextStyle(
                      fontSize: 10,
                    )
                ),

                SizedBox(
                  height: 150.0,

                  child: Image.asset(
                      "a7/3.jpg",

                  ),
                ),
                SizedBox(height: 45.0),
                Text(
                    'Foulen ben Foulen',
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                SizedBox(height: 20.0),
                Text(
                    '01/01/2020',
                    style: TextStyle(
                      fontSize: 10,
                    )
                ),

                SizedBox(
                  height: 150.0,
                  child: Image.asset(
                      "a7/4.jpg",

                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                    'Foulen ben Foulen',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,

                    )
                ),
                SizedBox(height: 20.0),
                Text(
                    '01/01/2020',
                    style: TextStyle(
                      fontSize: 10,
                    )
                ),

                SizedBox(
                  height: 150.0,

                  child: Image.asset(
                      "a7/5.jpg",


                  ),
                ),
                SizedBox(height: 45.0),
                Text(
                    'Foulen ben Foulen',
                    style: TextStyle(
                      fontSize: 20,
                    )
                ),
                SizedBox(height: 20.0),
                Text(
                    '01/01/2020',
                    style: TextStyle(
                      fontSize: 10,
                    )
                ),

                SizedBox(
                  height: 150.0,
                  child: Image.asset(
                      "a7/6.jpg",

                  ),
                ),
                SizedBox(height: 45.0),
                Text(
                    'Foulen ben Foulen',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 20,

                    )
                ),
                SizedBox(height: 20.0),
                Text(
                    '01/01/2020',
                    style: TextStyle(
                      fontSize: 10,
                    )
                ),

                SizedBox(
                  height: 150.0,

                  child: Image.asset(
                      "a7/7.jpg",


                  ),
                ),

              ],
            ),
          ),
        ),

      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor:Colors.purple,
          onPressed: (){
            Navigator.of(context).pushNamed("/add");
          }
          ),


    );
  }
}
