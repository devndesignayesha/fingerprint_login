import 'package:fingerprint_login/pagetwo.dart';
import 'package:fingerprint_login/utils/authetntication.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          elevation: 0.0,
        ),
      ),
      home: const AuthenticationPage(),
      debugShowCheckedModeBanner: false,
      title: 'Finger Print Scanner',
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade400,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Login via Fingerprint", style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),),
              SizedBox(
                height:30,
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  bool auth = await Authentication.authentication();
                  print("Can Authenticate $auth");
                  if (auth){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
                  }
                },
                icon: Icon(Icons.fingerprint),
                label: Text("Authenticate",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

