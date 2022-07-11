import 'package:flutter/material.dart';
import 'package:productos_app/providers/providers.dart';
import 'package:productos_app/services/notifications_service.dart';
import 'package:productos_app/services/user_services.dart';
import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
   
  const LoginScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 200,),

              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Text('Login', style: Theme.of(context).textTheme.headline4),
                    const SizedBox(height: 30,),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormPovider(),
                      child: const _LoginForm()
                    )
                  ]
                ),
              ),

              const SizedBox(height: 50,),
              const Text('Recuperación de contraseña', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              const SizedBox(height: 50,),
            ],
          ),
        )
      )
    );
  }
}

class _LoginForm extends StatelessWidget {
  
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormPovider>(context);
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Form(

        key: loginForm.formKey,
        //validaciones
        autovalidateMode: AutovalidateMode.onUserInteraction,

        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'Example@gmail.com',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.account_circle_rounded
              ),
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp  = RegExp(pattern);
                return regExp.hasMatch(value??'')
                  ? null
                  : 'El valor ingresado no es un correo';
              }
            ),

            const SizedBox(height: 30,),

            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '**********',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock,

              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return value != null && value.length >= 6 
                    ? null
                    : 'La contrasena dede de ser de 6 caracteres';
              }
            ),

            const SizedBox(height: 30,),

            MaterialButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              color: Colors.blue[800],
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    child: Text(
                      loginForm.isLoading ? 'Espere...' : 'Ingresar',
                      style: const TextStyle(color: Colors.white),
                    ),
              ),
              onPressed: loginForm.isLoading ? null : () async{
                FocusScope.of(context).unfocus();

                final userService = Provider.of<UserService>(context, listen: false);

                if(!loginForm.isValidForm()) return;

                          loginForm.isLoading = true;

                final  errorMessage = await userService.login(loginForm.email, loginForm.password);
                if(errorMessage==null){
                  Navigator.pushReplacementNamed(context, 'home');
                } else {
                            NotificationsService.showSnackbar(errorMessage);
                  loginForm.isLoading = false;
                }
              }
            )

          ],
        )
      ),
    );
  }
}