import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class PageTableauRentabilite extends StatefulWidget {

  @override
  _PageTableauRentabilite createState() => _PageTableauRentabilite();
}

class _PageTableauRentabilite extends State<PageTableauRentabilite> {
  static const TextStyle style = TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w600,
      wordSpacing: 0.2,
      fontSize: 15.0,
      //color: Color()
    //decorationThickness: 0.2
  );
  List<String> columns = new List<String>();
  List<Container> containers = new List<Container>();
  List<Color> colors = new List<Color>();


  @override
  Widget build(BuildContext context) {
    columns.addAll([
      'Parametres', 'Coût de production',
      'Recette de Vente totale réalisée',
      'Profit'
    ]);

    for(int a=0;a<columns.length;a++)
      {
        var cl;
        if(a%2==0)
        {
          cl=Color.fromRGBO(153, 204, 153, 70.0);
        }
        else
        {
          cl=Colors.white;
        }
        containers.add(new Container(
          width: 330,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(columns[a],style: style,),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text('Le texte ici'),
              ),
            ],
          ),
          height: 100.0,

          margin: const EdgeInsets.only(bottom: 6.0),
          decoration: BoxDecoration(
              color: cl,
              borderRadius: BorderRadius.circular(5.0),

              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 15.0,
                ),
              ]
          ),

        ));
      }

    colors.addAll([
      Color.fromRGBO(207, 202, 202, 0.83),
      Color.fromRGBO(206, 211, 207, 0.83),
      Color.fromRGBO(191, 205, 205, 0.8),
      Color.fromRGBO(196, 218, 213, 0.85),
      Color.fromRGBO(196, 234, 205, 0.92),
      Color.fromRGBO(253, 209, 45, 0.99),
      Color.fromRGBO(209, 203, 109, 0.89),
      Color.fromRGBO(227, 214, 112, 0.89),
      Color.fromRGBO(205, 179, 180, 0.8),
      Color.fromRGBO(205, 145, 158, 0.8),
      Color.fromRGBO(194, 193, 188, 0.76),
      Color.fromRGBO(179, 178, 163, 0.7),
//      Color.fromRGBO(166, 131, 141, 0.65),
//      Color.fromRGBO(44, 70, 79, 0.31),
//      Color.fromRGBO(255, 178, 168, 1),
//      Color.fromRGBO(194, 175, 161, 0.76),
//      Color.fromRGBO(188, 126, 126, 0.74),
//      Color.fromRGBO(205, 181, 205, 0.8),
//      Color.fromRGBO(201, 185, 111, 0.79),
//      Color.fromRGBO(182, 152, 91, 71)


    ]);





    return new GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: new Scaffold(
          appBar: AppBar(
            title: Text('Rentabilité économique',
            style: TextStyle(fontWeight: FontWeight.bold,color:
                Colors.white, fontSize: 15.0,),

          ),
          backgroundColor: Color.fromRGBO(23, 83, 8, 1),


          ),
            body: new SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(height:15.0,),
                        SizedBox(height: 20.0,),
                      Column(
                        children: containers,
                      ),
                      ],
                    )

                ))));
  }

}
