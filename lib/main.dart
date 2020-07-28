import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/components/numbers.dart';
import 'dart:math';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sorte Fácil',
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.white,
      ),
      home: HomePage(
        title: 'Sorte Fácil',
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<int> list = [];
  final List<bool> status = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  String pont_13 = '0';
  String pont_14 = '0';
  String pont_15 = '0';

  _change(String i) {
    if (status[int.parse(i) - 1] == false) {
      list.add(int.parse(i));
    }
    if (status[int.parse(i) - 1] == true) {
      list.remove(int.parse(i));
    }
    setState(() {
      status[int.parse(i) - 1] = status[int.parse(i) - 1] ? false : true;
    });
  }

  _gerar() {
    List lista2 = [];
    var rng = new Random();
    while (lista2.length < 15) {
      var nume = rng.nextInt(25);
      if (lista2.contains(nume + 1) == false) {
        lista2.add(nume + 1);
      }
    }
    return lista2;
  }

  _setgerar() {
    List lista4 = _gerar();
    setState(() {
      list.clear();
    });
    for (var i = 0; i < 25; i++) {
      if (lista4.contains(i + 1)) {
        setState(() {
          status[i] = true;
          list.add(i + 1);
        });
      } else {
        status[i] = false;
      }
    }
  }

  void _simulate() {
    setState(() {
      pont_13 = '0';
      pont_14 = '0';
      pont_15 = '0';
    });
    var quant13 = 0;
    var quant14 = 0;
    var quant15 = 0;
    for (var i = 0; i < 10000; i++) {
      var quant = 0;
      List lista3 = _gerar();
      for (var i = 0; i < lista3.length; i++) {
        if (list.contains(lista3[i])) {
          quant += 1;
        }
      }
      if (quant == 13) {
        quant13 += 1;
      } else if (quant == 14) {
        quant14 += 1;
      } else if (quant >= 15) {
        quant15 += 1;
      }
      setState(() {
        pont_13 = quant13.toString();
        pont_14 = quant14.toString();
        pont_15 = quant15.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: screenSize.height * 0.11,
            child: Stack(
              children: <Widget>[
                Container(
                  height: screenSize.height * 0.09,
                  decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36),
                      )),
                ),
                Positioned(
                  right: 80,
                  child: Transform.rotate(
                    angle: 25,
                    child: Image(
                      image: AssetImage('assets/clover.png'),
                    ),
                  ),
                ),
                Positioned(
                  left: 50,
                  top: 10,
                  child: Text(
                    'LotoFácil',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.0125,
          ),
          Center(
            child: Container(
              height: screenSize.height * 0.465,
              width: screenSize.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Numbers(
                        number: '1',
                        active: status[0],
                        cb: _change,
                      ),
                      Numbers(
                        number: '2',
                        active: status[1],
                        cb: _change,
                      ),
                      Numbers(
                        number: '3',
                        active: status[2],
                        cb: _change,
                      ),
                      Numbers(
                        number: '4',
                        active: status[3],
                        cb: _change,
                      ),
                      Numbers(
                        number: '5',
                        active: status[4],
                        cb: _change,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Numbers(
                        number: '6',
                        active: status[5],
                        cb: _change,
                      ),
                      Numbers(
                        number: '7',
                        active: status[6],
                        cb: _change,
                      ),
                      Numbers(
                        number: '8',
                        active: status[7],
                        cb: _change,
                      ),
                      Numbers(
                        number: '9',
                        active: status[8],
                        cb: _change,
                      ),
                      Numbers(
                        number: '10',
                        active: status[9],
                        cb: _change,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Numbers(
                        number: '11',
                        active: status[10],
                        cb: _change,
                      ),
                      Numbers(
                        number: '12',
                        active: status[11],
                        cb: _change,
                      ),
                      Numbers(
                        number: '13',
                        active: status[12],
                        cb: _change,
                      ),
                      Numbers(
                        number: '14',
                        active: status[13],
                        cb: _change,
                      ),
                      Numbers(
                        number: '15',
                        active: status[14],
                        cb: _change,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Numbers(
                        number: '16',
                        active: status[15],
                        cb: _change,
                      ),
                      Numbers(
                        number: '17',
                        active: status[16],
                        cb: _change,
                      ),
                      Numbers(
                        number: '18',
                        active: status[17],
                        cb: _change,
                      ),
                      Numbers(
                        number: '19',
                        active: status[18],
                        cb: _change,
                      ),
                      Numbers(
                        number: '20',
                        active: status[19],
                        cb: _change,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Numbers(
                        number: '21',
                        active: status[20],
                        cb: _change,
                      ),
                      Numbers(
                        number: '22',
                        active: status[21],
                        cb: _change,
                      ),
                      Numbers(
                        number: '23',
                        active: status[22],
                        cb: _change,
                      ),
                      Numbers(
                        number: '24',
                        active: status[23],
                        cb: _change,
                      ),
                      Numbers(
                        number: '25',
                        active: status[24],
                        cb: _change,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenSize.height * 0.0125,
          ),
          Container(
            height: screenSize.height * 0.11,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    _simulate();
                    Vibration.vibrate(duration: 35);
                  },
                  textColor: Colors.white,
                  color: Colors.purple,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Simular meu\njogo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () {
                    _setgerar();
                    Vibration.vibrate(duration: 35);
                  },
                  textColor: Colors.white,
                  color: Colors.purple,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'Gerar novo\nJogo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenSize.width,
            height: screenSize.height * 0.15,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '13 Pontos: ',
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                    Text(
                      pont_13,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '14 Pontos: ',
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                    Text(
                      pont_14,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '15 Pontos: ',
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                    Text(
                      pont_15,
                      style: TextStyle(
                        fontSize: screenSize.height * 0.025,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
