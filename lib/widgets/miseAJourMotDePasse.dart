import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter_sms/flutter_sms.dart';
/*import 'package:sdab/widgets/codeVerification.dart';
import 'package:sdab/widgets/textAvecStyle.dart';*/
import 'package:sdab_application/widgets/textAvecStyle.dart';

import 'codeVerification.dart';

class MiseAJourMotDePasse extends StatefulWidget{
  @override
  _MiseAJourMotDePasse createState() => _MiseAJourMotDePasse();

}

class _MiseAJourMotDePasse extends State<MiseAJourMotDePasse>{
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  @override
  Widget build(BuildContext context) {
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
                      new TextAvecStyle("Saisir un nouveau mot de passe", fontWeight: FontWeight.bold, fontSize: 15.0, color: Color.fromRGBO(23, 83, 8, 1),),
                      SizedBox(height: 10.0,),
                      new Form(
                          child: new Column(
                            children: [
                              new TextFormField(
                                // key: _formKey,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
                                  ),
                                  hintText: 'Mot de passe',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                                ),
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    return 'Please enter your phone number';
                                  }else
                                    return null;
                                },
                              ),
                              SizedBox(height: 20.0,),
                              new TextAvecStyle("Résaisir le nouveau mot de passe", fontWeight: FontWeight.bold, fontSize: 15.0, color: Color.fromRGBO(23, 83, 8, 1),),
                              SizedBox(height: 10.0,),
                              new TextFormField(
                                // key: _formKey,
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
                                  ),
                                  hintText: 'confirm mot de passe',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                                ),
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    return 'Please enter your phone number';
                                  }else
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
                                    //onPressed: versPageDeCodeVerification,
                                    child: Text("Mettre à jour",
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
  }

  void versPageDeCodeVerification(){
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext){
      return new CodeVerification();
    }));
  }

}

class _sendSMS {
}