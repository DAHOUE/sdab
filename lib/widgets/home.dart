
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*import 'package:sdab/widgets/pageConnexion.dart';
import 'package:sdab/widgets/textAvecStyle.dart';
import 'package:sdab/models/menu.dart';
import 'package:sdab/widgets/parser.dart';*/
import 'package:sdab_application/models/menu.dart';
import 'package:sdab_application/widgets/champ.dart';
import 'package:sdab_application/widgets/pageConnexion.dart';
import 'package:sdab_application/widgets/parser.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';
import 'package:webfeed/webfeed.dart';

import 'carte_map.dart';
import 'liste.dart';

class Home extends StatefulWidget{
  @override
 _HomeState createState() => _HomeState();

}

class _HomeState extends State<Home>{

  List<Menu> elementsMenu = [
    new Menu('Appui financier', 'assets/Icones/icons8_receive_cash_100px.png'),
    new Menu('Marché', 'assets/Icones/icons8_shopping_cart_100px.png'),
    new Menu('Paiement', 'assets/Icones/icons8_Weak_Financial_Growth_100px.png'),
    new Menu('Informations', 'assets/Icones/icons8_statistics_100px.png'),
    new Menu('Fiche Technique', 'assets/Icones/icons8_pineapple_60px.png'),
    new Menu('Opportunités', 'assets/Icones/icons8_Bad_Idea_100px.png'),
    new Menu('Forum', 'assets/Icones/icons8_comment_discussion_100px.png'),
    new Menu('FAQ', 'assets/Icones/icons8_faq_100px.png'),
    new Menu('Nous contacter', 'assets/Icones/icons8_worldwide_location_100px_2.png'),
    new Menu('Quitter', 'assets/Icones/icons8_close_window_100px.png'),
  ];
  String elementMenuChoisi;
  bool booleanColor = true;
  RssFeed rssFeed;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    parser();
  }

  
  @override
  Widget build(BuildContext context) {

   return new GestureDetector(
     onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
     child: new Scaffold(
       appBar: AppBar(

         title: Text('SDAB'),
         centerTitle: true,
         backgroundColor: Color.fromRGBO(23, 83, 8, 1),
       ),
       drawer: new Drawer(
          child: new Container(
            color: Colors.grey[900],
            child: new ListView.builder(
              itemCount: elementsMenu.length,
              itemBuilder: (context, i){
                if (i == 0){
                  return Center(
                    child: DrawerHeader(

                              //color: Colors.white,
                              child: new Text('Menu', textScaleFactor: 1.6, style: new TextStyle(color: Colors.white),),

                    ),
                  );
              } else {
                  return new ListTile(

                    title: new Text(elementsMenu[i].nom, textScaleFactor: 1.5, style: new TextStyle(color: Colors.white),),
                    leading: new Image.asset(elementsMenu[i].iconePATH),
                    onTap: (){
                      elementMenuChoisi = elementsMenu[i].nom;
                        if(elementMenuChoisi.contains("Fiche Technique") ){
                          Navigator.pushReplacement(context, new MaterialPageRoute(builder: (BuildContext buildContext){
                            return new Champ();
                          }));
                        } else{
                          Navigator.pop(context);
                        }
                    },
                  );
                  }

                }),
          ),
       ),
        floatingActionButton: Container(

         alignment: Alignment.bottomCenter,
          child: new FloatingActionButton.extended(
            elevation: 8.0,

            label: TextAvecStyle((booleanColor) ? 'Disponibilité d\'ananas' : 'Actualité', color: Color.fromRGBO(23, 83, 8, 1), fontWeight: FontWeight.bold,),
            onPressed: (){
                setState(() {
                  booleanColor = !booleanColor;
                });
            },
            backgroundColor: Colors.white

          ),
        ),
       body: (booleanColor) ? actualite() : Carte(),

     ),
   );
  }

  Future<Null> parser() async{
    RssFeed recu = await Parser().main();
    if(recu != null){
      setState(() {
        rssFeed = recu;
        print(rssFeed.items.length);
        rssFeed.items.forEach((element) {
          RssItem rssItem = element;
        });
      });
    }
  }

  Widget actualite() {
  if(rssFeed == null ){
  return new Chargement();
  } else {
  Orientation orientation = MediaQuery.of(context).orientation;
  if(orientation == Orientation.portrait){
  return new Liste(rssFeed);
  }else{
  //grille
     }
   }
  }

  Widget choixDuBody(){
    if(booleanColor){
      actualite();
    } else{
      return new Carte();
    }
  }

  void versPageMotDePasseOublie(){
    // ignore: non_constant_identifier_names
    Navigator.push(context , new MaterialPageRoute(builder: (BuildContext){
      return new PageConnexion();

    }));
  }

  Color setColor() {
    if(booleanColor){
      return Color.fromRGBO(23, 83, 8, 1);
    }else{
      return Colors.white;
    }
  }

  Color setColorText(){
    if(booleanColor){
      return Colors.white;
    }else{
      return Color.fromRGBO(23, 83, 8, 1);
    }
  }

  Widget ActualiteAnanas(){
    double taille = MediaQuery.of(context).size.width * 0.85;
    return new SingleChildScrollView(

      child: new Column(

        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(height: 15.0,),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new RaisedButton(
                  elevation: 8.0,
                  color: setColor(),
                  child: new TextAvecStyle('Actualité', color: setColorText(),),
                  onPressed: (){
                    setState(() {
                      booleanColor = ! booleanColor;
                    });
                  }),
              new RaisedButton(
                  elevation: 8.0,
                  color: setColorText(),
                  child: new TextAvecStyle('Carte', color: setColor(),),
                  onPressed: (){
                    setState(() {
                      booleanColor = ! booleanColor;
                    });
                  }),
            ],
          ),
          SizedBox(height: 25.0,),
          new Card(
            elevation: 10.0,
            child: new Container (

              height: taille * 0.75,
              width: taille,
              child: new Text('SDAB', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white), textScaleFactor: 2.0,),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/ananas1.jpeg'))
              ),
            ),

          ),
          SizedBox(height: 15.0,),
          new Card(
            elevation: 10.0,
            child: new Container (
              height: taille * 0.75,
              width: taille,
              child: new Text('SDAB', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white), textScaleFactor: 2.0,),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/ananas2.jpeg'))
              ),
            ),

          ),
          SizedBox(height: 15.0,),
          new Card(
            elevation: 10.0,
            child: new Container (
              height: taille * 0.75,
              width: taille,
              child: new Text('SDAB', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white), textScaleFactor: 2.0,),
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/anaans3.jpg'))
              ),
            ),

          ),
          SizedBox(height: 15.0,),
          new Card(
            elevation: 10.0,
            child: new Container (

              height: taille * 0.75,
              width: taille,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/ananas4.webp'))
              ),
              child: new Text('SDAB', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white), textScaleFactor: 2.0,),
            ),

          ),
          SizedBox(height: 15.0,),
          new Card(
            elevation: 10.0,
            child: new Container (
              height: taille * 0.75,
              width: taille,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage('assets/images/ananas5.jpg'))
              ),
              child: new Text('SDAB', textAlign: TextAlign.center, style: new TextStyle(color: Colors.white), textScaleFactor: 2.0,),
            ),

          ),
          new FlatButton(onPressed: versPageMotDePasseOublie,
              child: new Text('Se connecter',
                textScaleFactor: 1.0,
                style: new TextStyle(color:
                Colors.blue),))
        ],

      ),
    );
  }
}

class Chargement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Center(
      /*child: new TextAvecStyle('Chargement en cours ...',
        fontSize: 30.0,
        fontStyle: FontStyle.italic,),*/
        child: Container(
          height: 50,
          width: 50,
          child: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation(Color.fromRGBO(23, 83, 8, 1)),
            strokeWidth: 6,

            //semanticsValue: '20%',
          ),
        )
    );
  }

}
