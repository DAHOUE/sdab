library datamanager.global;
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


import 'Champ.dart';
import 'Users.dart';



//class DataManager
//{
   List<Utilisateur> mUtilisateurs=new List<Utilisateur>();
   List<Champ> mChamps = new List<Champ>();
   List<Marker> mMarkers = new List<Marker>();
   String code="";
   //CHAMPS
   String ville;
   String quartier;
   double superficie;
   //FICHE TECHNIQUE
   bool ethrellage;
   int nombrePlants;
   String modePlantation;
   String typePlantation;
   //String densite;
   DateTime date;

   //à générer
int Nombre_de_plants=0;
int Nombre_de_Sarclage=0;
double QuantiteNPK_a_acheter=0.0;
double QuantitUree=0.0;
double Quantite_K2SO4=0.0;
double Quantite_carbure_calcium =0.0;
int NombreApplication_NPK=0;
int Nombre_application_uree=0;
int Nombre_application_K2SO4=0;
double Quantite_eau_TIF=0.0;
double Quantite_eau_ethephon=0.0;
double Quantite_ethephon_champ=0.0;
int nombre_sarclage=0;
String periode_recolte="tt";
String periode_tif='ttt';






  //DataManager.instance();


//}