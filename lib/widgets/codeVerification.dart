import 'package:flutter/material.dart';
import 'dart:math';
import 'package:sdab_application/data/dataManager.dart' as global;
//import 'package:sdab/widgets/pageConnexion.dart';*/
import 'package:sdab_application/widgets/pageConnexion.dart';

class CodeVerification extends StatefulWidget{
  @override
  _CodeVerification createState() => _CodeVerification();
  
}

class _CodeVerification extends State<CodeVerification>{
  final GlobalKey<FormState> _formKey = new  GlobalKey<FormState>();
  final codeController = TextEditingController();
  bool _autovalidate = false;
  String telephone="65707651";
  void _verifiForm()
  {
    if(this._formKey.currentState.validate())
      {
        Navigator.push(
            context, new MaterialPageRoute(builder: (BuildContext context) {
          return PageConnexion();
        }));
      }
    else
      {
        setState(() {
          _autovalidate = true;
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(

        title: Text('SDAB APPLICATION'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(23, 83, 8, 1),
      ),
      body: new Center(
        child: new Form(
          key: _formKey,
          autovalidate: _autovalidate,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                child: new Text('Code de Vérification',
                  textAlign: TextAlign.center,
                  textScaleFactor: 2.0,
                  style: new TextStyle(
                      color: Color.fromRGBO(23, 83, 8, 1)
                  ),),
              ),
              new Text('Entrer le code que vous avez réçu',
                textScaleFactor: 1.5,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Color.fromRGBO(23, 83, 8, 1)
                ),
              ),
              new Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Card(

                    child: new Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 5,
                      child: new TextFormField(
                        controller: codeController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(

                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          hintText: '0',
                        ),
                        validator: (valeur){
                          if(valeur.isEmpty){
                            return 'Saisir code de validation';
                          }
                          else if(valeur.toString().length<4)
                            {
                              return 'Code à 4 chiffres';
                            }

                          else if(valeur.toString()!=global.code)
                            {
                              return 'mauvais code';
                            }
                          else
                            return null;
                        },

                      ),
                    ),
                  ),
                  new FlatButton(onPressed: _verifiForm,
                      child: new Text('Se connecter',
                        textScaleFactor: 1.0,
                        style: new TextStyle(color:
                        Color.fromRGBO(23, 83, 8, 1)),))
                ],
              )
            ],
          ),

        )

      ),
    );
  }

//  void _sendSMS(String message, List<String> recipents) async {
//    String _result = await sendSMS(message: message, recipients: recipents)
//        .catchError((onError) {
//      print(onError);
//    });
//    //print(_result);
//  }
//
//  void _sendCode(String telephone)
//  {
//    //générer code aléatoire
//    var rng = new Random();
//    var l = new List.generate(4, (_) => rng.nextInt(10));
//    String message = l.toString();
//    List<String> recipents = ["$telephone"];
//    global.code =message;
//    _sendSMS(message, recipents);
//  }
  
}