import 'package:flutter/material.dart';
import 'package:sdab_application/widgets/fiche_technique.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';

class Champ extends StatefulWidget{
  @override
  _ChampState createState() => _ChampState();

}

class _ChampState extends State<Champ>  {

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();
  bool _autovalidate=false;
  final phoneController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
     child: new Scaffold(
        body: new SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new Image.asset("assets/Icones/ababab.png",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width / 2,),
                new TextAvecStyle("Enregistrement de champ", fontWeight: FontWeight.bold, fontSize: 30.0, color: Color.fromRGBO(23, 83, 8, 1),),
                SizedBox(height: 20.0,),
                new Form(
                    key: _formKey,
                    autovalidate: _autovalidate,
                    child: new Column(
                      children: [
                        new TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsetsDirectional.only(start: 5.0),
                              child: new Image.asset('assets/Icones/icons8_test_filled_100px.png'),
                            ),
                            hintText: 'Ville du champ',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                          ),
                          validator: (valeur){
                            if(valeur.isEmpty){
                              return 'Entrer la ville de votre champ';
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
                              child: new Image.asset('assets/Icones/icons8_test_filled_100px.png'),
                            ),
                            hintText: "Quartier du champ",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          // ignore: missing_return
                          validator: (valeur){
                            if(valeur.isEmpty){
                              print('Entrer votre mot de passe');
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
                              child: new Image.asset('assets/Icones/icons8_test_filled_100px.png'),
                            ),
                            hintText: "Superfice du champ en m2",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                          ),
                          // ignore: missing_return
                          validator: (valeur){
                            if(valeur.isEmpty){
                              print('Entrer la superficie de votre champ');
                            }else
                            {
                              return null;
                            }

                          },
                        ),
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
                              onPressed: (() => {
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (BuildContext buildContext){
                                      return new FicheTechnique();
                                    })),
                              }),
                              child: Text("Suivant",
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
     ),
   );
  }

}