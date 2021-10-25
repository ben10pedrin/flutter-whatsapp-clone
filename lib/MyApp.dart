import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/LoginView.dart';
import 'MyModel.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        create: (_) => MyModel(),
        child: MaterialApp(title: 'Whatsapp', home: LoginView()));
  }
}
