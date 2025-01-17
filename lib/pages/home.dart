import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:project_duckhawk/components/horizontal_listview.dart';
import 'package:project_duckhawk/pages/login_page.dart';

import 'package:project_duckhawk/pages/cart.dart';
import 'package:project_duckhawk/pages/location.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
class HomePage1 extends StatefulWidget {

  final add;
  HomePage1(this.add);

  @override
  _HomePage1State createState() => _HomePage1State();
}
Future<void> currentUser() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  print(user.email);
  print(user.uid);
  print(user.displayName);
  return user;
}
class _HomePage1State extends State<HomePage1> {

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress ;
  String name="hello";
  FirebaseUser mCurrentUser;
  FirebaseAuth _auth;

  String _value = '';
  void _onClick(String value) => setState(() => _value = value);
  @override
  void initState(){
    super.initState();

    _getCurrentLocation();
    _getCurrentUser();
    print("Here outside async");
  }
  _getCurrentUser()async{
    _auth=FirebaseAuth.instance;
    mCurrentUser=await _auth.currentUser();
    print("Hello"+mCurrentUser.email.toString());
    name=mCurrentUser.email.toString();

  }
  _signOut() async {
    await _auth.signOut();
  }


  @override
  Widget build(BuildContext context) {
    print("in home page");
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [AssetImage('images/armani.png')],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
      ),
    );
    Widget image_carousel1 = new Container(
      height: 180.00,
      child: new Carousel(
        boxFit: BoxFit.cover,
        images: [
          Image.asset('images/armani.png'),
          Image.asset('images/watches-111a.png'),
          Image.asset('images/Guide-mens-smart-casual-dress-code15@2x.png',width: 150),
          Image.asset('images/men-jeans@2x.png'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xff104670),
        title: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: <Widget>[
                  Row(
                    children:
                    <Widget>[
                      new IconButton(
                        icon: new Icon(Icons.place),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyLocation()));
                          //_getCurrentLocation();
                          currentUser();
                        },
                      ),
                      SingleChildScrollView(
                        child: Container(
                            width: 200,
                            child: new FlatButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>new MyLocation()));
                            }, child: Text("${widget.add}",style: new TextStyle(fontSize: 15.0, color: Colors.white),))),)
                      //child: new FlatButton(onPre,new Text("${widget.add}",style: new TextStyle(fontSize: 15.0),)))),


                    ],
                  ),
                ],

              ),
            )
        ),
        //leading:new Text("hi"),


      ),


      /*



      persistentFooterButtons: <Widget>[/*
        new IconButton(icon: new Icon(Icons.add_shopping_cart), onPressed: () => _onClick('Button1')),
        new IconButton(icon: new Icon(Icons.shop), onPressed: () => _onClick('Button2')),
        new IconButton(icon: new Icon(Icons.monetization_on), onPressed: () => _onClick('Button3')),
        new IconButton(icon: new Icon(Icons.notifications), onPressed: () => _onClick('Button4')),
        new IconButton(icon: new Icon(Icons.share), onPressed: () => _onClick('Button5')),*/
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new IconButton(icon: new Icon(Icons.add_shopping_cart), onPressed: () => _onClick('Button1')),
              new IconButton(icon: new Icon(Icons.shop), onPressed: () => _onClick('Button2')),
              new IconButton(icon: new Icon(Icons.monetization_on), onPressed: () => _onClick('Button3')),
              new IconButton(icon: new Icon(Icons.notifications), onPressed: () => _onClick('Button4')),
              new IconButton(icon: new Icon(Icons.share), onPressed: () => _onClick('Button5')),

            ],
          ),
        ),

      ],*/
      bottomNavigationBar: new Container(
        padding: EdgeInsets.all(0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: IconButton(
                icon: new Icon(Icons.add_shopping_cart),
                onPressed: () => _onClick('Button1'),
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.shop),
                  onPressed: () => _onClick('Button2')),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.monetization_on),
                  onPressed: () => _onClick('Button3')),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.notifications),
                  onPressed: () => _onClick('Button3')),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                  icon: new Icon(Icons.share),
                  onPressed: () => _onClick('Button3')),
            ),
          ],
        ),
      ),
      endDrawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            InkWell(
              child: new UserAccountsDrawerHeader(


                accountName: Text(name),
                accountEmail: null,
                currentAccountPicture: GestureDetector(
                    child: new CircleAvatar(
                      //backgroundImage: ImageProvider("images/men-jeans@2x.png"),
                      backgroundColor: Colors.grey,
                    )),
                decoration: new BoxDecoration(color: Color(0xff104670)),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>new LoginPage()));
              },
            ),

            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Men'),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Women')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Electronics')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Sports')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Books')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Home & Furniture')),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(title: Text('Beauty & Personal Care')),
            ),
            Divider(),
            Container(
                color: Color(0xffaaaaaa),
                child: new Column(
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('My Orders')),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>new cart()));
                      },
                      child: ListTile(title: Text('My Cart')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Account')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Notifications')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Budget')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Share')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('Settings')),
                    ),
                    InkWell(
                      onTap: () {
                        _signOut();
                        name="hi";
                      },
                      child: ListTile(title: Text('LOGOUT')),
                    ),
                    InkWell(
                      onTap: () {},
                      child: ListTile(title: Text('HELP')),
                    )
                  ],
                )),
          ],
        ),
      ),
      body: new ListView(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.all(2.0),
          ),
          HorizontalList(),
          new Padding(padding: const EdgeInsets.all(8.0)),
          image_carousel,
          image_carousel1,
          Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(0xff104670),
              child: new Row(
                children: <Widget>[
                  new Icon(

                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                  new Text(

                    'Fashion',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),

                ],
              )),
          /*Container(
            height:120.0,
            child: products(
              'fashion',
            ),
          ),*/
          Container(
              padding: const EdgeInsets.all(10.0),
              color: Color(0xff104670),
              child: new Row(
                children: <Widget>[
                  new Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                  new Text(
                    'Electronics',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              )),

          /*new Padding(padding: const EdgeInsets.all(20.0),
            child:new Text('Electronics'
            ) ,),*/

          /*Container(
            height:120.0,
            child: products('electronics'),
          ),*/
        ],
      ),
    );
  }

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress = "${place.locality}";
        print(place.locality);
      });
    } catch (e) {
      print(e);
    }
  }
}
