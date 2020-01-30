import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modulos/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(
        builder: (_) {
        if(homeController.pokemons.error != null) {
          return Center(
            child: Center(child: RaisedButton(
              child: Text("Pressione novamente"),
              onPressed: () {
                homeController.fetchPokemons();
              },
            ),),
          );
        }

        if(homeController.pokemons.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var list = homeController.pokemons.value;

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list[index].name),
            );
          },
        );

      },),
    );
  }
}
