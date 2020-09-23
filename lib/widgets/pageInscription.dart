import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*import 'package:sdab/data/Users.dart';
import 'package:sdab/widgets/pageConnexion.dart';
import 'package:sdab/widgets/textAvecStyle.dart';*/
import 'package:sdab_application/data/Users.dart';
import 'package:sdab_application/models/statut.dart';
import 'package:sdab_application/widgets/pageConnexion.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';
import 'package:sdab_application/data/dataManager.dart' as global;

class PageInscription extends StatefulWidget {
  PageInscription({Key key, this.title}) : super(key: key);



  final String title;


  @override
  _PageInscription createState() => _PageInscription();
}

class _PageInscription extends State<PageInscription> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  Key formKeyInscription ;
  //CODE AJOUTE
  final GlobalKey<FormState> _formKey = new  GlobalKey<FormState>();
  bool _autovalidate = false;
  final nomController = TextEditingController();
  final prenomController = TextEditingController();
  final pswController = TextEditingController();
  final pswConfirmController = TextEditingController();
  final telephoneController = TextEditingController();
   Utilisateur utilisateurCourant;
   Statut selectedUser;

  List<Statut> users = <Statut>[
    const Statut('Producteur',Icon(Icons.android,color: Color.fromRGBO(23, 83, 8, 1),)),
    const Statut('Transformateur',Icon(Icons.flag,color: Color.fromRGBO(23, 83, 8, 1),)),
    const Statut('Transporteur',Icon(Icons.format_indent_decrease,color: Color.fromRGBO(23, 83, 8, 1),)),
    const Statut('Commerçant',Icon(Icons.mobile_screen_share,color: Color.fromRGBO(23, 83, 8, 1),)),
    const Statut('Fournisseur d\'intrants', Icon(Icons.compass_calibration,color: Color.fromRGBO(23, 83, 8, 1),)),
  ];



  @override
  Widget build(BuildContext context) {
    void _validerInscription()
    {
      if(this._formKey.currentState.validate())
        {
          //ENREGISTREMENT DES DONNEES DANS LA BASE
          utilisateurCourant=new Utilisateur(0, nomController.text, prenomController.text
              , telephoneController.text, "", "", "", pswConfirmController.text, 0, 0);
          global.mUtilisateurs.add(utilisateurCourant);
          Navigator.push(
              context, new MaterialPageRoute(builder: (BuildContext context) {
            return new PageConnexion();
          }));
        }
      else
        {
          setState(() {
            this._autovalidate = true;
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
                      SizedBox(height: 120.0,),
                      new TextAvecStyle("Inscription", fontWeight: FontWeight.bold, fontSize: 30.0, color: Color.fromRGBO(23, 83, 8, 1),),
                      SizedBox(height: 20.0,),
                      new Form(
                          key: _formKey,
                          autovalidate: _autovalidate,
                          child: new Column(
                            children: <Widget>[
                              new TextFormField(
                                controller: nomController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_user_filled_100px.png'),
                                  ),
                                  hintText: 'Nom',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                                ),
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    return 'Entrez votre nom';
                                  }else
                                    return null;
                                },
                              ),
                              SizedBox(height: 10.0,),
                              new TextFormField(
                                controller: prenomController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_user_filled_100px.png'),
                                  ),
                                  hintText: 'Prénoms',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                                ),
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    return 'Entrez votre prénom';
                                  }else
                                    return null;
                                },
                              ),
                              SizedBox(height: 10.0,),
                              new TextFormField(
                                //controller: prenomController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_home_100px.png', color: Color.fromRGBO(23, 83, 8, 1),),
                                  ),
                                  hintText: 'Adresse',
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                                ),
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    return 'Entrer votre adresse';
                                  }else
                                    return null;
                                },
                              ),
                              SizedBox(height: 10.0,),
                              new TextFormField(
                                controller:telephoneController ,
                                maxLength: 8,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_number_pad_filled_100px_1.png'),
                                  ),
                                  hintText: "Téléphone",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    print('Entrez votre numéro de téléphone');
                                  }
                                  else if(valeur.length<8)
                                  {
                                    return 'Saisir un numéo valide';
                                  }
                                  else
                                    return null;
                                },
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(height: 10.0,),
                              new TextFormField(
                                controller: pswController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.next,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
                                  ),
                                  hintText: "Mot de passe",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    print('Entrez un mot de passe');
                                  }else
                                    return null;
                                },
                              ),
                              SizedBox(height: 10.0,),
                              new TextFormField(

                                controller: pswConfirmController,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                obscureText: true,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0,20.0, 15.0),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 5.0),
                                    child: new Image.asset('assets/Icones/icons8_sign_in_form_password_filled_100px.png'),
                                  ),
                                  hintText: "Confirmez mot de passe",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0)),
                                ),
                                // ignore: missing_return
                                validator: (valeur){
                                  if(valeur.isEmpty){
                                    print('Confirmez votre mot de passe');
                                  }else
                                    if(pswController.text!=valeur)
                                      {
                                        print('Saisir le même mot de passe');
                                        pswController.text="";
                                        pswConfirmController.text="";
                                      }
                                    else
                                      {
                                        return null;
                                      }

                                },
                              ),
                              SizedBox(height: 15.0,),
                              new Container(
                                child: DropdownButton<Statut>(
                                  hint:  TextAvecStyle("Sélectionnez votre statut", color: Color.fromRGBO(23, 83, 8, 1), fontSize: 20.0,),
                                  value: selectedUser,
                                  onChanged: (Statut Value) {
                                    setState(() {
                                      selectedUser = Value;
                                    });
                                  },
                                  items: users.map((Statut user) {
                                    return  DropdownMenuItem<Statut>(
                                      value: user,
                                      child: Row(
                                        children: <Widget>[
                                          user.icon,
                                          SizedBox(width: 10,),
                                          Text(
                                            user.name,
                                            style:  TextStyle(color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: 15.0,),
                              new Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(30.0),
                                  //color: Color(0xff01A0C7),
                                  color: Color.fromRGBO(23, 83, 8, 1),
                                  child: MaterialButton(
                                    minWidth: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                    onPressed: _validerInscription,

                                    child: Text("S'inscrire",
                                      textAlign: TextAlign.center,
                                      style: style.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,

                                      ),),)
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children:<Widget>[
                                  new TextAvecStyle('Déjà inscrit ?', color: Colors.black,),
                                  new FlatButton(onPressed: versPageConnexion,
                                      child: new Text('Se connecter',
                                        textScaleFactor: 1.0,
                                        style: new TextStyle(color:
                                        Color.fromRGBO(23, 83, 8, 1)),))
                                ],
                              )
                            ],
                          )),




                    ],),
              ),)
        )
    );
  }

  TextFormField monTextFied(String labelText, IconData icone) {
    return new TextFormField(

      //obscureText: true,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsetsDirectional.only(start: 5.0),
          child: new Icon(icone),
        ),
        border: OutlineInputBorder(

          borderRadius: BorderRadius.circular(15.0),
        ),
        hintText: labelText,
      ),

    );
  }

  void versPageConnexion() {
    // ignore: non_constant_identifier_names
    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext) {
      return new PageConnexion();
    }));
  }
}