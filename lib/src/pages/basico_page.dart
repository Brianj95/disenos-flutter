import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubtitulo = TextStyle(fontSize: 16.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[

            _crearImagen(),

            _crearTitulo(),

            _crearAcciones(),

            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto(),

          ],
        ),
      )
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(30.0)),
        child: FadeInImage(
          image: NetworkImage('https://media2.giphy.com/media/YrTnRM6fKIB4iqHuN1/giphy.gif'),
          placeholder: AssetImage('assets/img/loading.gif'),
          fit: BoxFit.cover,
          height: 300.0,
        ),
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Lago como un puente', style: estiloTitulo),
                  SizedBox(height: 7.0),
                  Text('Un lago re loco.', style: estiloSubtitulo),
                ],
              ),
            ),

            Icon(Icons.star, color: Colors.red, size: 30.0,),
            Text('28', style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'Llamar'),
        _accion(Icons.near_me, 'Rutas'),
        _accion(Icons.share, 'Compartir')
      ],
    );
  }

  Widget _accion( IconData icon, String texto){
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 15.0),
        Text(texto, style: TextStyle(fontSize: 16.0, color: Colors.blue))
      ],
    );
  }

  Widget _crearTexto() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text(
        'Labore excepteur ullamco aute mollit occaecat laboris tempor occaecat exercitation eu aliquip ullamco et. Amet consectetur eiusmod nostrud irure. Consectetur fugiat pariatur laborum laborum sint voluptate ipsum fugiat. Quis enim elit do velit.',
        textAlign: TextAlign.justify,
      ),
    );
  }
}