import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class PageTableauOperation extends StatefulWidget {

  @override
  _PageTableauOperation createState() => _PageTableauOperation();
}

class _PageTableauOperation extends State<PageTableauOperation> {
  static const TextStyle style = TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w700
  );

  List<String> columns = new List<String>();
  List<Container> containers = new List<Container>();

  @override
  Widget build(BuildContext context) {
    columns.addAll([
      'Opérations', 'Date de réalisation',
      'Quantité\/plant','Unité','Instruments à utiliser','Coût',
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
              child: Text('Le texte vide'),
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
              title: Text('Fiche d’opérationnalisation et d’exécution des activités',
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
