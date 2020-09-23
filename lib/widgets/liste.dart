import 'package:flutter/material.dart';
import 'package:sdab_application/widgets/page_details.dart';
import 'package:sdab_application/widgets/textAvecStyle.dart';
import 'package:webfeed/webfeed.dart';

import 'date_convertisseur.dart';
class Liste extends StatefulWidget{

  RssFeed rssFeed;
  Liste(RssFeed rssFeed){
    this.rssFeed = rssFeed;
  }
  @override
  _Liste createState() => _Liste();

}

class _Liste extends State<Liste>{
  @override
  Widget build(BuildContext context) {

    return new ListView.builder(

        itemCount: widget.rssFeed.items.length,
        itemBuilder: (context, i){
          RssItem item = widget.rssFeed.items[i];
          return new Container(
            padding: EdgeInsets.all(10.0),

            child: new Card(
                elevation: 10.0,
                child: new InkWell(
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(builder: (BuildContext context){
                      return new PageDetail(item);
                    }));
                  },
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: <Widget>[

                            new TextAvecStyle('Actualité ${i+1} '),
                            new TextAvecStyle(new DateConvertisseur().convertirDate(item.pubDate.toString()), color: Colors.red,),
                          ],
                        ),
                      ),
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            new Card(
                              child: new Container(
                                height: MediaQuery.of(context).size.width / 2.5,
                                width: MediaQuery.of(context).size.width / 2.5,
                                child: new Image.network(item.enclosure.url, fit: BoxFit.fill),
                              ),
                            ),
                            new Container(
                              width: MediaQuery.of(context).size.width / 2.5,

                              child: new TextAvecStyle((item.title) != null ? item.title : 'Texte Indisppnible'),
                            )

                          ]

                      ),
                    ],
                  ),
                )
            ),
          );
        });
  }


}