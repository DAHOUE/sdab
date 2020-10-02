
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/*import 'package:sdab/widgets/home.dart';
import 'package:sdab/widgets/pageInscription.dart';
import 'package:sdab/widgets/pageMotDePasseOubliee.dart';
import 'package:sdab/widgets/textAvecStyle.dart';*/
import 'package:sdab_application/widgets/pageInscription.dart';
import 'package:sdab_application/widgets/pageMotDePasseOubliee.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';

import 'home.dart';

class PageConnexion extends StatefulWidget{
  PageConnexion({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _PageConnexion createState() => _PageConnexion();

}

class _PageConnexion extends State<PageConnexion> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();

  //Mes changements
  bool _autovalidate=false;
  final phoneController = TextEditingController();
  final pswdController = TextEditingController();

  @override
  void dispose(){
    phoneController.dispose();
    pswdController.dispose();
    super.dispose();
  }

  //

  @override
  Widget build(BuildContext context) {
    void _validerVormulaire()
    {
      if(this._formKey.currentState.validate()) {
        if (phoneController.text == "65707651" &&
            pswdController.text == "12345") {
          Navigator.push(
              context, new MaterialPageRoute(builder: (BuildContext context) {
            return new Home();
          }));
        }
        else {

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Erreur d'authentification"),
                  content: Text(
                    'Numéro ou mot de passe incorrecte', textAlign: TextAlign.center,
                  ),
                  actions: <Widget>[
                    FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("OK"))
                  ],
                );
              });

        }
      }
      else
       {
          setState(() {
            this._autovalidate=true;
          });
       }
    }

    return new GestureDetector(
        onTap: (() => FocusScope.of(context).requestFocus(new FocusNode())),
        child: new Scaffold(
        body: new SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Image.asset("assets/Icones/ababab.png",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.width / 2,),
                  new TextAvecStyle("Connexion", fontWeight: FontWeight.bold, fontSize: 30.0, color: Color.fromRGBO(23, 83, 8, 1),),
                  SizedBox(height: 20.0,),
                  new Form(
                    key: _formKey,
                    autovalidate: _autovalidate,
                      child: new Column(
                        children: [
                          new TextFormField(
                            controller: phoneController,
                            maxLength: 8,

                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                              prefixIcon: Padding(
                                padding: const EdgeInsetsDirectional.only(start: 5.0),
                                child: new Image.asset('assets/Icones/icons8_number_pad_filled_100px_1.png'),
                              ),
                              labelText: 'Téléphone',
                              labelStyle: new TextStyle(color: Color.fromRGBO(23, 83, 8, 1)),
                              hintText: 'ex: 94170440',
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                            ),
                            validator: (valeur){
                              if(valeur.isEmpty){
                                return 'Entrer votre numéro de téléphone';
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
                              labelText: 'Mot de passe',
                              labelStyle: new TextStyle(color: Color.fromRGBO(23, 83, 8, 1)),
                              hintText: "ex: ..........",
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
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              new FlatButton(onPressed: versPageMotDePasseOublie,
                                  child: new Text('Mot de passe oublié',
                                    textScaleFactor: 1.0,
                                    style: new TextStyle(color:
                                    Color.fromRGBO(23, 83, 8, 1)),)),
                            ],
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
                                onPressed: _validerVormulaire,
                                child: Text("Se connecter",
                                  textAlign: TextAlign.center,
                                  style: style.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,

                                  ),),)
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children:<Widget>[
                              new TextAvecStyle('Pas de compte ?', color: Colors.black,),
                              new FlatButton(onPressed: versPageInscription,
                                  child: new Text('S\'inscrire',
                                    textScaleFactor: 1.0,
                                    style: new TextStyle(color:
                                    Color.fromRGBO(23, 83, 8, 1)),))
                            ],
                          )
                        ],
                      )),




                ]),
          ),)
    )
    );
  }

  void versPageMotDePasseOublie(){
    // ignore: non_constant_identifier_names
    Navigator.push(context , new MaterialPageRoute(builder: (BuildContext){
      return new PageMotDePasseOubliee();

    }));
  }

  void versPageInscription(){
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
      return new PageInscription();
    }));
  }

}