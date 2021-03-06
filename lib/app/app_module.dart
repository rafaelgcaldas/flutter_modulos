import 'package:flutter_modulos/app/pages/splash/splash_controller.dart';
import 'package:flutter_modulos/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modulos/app/app_widget.dart';
import 'package:flutter_modulos/app/modules/home/home_module.dart';
import 'package:flutter_modulos/app/pages/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()), 
        Bind((i) => AppController())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
