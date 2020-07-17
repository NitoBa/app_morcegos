import 'package:flutter/material.dart';

class Lists extends StatelessWidget {

  final String title;
  final List lists;

  Lists({this.lists, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title),),
      body: ListView.builder(
        itemCount: lists.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 10,
                        spreadRadius: 4)
                  ]
                ),
                height: 250,
                child: Column(
                  children: <Widget>[
                    Container(
                          height: 200, width: MediaQuery.of(context).size.width,

                          child: ClipRRect(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                            child: Image.asset("images/animals_hero_bats.jpg", fit: BoxFit.cover,)
                          ),
                        ),
                    SizedBox(height: 15,),
                    Text(lists[index], style: TextStyle(fontSize: 25),)
                  ],
                ),
              )
            ],
          );
        }
      )
      );
  }
}