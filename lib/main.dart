import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      body: ListView(
        children: <Widget>[
        Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                    height: 250.0, color: Color(getColorHexFromStr('#FFF5ea'))),
                Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 35.0, 15.0, 10.0),
                        child: Material(
                          elevation: 10.0,
                          borderRadius: BorderRadius.circular(25.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon:
                                Icon(Icons.search, color: Colors.black),
                                contentPadding:
                                EdgeInsets.only(left: 15.0, top: 15.0),
                                hintText: 'Search for recipies and channels',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ),
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Container(
                        padding: EdgeInsets.only(left: 10.0),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Colors.green,
                                    style: BorderStyle.solid,
                                    width: 3.0))),
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'POPULAR RECIPIES',
                                  style: TextStyle(
                                      fontFamily: 'TimesRoman',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'THIS WEEK',
                                  style: TextStyle(
                                      fontFamily: 'TimesRoman',
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 15.0),
                    ),
                    Container(
                        padding: EdgeInsets.only(
                          top: 15.0,
                          left: 15.0,
                        ),
                        height: 125.0,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[

                            _WeekSpecialRecipies(),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                            ),
                            _WeekSpecialRecipies(),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                            ),
                            _WeekSpecialRecipies(),
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                            ),

                          ],
                        ))
                  ],
                ),
              ],
            ),

            SizedBox(
              height: 15.0,
            ),

            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: 15.0
              ),
              child: Text('September 11', style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  fontFamily: 'QuickSand'
              )),
            ),

            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                  left: 15.0
              ),
              child: Text('Today', style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  fontFamily: 'TimesRoman'
              )),
            ),

            SizedBox(height: 10.0,),

            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 12.0, right: 12.0),
                  child: Container(
                    height: 275.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(image: AssetImage('assets/breakfast.jpeg'), fit: BoxFit.cover)
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 150.0, left: 60.0),
                    child: Column(
                      children: <Widget>[
                        Text('BEST OF',
                          style: TextStyle(
                              fontFamily: 'TimesRoman',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text('THE DAY',
                          style: TextStyle(
                              fontFamily: 'TimesRoman',
                              fontSize: 25.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          height: 3.0,
                          width: 50.0,
                          color: Colors.orange,
                        )
                      ],
                    )
                )
              ],
            )


          ],
        ),
        ],
      )
    );
  }

  int getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw new FormatException("An error occurred when converting a color");
      }
    }
    return val;
  }

  Widget _WeekSpecialRecipies(){
    return Container(
      height: 125.0,
      width: 250.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.white),
      child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                  image: AssetImage(
                      'assets/chickenCurry.jpeg'),fit: BoxFit.fill),
            ),
            height: 125.0,
            width: 100.0,
          ),
          SizedBox(
            width: 5.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Exotic Masala',
                style: TextStyle(fontSize: 20.0,
                fontFamily: 'QuickSand'),
              ),
              SizedBox(
                height: 2.0,
              ),
              Text('Egg Biryani',
                  style: TextStyle(fontSize: 20.0)),
              SizedBox(
                height: 10.0,
              ),
              Container(
                color: Colors.orange,
                height: 1.0,
                width: 75.0,
              ),
              SizedBox(height: 10.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      height: 25.0,
                      width: 25.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.5),
                          image: DecorationImage(
                              image: AssetImage('assets/chef1.jpg'),
                              fit: BoxFit.fill
                          )
                      )
                  ),
                  SizedBox(width: 10.0),
                  Text('James Randy', style: TextStyle(
                      fontFamily: 'QuickSand'
                  ),)
                ],
              )
            ],
          )
        ],
      ),
    );
  }


}
