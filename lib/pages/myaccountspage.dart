import 'package:flutter/material.dart';
import 'package:flutterapp12/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



const kLargeTextStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
);
const kTitleTextStyle = TextStyle(
  fontSize: 16,
  color: Color.fromRGBO(129, 165, 168, 1),
);
const kSmallTextStyle = TextStyle(
  fontSize: 16,
);
class MyAccountsPage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(15, 35, 15, 15),
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('a7/1.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'foulen ben foulen',
                  style: kLargeTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'foulenbenfoulen@gmail.com',
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    SocialButton(
                      icon: FontAwesomeIcons.mailBulk,
                      iconColor: Color.fromRGBO(41, 117, 255, 1),
                      containerColor: Color.fromRGBO(41, 117, 255, .2),
                    ),
                    SocialButton(
                      icon: FontAwesomeIcons.phone,

                      iconColor: Color.fromRGBO(244, 96, 121, 1),
                      containerColor: Color.fromRGBO(244, 96, 121, .2),
                    ),
                    SocialButton(
                      icon: FontAwesomeIcons.lock,
                      iconColor: Color.fromRGBO(32, 138, 197, 1),
                      containerColor: Color.fromRGBO(32, 138, 197, .2),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    PostFollower(
                      number: 10,
                      title: 'Réclamations ',
                    ),

                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    GalleryImage(
                      imagePath: 'a7/7.jpg',
                    ),
                    GalleryImage(
                      imagePath: 'a7/2.jpg',
                    ),
                    GalleryImage(
                      imagePath: 'a7/3.jpg',
                    ),
                    GalleryImage(
                      imagePath: 'a7/4.jpg',
                    ),
                    GalleryImage(
                      imagePath: 'a7/5.jpg',
                    ),
                    GalleryImage(
                      imagePath: 'a7/6.jpg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GalleryImage extends StatelessWidget {
  final String imagePath;

  GalleryImage({@required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class PostFollower extends StatelessWidget {
  final int number;
  final String title;

  PostFollower({@required this.number, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          number.toString(),
          style: kLargeTextStyle,
        ),
        Text(
          title,
          style: kSmallTextStyle,
        ),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color containerColor;

  SocialButton({@required this.icon,
    @required this.iconColor,
    @required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: containerColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        icon,
        color: iconColor,
        size: 20,
      ),
    );
  }
}