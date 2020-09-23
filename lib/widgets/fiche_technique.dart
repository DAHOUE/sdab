import 'package:flutter/material.dart';
import 'package:sdab_application/widgets/date_convertisseur.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';

class FicheTechnique extends StatefulWidget{
  @override
  _FicheTechniqueState createState() => _FicheTechniqueState();

}

class _FicheTechniqueState extends State<FicheTechnique>  {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate=false;
  final phoneController = TextEditingController();
  final pswdController = TextEditingController();
  String typedeCultivar;
  DateTime dateTimechoisie;

  int _nombre_de_jours;
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
              new Form(
                  key: _formKey,
                  autovalidate: _autovalidate,
                  child: new Column(
                    children: [
                      /*new RaisedButton(
                          child: TextAvecStyle("Date de plantation", fontWeight: FontWeight.bold, fontSize: 30.0, color: Color.fromRGBO(23, 83, 8, 1),),
                          onPressed: () => montrerDate()),*/

                      /*new TextFormField(
                        controller: pswdController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
                          ),
                          hintText: "Sélectionner la date de plantation",
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
                      ),*/
                      SizedBox(height: 15.0,),
                      new TextFormField(
                        controller: phoneController,
                        maxLength: 8,

                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: new Image.asset('assets/Icones/icons8_number_pad_filled_100px_1.png'),
                          ),
                          hintText: 'Ethrainage',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                        ),
                        validator: (valeur){
                          if(valeur.isEmpty){
                            return 'Entrer l\'éthreinage';
                          }else
                            return null;
                        },
                      ),
                      SizedBox(height: 10.0,),
                      new TextFormField(
                        controller: pswdController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
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
                      SizedBox(height: 10.0,),
                      new TextFormField(
                        controller: pswdController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                          prefixIcon: Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5.0),
                            child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
                          ),
                          hintText: "Densité à adopter",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                        ),
                        // ignore: missing_return
                        validator: (valeur){
                          if(valeur.isEmpty){
                            print('Entrer la densité que vous avez utilisé');
                          }else
                          {
                            return null;
                          }

                        },
                      ),
                      SizedBox(height: 15.0,),
                      new  Container(
                        child: DropdownButton<String>(
                          value: typedeCultivar,
                          hint: new TextAvecStyle('Choisir le type de plantation'),
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
                          items: <String>['Pain de sucre', 'Cayaine']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
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
                          child: Text((dateTimechoisie != null) ? new DateConvertisseur().convertirDate(dateTimechoisie.toString())+"  (Changer)" : "Choisir la date de plantation",
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

                              ),),)
                      ),
                    ],
                  )),
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

}