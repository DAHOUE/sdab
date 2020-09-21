import 'package:flutter/material.dart';
//import 'package:sdab/widgets/textAvecStyle.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';
import 'package:webfeed/webfeed.dart';
//import 'package:sdab/widgets/date_convertisseur.dart';

import 'date_convertisseur.dart';




class PageDetail extends StatelessWidget {
  RssItem rssItem;

  PageDetail(RssItem rssItem){
    this.rssItem  = rssItem;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title:  new TextAvecStyle('Détails de l\'aticle', color: Colors.white, fontSize: 25.0,),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new TextAvecStyle(rssItem.title, fontSize: 30.0,),
            new Card(
              elevation: 10.0,
              child: new Container(
                width: MediaQuery.of(context).size.width / 1.2,
                child: new Image.network(rssItem.enclosure.url, fit: BoxFit.fill,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new TextAvecStyle(new DateConvertisseur().convertirDate(rssItem.pubDate.toString()), color: Colors.red,),
                ],
              ),
            ),
            new TextAvecStyle(rssItem.description)
          ],
        ),
      ),
    );
  }

}