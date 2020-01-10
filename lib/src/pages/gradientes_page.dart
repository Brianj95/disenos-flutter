import 'package:flutter/material.dart';

class GradientesPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _crearAppBar(),
        body: Stack(
          children: <Widget>[
            _crearFondo(),
            _crearFiltro(),

            _crearScroll()
          ],
        ),
      ),
    );
  }

  Widget _crearAppBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 55.0),
      child: Container(
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Icon(Icons.arrow_back),
          centerTitle: true,
          title: Text('Gradientes'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: (){},
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){},
            ),
          ],
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(189, 93, 183, 1.0),
              Color.fromRGBO(82, 142, 240, 1.0),
            ]
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[700],
              blurRadius: 20.0,
              spreadRadius: 1.0
            )
          ]
        ),
      ),
    );
  }

  Widget _crearFondo() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(254, 172, 94, 1.0),
            Color.fromRGBO(199, 121, 208, 1.0),
            Color.fromRGBO(75, 192, 200, 1.0),
          ]
        )
      ),
    );
  }

  Widget _crearFiltro() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white24,
    );
  }

  Widget _crearScroll(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Container(
            width: double.infinity,
            //margin: EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            color: Colors.black26,
            child: Table(
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(
                          child: RaisedButton(
                            onPressed: (){},
                            child: Text('Botón 1', style: TextStyle(color: Colors.white),),
                            color: Colors.transparent,
                            elevation: 0,

                          ),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(252, 70, 107, 1.0),
                                Color.fromRGBO(63, 94, 251, 1.0),
                              ]
                            )
                          )
                        ),
                      ),
                    ),
                    Text('2'),
                    Text('3'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                  ]
                ),
                TableRow(
                  children: [
                    Text('1'),
                    Text('2'),
                    Text('3'),
                  ]
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
