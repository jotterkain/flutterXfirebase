import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../utils/routes/routes.dart' as routes_const;


void main(){
  runApp(const FlutterXFirebase());
}

class FlutterXFirebase extends StatelessWidget {
  const FlutterXFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "FlutterXFirebase",
      routerConfig: GoRouter(
        routes: routes_const.routes
      ),
    );
  }
}
