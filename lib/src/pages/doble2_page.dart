
import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class Doble2Page extends StatefulWidget {
  @override
  _Doble2State createState() => _Doble2State();
}

class _Doble2State extends State<Doble2Page> {
  double _sliderValue;

  @override
  void initState() { 
    super.initState();
    
    _sliderValue = 0.4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1.0),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Sony Headset', style: TextStyle(color: Colors.black, fontSize: 22.0)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _crearBarra(),

                crearImagen()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.teal,
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.phone),
                          onPressed: (){},
                        ),
                      ),
                    ),

                    SizedBox(height: 10.0),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        color: Colors.black,
                        child: IconButton(
                          color: Colors.white,
                          icon: Icon(Icons.message),
                          onPressed: (){},
                        ),
                      ),
                    )
                  ],
                ),

                VerticalDivider(thickness: 20.0,color: Colors.black,width: 20.0,),

                Expanded(child: Text('Delivery Time:\n15:30',textAlign: TextAlign.center,))
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: Colors.deepPurple,
          child: Text('Track'),
          isExtended: true,
          onPressed: (){},
        ),
      ),
    );
  }

  Widget crearImagen() {
    return Stack(
      alignment: Alignment.centerRight,
      children: <Widget>[
        CustomPaint( //                       <-- CustomPaint widget
          size: Size(160, 160),
          painter: MyPainter(),
        ),
        FadeInImage(
          width: 100.0,
          height: 150.0,
          image: NetworkImage('https://www.sony.com.ar/image/d76a7b53757e0e073d5a5c430c860f58?fmt=png-alpha&wid=440&hei=440'),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.fitHeight,
        ),
      ],
    );
  }

  Widget _crearBarra() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 14.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: RotatedBox(
          quarterTurns: 1,
          child: SizedBox(
            height: 15.0,
            width: 300.0,
            child: LinearProgressIndicator(
              value: _sliderValue,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              backgroundColor: Colors.grey[400],
            ),
          )
        ),
      ),
    );
  }
}


class MyPainter extends CustomPainter { //         <-- CustomPainter class
  @override
  @override
  void paint(Canvas canvas, Size size) {
    final pointMode = ui.PointMode.points;
    final List<Offset> points = [];
    for (var i = 0; i <= 4; i++) {
      for (var j = 0; j <= 4; j++) {
        points.add(
          Offset(40.0*i, 40.0*j)
        );
      }
    }

    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawPoints(pointMode, points, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter old) {
    return false;
  }
}