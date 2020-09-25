import 'package:flutter/material.dart';
import 'package:sdab_application/widgets/date_convertisseur.dart';
import 'package:sdab_application/widgets/tableauOperation.dart';
import 'package:sdab_application/widgets/tableauPrevision.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';
import 'package:sdab_application/data/dataManager.dart' as global;

class FicheTechnique extends StatefulWidget{
  @override
  _FicheTechniqueState createState() => _FicheTechniqueState();

}

class _FicheTechniqueState extends State<FicheTechnique>  {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate=false;
  final ethrellageController = TextEditingController();
  final modePlantationController = TextEditingController();
  final densiteController = TextEditingController();
  String typedeCultivar;
  String valeure_de_ethrelage;
  DateTime dateTimechoisie;
  int _nombre_de_jours;
  String mode_de_plantation;

  void _validerFiche()
  {
    if(this._formKey.currentState.validate())
    {
      global.modePlantation=modePlantationController.text;
      if(valeure_de_ethrelage.toString()!='non')
        {
          global.ethrellage=true;
        }
      else{
        global.ethrellage=false;
      }

      global.typePlantation= typedeCultivar.toString();
      global.date=dateTimechoisie;
      generer();

      Navigator.push(
          context, new MaterialPageRoute(builder: (BuildContext context) {
        return new PageTableauPrevison();
      }));
    }
    else
    {
      setState(() {
        this._autovalidate = true;
      });
    }
  }




  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
      child: new Scaffold(
        body: new SingleChildScrollView(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /*new Image.asset("assets/Icones/ababab.png",
                fit: BoxFit.fill,
                height: MediaQuery.of(context).size.width / 2,),*/
              SizedBox(height: 60.0,),
              new TextAvecStyle("Remplir les champs suivants pour générer une fiche technique ", fontWeight: FontWeight.bold, fontSize: 30.0, color: Color.fromRGBO(23, 83, 8, 1),),
              SizedBox(height: 20.0,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Form(
                    key: _formKey,
                    autovalidate: _autovalidate,
                    child: new Column(
                      children: [
                        SizedBox(height: 15.0,),
                        Container(
                          child: new DropdownButton<String>(
                            value: valeure_de_ethrelage,
                            hint: new TextAvecStyle('Ethrellage'),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Color.fromRGBO(23, 83, 8, 1)),
                            underline: Container(
                              height: 2,
                              color: Color.fromRGBO(23, 83, 8, 1),
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                valeure_de_ethrelage = newValue;
                              });
                            },
                            items: <String>['1. oui', '2. non']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        /*new TextFormField(
                          controller: modePlantationController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(start: 5.0),
                              child: new Image.asset('assets/Icones/icons8_test_filled_100px.png'),
                            ),
                            hintText: "Mode de plantation",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          // ignore: missing_return
                          validator: (valeur){
                            if(valeur.isEmpty){
                              print('Entrer votre mode de plantation');
                            }else
                            {
                              return null;
                            }

                          },
                        ),
                        SizedBox(height: 15.0,),*/
                        new  Container(
                          child: DropdownButton<String>(
                            value: mode_de_plantation,
                            hint: new TextAvecStyle('Mode de plantation'),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Color.fromRGBO(23, 83, 8, 1)),
                            underline: Container(
                              height: 2,
                              color: Color.fromRGBO(23, 83, 8, 1),
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                mode_de_plantation = newValue;
                              });
                            },
                            items: <String>['1. En ligne simple', '2. En bande']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 15.0,),
                        new  Container(
                          child: DropdownButton<String>(
                            value: typedeCultivar,
                            hint: new TextAvecStyle('Cultivar'),
                            iconSize: 24,
                            elevation: 16,
                            style: TextStyle(color: Color.fromRGBO(23, 83, 8, 1)),
                            underline: Container(
                              height: 2,
                              color: Color.fromRGBO(23, 83, 8, 1),
                            ),
                            onChanged: (String newValue) {
                              setState(() {
                                typedeCultivar = newValue;
                              });
                            },
                            items: <String>['1. Pain de sucre', '2. Cayenne lisse']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        new TextFormField(
                          controller: densiteController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(start: 5.0),
                              child: new Image.asset('assets/Icones/icons8_test_filled_100px.png'),
                            ),
                            hintText: "Densité à adopter",

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          // ignore: missing_return
                          validator: (valeur){
                            if(valeur.isEmpty){
                              print('Entrer la densité');
                            }else
                            {
                              return null;
                            }

                          },
                        ),
                        new Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.white30,
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            //onPressed: _validerVormulaire,
                            onPressed: (){
                              montrerDate();
                            },
                            child: Text((dateTimechoisie != null) ? dateTimechoisie.toString().substring(0, 10) : "Choisir la date de plantation",
                              textAlign: TextAlign.center,
                              style: style.copyWith(
                                color: Color.fromRGBO(23, 83, 8, 1),

                              ),),),),
                        SizedBox(height: 45.0,),
                        new Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30.0),
                            //color: Color(0xff01A0C7),
                            color: Color.fromRGBO(23, 83, 8, 1),
                            child: MaterialButton(
                              minWidth: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              //onPressed: _validerVormulaire,
                              child: Text("Générer la fiche",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,

                                ),),
                            onPressed: _validerFiche,)
                        ),

                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );




  }
  Future<Null> montrerDate() async{
    DateTime choix = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
        firstDate: new DateTime(1990),
      lastDate: new DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,

    );
    if(choix != null){
      var difference = new DateTime.now().difference(choix);
      var jours = difference.inDays;
      var ans = (jours / 365);
      setState(() {
         _nombre_de_jours= jours;
         dateTimechoisie = choix;
      });
    }
  }

  void generer()
  {
    var nb;
    double lt=global.superficie * 6.66;
    global.Nombre_de_plants = lt.toInt();
    nb= global.Nombre_de_plants;
    global.Nombre_de_Sarclage=10;
    global.QuantiteNPK_a_acheter = 18.32*nb / 1000;
    global.QuantitUree = 11.03* nb / 1000;
    global.Quantite_K2SO4 = 10.60 *nb / 100;
    global.Quantite_carbure_calcium=0.1126*nb / 1000;
    global.NombreApplication_NPK=3;
    global.Nombre_application_uree=2;
    global.Nombre_application_K2SO4=1;
    global.Quantite_eau_TIF =50.0*nb / 1000;
    global.Quantite_eau_ethephon=20.0*nb / 1000;
    global.Quantite_ethephon_champ=0.6*nb / 1000;
    global.nombre_sarclage=12;
    global.periode_recolte='rrr' ;
    global.nombrePlants =nb ;
    global.periode_tif = dateTimechoisie.add(new Duration(days: 365)).toString();
    global.periode_recolte = dateTimechoisie.add(new Duration(days: 505)).toString();
  }



}