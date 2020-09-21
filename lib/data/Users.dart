class Utilisateur {
  int _id;
  String _nom;
  String _prenom;
  String _contact;
  String _residence;
  String _statut;
  String _abonnement;
  String _motDePasse;
  int _idFicheTechnique;
  int _idTechnique;



  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get  motDePasse => _motDePasse;

  set motDePasse(String value) {
    _motDePasse = value;
  }

  String get abonnement => _abonnement;

  set abonnement(String value) {
    _abonnement = value;
  }

  String get statut => _statut;

  set statut(String value) {
    _statut = value;
  }

  String get residence => _residence;

  set residence(String value) {
    _residence = value;
  }

  String get contact => _contact;

  set contact(String value) {
    _contact = value;
  }

  String get prenom => _prenom;

  set prenom(String value) {
    _prenom = value;
  }

  String get nom => _nom;

  set nom(String value) {
    _nom = value;
  }



  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "_id": _id,
      "nom": _nom,
      "prenom": _prenom,
      "contact": _contact,
      "abonnement": _abonnement,
      "residence": _residence,
      "satut": _statut

    };

    return map;
  }

  Utilisateur.fromMap(Map<String, dynamic> map) {
    _id = map["_id"];
    _nom= map["_nom"];
    _prenom = map["prenom"];
    _contact = map["contact"];
    _abonnement = map["abonnement"];
    _residence = map["residence"];
    _statut = map["satut"];
  }

  Utilisateur(this._id, this._nom, this._prenom, this._contact, this._residence,
      this._statut, this._abonnement, this._motDePasse, this._idFicheTechnique,
      this._idTechnique);

  int get idFicheTechnique => _idFicheTechnique;

  int get idTechnique => _idTechnique;

  set idTechnique(int value) {
    _idTechnique = value;
  }

  set idFicheTechnique(int value) {
    _idFicheTechnique = value;
  }


}
