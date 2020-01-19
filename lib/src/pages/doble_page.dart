import 'package:flutter/material.dart';

class DoblePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 243, 245, 1.0),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _crearIcono(),

              Text('Hello,\nBrian!',style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Text('Deliveries this month:',style: TextStyle(fontSize: 16.0)),

              SizedBox(height: 25.0),
              _crearItem(context, '24', 'January', 'Wireless Keyboard', 'Delivered'),
              _crearItem(context, '27', 'January', 'Sony Headset RXT', 'Arriving tomorrow'),
              _crearItem(context, '21', 'January', 'iPhone 11 (Black)', 'On the way'),


            ],
          ),
        ),
      ),
    );
  }

  Widget _crearIcono() {
    return Container(
      //padding: EdgeInsets.only(bottom: 16.0),
      alignment: Alignment.centerRight,
      child: Ink(
        decoration: ShapeDecoration(
          color: Colors.teal,
          shape: CircleBorder()
        ),
        child: IconButton(
          icon: Text('G', style: TextStyle(fontSize: 26.0, color: Colors.white),),
          onPressed: (){},
        ),
      ),
    );
  }

  Widget _crearItem(BuildContext context, String dia, String mes, String articulo, String estado) {
    Widget item = Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        elevation: 5.0,
        shadowColor: Color.fromRGBO(234, 239, 239, 1.0),
        borderRadius: BorderRadius.circular(20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: Color.fromRGBO(234, 239, 239, 1.0),
            padding: EdgeInsets.all(6.0),
            child: Row(
              children: <Widget>[
                Material(
                  elevation: 5.0,
                  shadowColor: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
                      color: Colors.deepPurple,
                      child: Text(
                        '$dia\n${mes.substring(0,3)}',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('$articulo', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      SizedBox(height: 8.0,),
                      Text('$estado', style: TextStyle(fontSize: 14.0),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

    return GestureDetector(
      child: item,
      onTap: (){
        Navigator.pushNamed(context, 'doble2');
      },
    );
  }
}