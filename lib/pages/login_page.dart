import 'package:chat_app/auth/auth_service.dart';
import 'package:chat_app/components/my_button.dart';
import 'package:chat_app/components/my_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{

  //email and pw controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

//on tap func
      final void Function()? onTap;

   LoginPage({super.key,required this.onTap});

   //login method
  void login(BuildContext context) async{
    //get auth service
    final authService = AuthService();

    //try login
    try{
      await authService.signInWIthEmailPassword(_emailController.text, _pwController.text,);
    }
    //catch error
    catch(e){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text(e.toString()),
      ));
    }

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.message,
            size: 60,
            color: Theme.of(context).colorScheme.primary,
            ),

            //Welcome back Message
            Text("welcome Back, you've been Missed",
            style:TextStyle(
              color:Theme.of(context).colorScheme.primary,
              fontSize: 16,
            )),


            const SizedBox(height:10),
            //email textfield
              MyTextField(
                obsccureText: false, hintText: 'Email', controller: _emailController ,
            ),
            //password
            const SizedBox(height:10),
          //email textfield
                MyTextField(
                obsccureText: true, hintText: 'password', controller: _pwController,
        ),
        // login button
            MyButton(
              text: "Login",
              onTap: ()=>login(context),
            ),
            const SizedBox(height:10),
            //regester
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not a member??",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text("Register Now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),



          ],
    ),
        ),
      );


  }
}