import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool inProgress = false;

  void login(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailEditingController.text,
        password: passwordEditingController.text,
    ).then((value){

      Navigator.push(context, MaterialPageRoute(
          builder: (context)=>const LoginScreen()
      ));

      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
              content: Text("Successfully Registration"),
            duration: Duration(seconds: 1),
          ));

    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
              content: Text("Registration Failed"),
            duration: Duration(seconds: 1),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Registration"),
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
                  Text("Join us to Sing up to Continue",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontSize: 20,
                          color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      )),
                  const SizedBox(height: 20,),

                 TextFormField(
                   validator: (value){
                     if(value == null || value.isEmpty){
                       return "Enter your email address";
                     }
                     return null;
                   },
                   controller: emailEditingController,
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
                    controller: passwordEditingController,
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
                          setState(() {});
                        }
                      }, child: const Text(
                        "Continue"
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