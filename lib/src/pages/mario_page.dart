import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class MarioPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _crearAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearTarjetas(context),
            
            _crearBalance(),

            Divider(),

            _crearDatos('Name', 'Super Mario'),
            Divider(),
            _crearDatos('Card Nit', '400-1234-5678-9010'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: (){}
      ),
    );
  }

  Widget _crearAppbar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      leading: Icon(Icons.arrow_back_ios, color: Color.fromRGBO(128, 189, 191, 1.0), size: 30.0),
      title: Text('PAYMENT', style: TextStyle(color: Color.fromRGBO(128, 189, 191, 1.0), fontSize: 24.0, fontWeight: FontWeight.bold)),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.play_circle_outline, color: Color.fromRGBO(128, 189, 191, 1.0), size: 30.0),
          onPressed: (){},
        )
      ],
    );
  }

  Widget _crearTarjetas(BuildContext context) {

    final tarjetas = <Widget>[
      _insertarTarjeta(Colors.orangeAccent),
      _insertarTarjeta(Colors.redAccent),
      _insertarTarjeta(Colors.lightBlueAccent),
      _insertarTarjeta(Colors.greenAccent),
      _insertarTarjeta(Colors.purpleAccent),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 40.0),
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return tarjetas[index];
        },
        itemCount: tarjetas.length,
        itemWidth: double.infinity,
        itemHeight: 225.0,
        layout: SwiperLayout.TINDER,
      ),
    );

  }

  Widget _insertarTarjeta(Color color){
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        width: double.infinity,
        height: 200.0,
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(Icons.credit_card, size: 24.0, color: Colors.white),
            Container(
              width: double.infinity,
              child: Text('2301 **** **** 3029', style: TextStyle(fontSize: 30.0, color: Colors.white), textAlign: TextAlign.center)
            ),
            Text('12/20', style: TextStyle(fontSize: 20.0, color: Colors.white))
          ],
        ),
      ),
    );
  }

  Widget _crearBalance() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Current Balance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.grey)),
          SizedBox(height: 10.0,),
          Text('\$ 960', style: TextStyle(color: Colors.orangeAccent, fontSize: 60.0)),
        ],
      ),
    );
  }

  Widget _crearDatos(String titulo, String dato) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 5.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(titulo, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0, color: Colors.grey)),
          SizedBox(height: 5.0,),
          Text(dato, style: TextStyle(color: Colors.black26, fontSize: 24.0)),
        ],
      ),
    );
  }
}