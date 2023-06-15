import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:name_similarity/home/searching_page.dart';
import 'package:name_similarity/repository/get_info.dart';

class HomePage extends StatefulWidget {
  final String name;
  const HomePage({super.key, this.name = 'Bek'});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GetInfoRepo api = GetInfoRepo();

  bool isLoading = true;
  dynamic data;

  Future<void> getInfo() async {
    isLoading = true;
    setState(() {});
    data = await api.getInfo(name: widget.name);

    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    getInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: ((context) => SearchPage())));
          }),
          child: Icon(Icons.search),
        ),
        drawer: Drawer(),
        appBar: AppBar(
          title: Text('Similarity of name ${widget.name}'),
        ),
        body: isLoading
            ? Center(
                child: LoadingAnimationWidget.bouncingBall(
                    color: Colors.red, size: 60))
            : Center(
                child: Container(
                  height: 300,
                  width: 300,
                  margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${data.count}',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        '${data.gender}',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ));
  }
}