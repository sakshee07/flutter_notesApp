import 'package:flutter/material.dart';
import 'package:fp1/controller/auth_methods.dart';
import 'package:fp1/screen/login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose(){
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void registerUsingEmailPassword() async{
    setState(() {
      isLoading = true;
    });

    String? result = await Auth_method.registerUsingEmailPassword(
      name: nameController.text, 
      email: emailController.text,
       password: passwordController.text);
  

  setState(() {
      isLoading = false;
    });

    if (result != "success") {
          final snackBar = SnackBar(
        content: const Text(
          "Account is not created",
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);


    } else {
      final snackBar = SnackBar(
        content: const Text(
          "Done.. Account is created",
          style: TextStyle(fontSize: 10, color: Colors.black),
        ),
        backgroundColor: Colors.grey[400],
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);


      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    }
  }

  @override

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Signup screen'),
        centerTitle: true,
       ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children:   [
           TextField(
            controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Enter name',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             TextField(
               controller: emailController,
              decoration: const InputDecoration(
               
                labelText: 'Enter email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
             TextField( 
              controller: passwordController,
              obscureText: true ,
              decoration: const InputDecoration(
                labelText: 'Enter password',
              ),),
           const SizedBox(
              height: 10,
            ),
            InkWell(
                  onTap: registerUsingEmailPassword,
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: Colors.black,
                    ),
                    child: isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                           ),
                          )
                        : const Text('Sign up'),
                  ),
                ),
              ],
            ),
            ),),
     );
  }
}