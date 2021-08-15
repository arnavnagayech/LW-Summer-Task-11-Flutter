import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Task By Team_11_17';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Run A Jenkins Job'),
          ),
          body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                  "https://www.lacework.com/wp-content/uploads/2020/08/up-and-running-with-lacework-and-jenkins.png"),
              fit: BoxFit.cover,
            )),
            child: MyForm(),
          )),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  MyFormState createState() {
    return MyFormState();
  }
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
// Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              icon: const Icon(Icons.person),
              hintText: 'Enter your name here',
              labelText: 'Name ',
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.phone),
              hintText: '10-Digit',
              labelText: 'Phone Number',
            ),
          ),
          new Container(
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),
              // ignore: deprecated_member_use
              child: new RaisedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    _redirect(context);
                  })),
        ],
      ),
    );
  }
}

_redirect(BuildContext context) async {
  const url = 'http://192.168.99.101:8080/job/flutter%20task/build?token=987654';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}