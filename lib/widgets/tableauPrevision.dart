import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sdab_application/widgets/tableauOperation.dart';
import 'package:sdab_application/data/dataManager.dart' as global;


class PageTableauPrevison extends StatefulWidget {

  @override
  _PageTableauPrevision createState() => _PageTableauPrevision();
}

class _PageTableauPrevision extends State<PageTableauPrevison> {
  static const TextStyle style = TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700
  );
  List<Container> containers = new List<Container>();
  List<String> columns = new List<String>();
  List<Color> colors = new List<Color>();
  List<Color> color = new List<Color>();
  List<String> variables = new List<String>();
  Map<String,String> mp=new Map();


  @override
  Widget build(BuildContext context) {
    columns.addAll([
      'Nombre de plants',
      'Nombre de Sarclage',
      'Quantité d’engrais de NPK à acheter',
      'Quantité d’engrais de d’urée à acheter',
      'Quantité d’engrais de K2SO4 à acheter',
      'Nombre d’application de NPK',
      'Quantité de carbure de calcium à acheter',
      'Nombre d’application de d’urée',
      'Nombre d’application de K2SO4',
      'Quantité d’eau à utiliser pour la solution de TIF',
      'Quantité d’eau à utiliser pour la solution de d’éthéphon à acheter',
      //'Quantité d’eau nécessaire pour couvrir tout le champ',
      'le nombre à réaliser sarclage',
      'Période de la récolte',
      'Periode du tif',

    ]);


    variables.addAll([
      global.nombrePlants.toString(),
      global.nombre_sarclage.toString(),
      global.QuantiteNPK_a_acheter.toString() + " Kg",
      global.QuantitUree.toString()  + " Kg",
      global.Quantite_K2SO4.toString()  + " Kg",
      global.NombreApplication_NPK.toString(),
      global.Quantite_carbure_calcium.toString() + " Kg",
      global.Nombre_application_uree.toString(),
      global.Nombre_application_K2SO4.toString(),
      global.Quantite_eau_TIF.toString()  + " L",
      global.Quantite_eau_ethephon.toString()  + " L",
      global.nombre_sarclage.toString(),
      global.periode_tif.substring(0, 10),
      global.periode_recolte.substring(0, 10)
//      global.periode_recolte,
//      global.periode_tif


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
              child: Text(variables[a]),
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







    return new GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: new Scaffold(
            appBar: AppBar(
              title: Text('Fiche indicative des prévisions',
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
                        new FloatingActionButton(
                          onPressed: tableauSuivant,
                          child: Icon(
                            Icons.arrow_forward,
                            color: Color.fromRGBO(23, 83, 8, 1),
                          ),
                        )
                      ],
                    )

                ))));
  }
  void tableauSuivant()
  {
    Navigator.push(
        context, new MaterialPageRoute(builder: (BuildContext context) {
      return new PageTableauOperation();
    }));
  }

}
