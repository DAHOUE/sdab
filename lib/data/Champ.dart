class Champ {
  int _id;
  double _longitude;
  double _latitude;
  String _superficie;
  int _idUtilisateur;
  String _quartier;
  String _ville;

  Champ(this._id, this._longitude, this._latitude, this._superficie,
      this._idUtilisateur, this._quartier, this._ville);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "_id": _id,
      "longitude": _longitude,
      "latitude": _latitude,
      "superficie": _superficie,
      "idUtilisateur": _idUtilisateur,
      "quartier": _quartier,
      "ville": _ville

    };

    return map;
  }

  Champ.fromMap(Map<String, dynamic> map) {
    _id = map["_id"];
    _longitude= map["longitude"];
    _latitude= map["latitude"];
    _superficie = map["superficie"];
    _idUtilisateur = map["idUtilisateur"];
    _quartier = map["quartier"];
    _ville = map["_ville"];
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get ville => _ville;

  set ville(String value) {
    _ville = value;
  }

  String get quartier => _quartier;

  set quartier(String value) {
    _quartier = value;
  }

  int get idUtilisateur => _idUtilisateur;

  set idUtilisateur(int value) {
    _idUtilisateur = value;
  }

  String get superficie => _superficie;

  set superficie(String value) {
    _superficie = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }


}
