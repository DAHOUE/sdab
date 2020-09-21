import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:sdab/widgets/codeVerification.dart';
//import 'package:sdab/widgets/miseAJourMotDePasse.dart';
//import 'package:sdab/widgets/textAvecStyle.dart';

//import 'package:sdab/data/dataManager.dart' as global;
import 'package:sdab_application/widgets/textAvecStyle.dart';

import 'codeVerification.dart';

class PageMotDePasseOubliee extends StatefulWidget {

  @override
  _PageMotDePasseOublie createState() => _PageMotDePasseOublie();
}

class _PageMotDePasseOublie extends State<PageMotDePasseOubliee>{
  final GlobalKey <FormState> _formKey = GlobalKey<FormState>();

  //Mes changements
  bool _autovalidate=false;
  final phoneController = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    void _validerForm()
    {
      if(this._formKey.currentState.validate())
        {
          //_sendCode(phoneController.text);
          versPageMiseAJourMotDePasse();
        }
      else
        {
          setState(() {
            _autovalidate =true;
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 100.0,),
                      new Image.asset("assets/Icones/icons8_forgot_password_filled_100px.png",
                        fit: BoxFit.fill,
                        height: MediaQuery.of(context).size.width / 2,),
                      SizedBox(height: 15.0,),
                      new TextAvecStyle("Mot de passe oublié", fontWeight: FontWeight.bold, fontSize: 30.0, color: Color.fromRGBO(23, 83, 8, 1),),
                      SizedBox(height: 20.0,),
                      new Form(
                        key: _formKey,
                          autovalidate: _autovalidate,
                          child: new Column(
                            children: [
                              new TextFormField(
                                maxLength: 8,
                               // key: _formKey,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_number_pad_filled_100px_1.png'),
                                  ),
                                  hintText: 'Téléphone',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                                ),
                                validator: (valeur){
                                  if(valeur.isEmpty)
                                  {
                                    return 'Saisir votre numéro de téléphone';
                                  }
                                  else if(valeur.length<8)
                                    {
                                      return 'Saisir un numéo valide';
                                    }
                                  else
                                    return null;
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
                                    onPressed: _validerForm,
                                    child: Text("Réinstialiser mot de passe",
                                      textAlign: TextAlign.center,
                                      style: style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),),)
                              ),
                            ],
                          )),




                    ]),
              ),)
        )
    );

    /*return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(

        title: Text('SDAB APPLICATION'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(23, 83, 8, 1),
      ),
      body: new SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50,),
            new Image.asset('assets/iconeCardinal2.jpg', width: MediaQuery.of(context).size.height / 5,),
            SizedBox(height: 30,),
            new Text('Mot de passe oublié',
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
              style: new TextStyle(
                color: Color.fromRGBO(23, 83, 8, 1),

              ) ,),
            SizedBox(height: 30,),
            new TextField(

              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 5.0),
                  child: new Icon(Icons.ac_unit),
                ),
                border: OutlineInputBorder(

                  borderRadius: BorderRadius.circular(15.0),
                ),
                hintText: '+229 64 81 69 91',
              ),
            ),
            SizedBox(height: 30,),

            new Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(30.0),
                //color: Color(0xff01A0C7),
                color: Color.fromRGBO(23, 83, 8, 1),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed:
                    versPageMiseAJourMotDePasse,

                  child: Text("Réinitialiser le mot de passe",
                    textAlign: TextAlign.center,
                    style: style.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ),),)
            ),

          ],
        ),
      ),
    );*/
  }

  void versPageMiseAJourMotDePasse(){
   // global.telephone=phoneController.text;
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext){
      return new CodeVerification();

    }));
  }

//  void _sendSMS(String message, List<String> recipents) async {
//    String _result = await sendSMS(message: message, recipients: recipents)
//        .catchError((onError) {
//      print(onError);
//    });
//    //print(_result);
//  }
//  void _sendCode(String telephone)
//  {
//    //générer code aléatoire
//    var rng = new Random();
//    var l = new List.generate(4, (_) => rng.nextInt(10));
//    String message = l.toString();
//    List<String> recipents = ["$telephone"];
//
//    _sendSMS(message, recipents);
//  }

//  void _sendSMS(String message, List<String> recipents) async {
//    try {
//      String _result = await sendSMS(
//          message: message, recipients: recipents);
//      setState(() => _message = _result);
//    } catch (error) {
//      setState(() => _message = error.toString());
//    }
//  }

//  void _canSendSMS() async {
//    bool _result = await canSendSMS();
//    setState(() => _canSendSMSMessage =
//    _result ? 'This unit can send SMS' : 'This unit cannot send SMS');
//  }


  //Productueur, commercant, exportateur, Structeur de finance
}