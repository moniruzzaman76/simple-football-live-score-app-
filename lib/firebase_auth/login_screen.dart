import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;

  void login(){
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailEditingController.text,
      password: _passwordEditingController.text,
    ).then((value){

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Successfully login"),
          ));

    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text("Login Failed"),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 150,),
                  Text("Welcome Back",style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 25,)
                  ),
                  const SizedBox(height: 10,),
                  Text("Join us to Login Screen",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: Colors.grey
                      )),
                  const SizedBox(height: 20,),

                  TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter your email address";
                      }
                      return null;
                    },
                    controller: _emailEditingController,
                    decoration: const InputDecoration(
                      hintText: "Enter your email address",
                      border: OutlineInputBorder(),
                    ),
                  ),

                  TextFormField(
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return "Enter your email address";
                      }
                      return null;
                    },
                    controller: _passwordEditingController,
                    decoration: const InputDecoration(
                      hintText: "Enter your password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: 45,
                    width: double.infinity,
                    child: Visibility(
                      visible: !inProgress,
                      replacement: const Center(child: CircularProgressIndicator(),),
                      child: ElevatedButton(
                          onPressed: ()async{
                            if(_formKey.currentState!.validate()){
                              login();
                            }
                          }, child: const Text(
                          "login"
                      )),
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}