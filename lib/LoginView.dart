import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/HomeView.dart';
import 'package:whatsapp/MyModel.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = new TextEditingController();

  void handleSubmit() {
    context.read<MyModel>().setUsername(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: Text("Welcome to WhatsApp"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Choose a username and remeber it, it'll be your way to login into the app uwu"),
              TextField(
                controller: controller,
                decoration: InputDecoration(hintText: "Username..."),
              )
            ],
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  handleSubmit();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  );
                },
                child: const Text('OK')),
          ],
        ),
      ),
    );
  }
}
