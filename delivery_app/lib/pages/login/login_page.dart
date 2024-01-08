import 'package:delivery_app/pages/login/login_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //Crear un objeto de tipo controller
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            _boxCover(context),
            SingleChildScrollView(
              child: Column(
                  children: [
                    //_imageCover(),
                    _imageAnimation(),
                    _textAppName(),
                    _boxForm(context),
                  ]
              ),
            )
          ],
        ),
      bottomNavigationBar: SizedBox(
        height: 60,
          child: _textDontHaveAnAccount()),
    );
  }

  //metodo para cargar la imagen
  Widget _imageCover(){
    return  SafeArea(
      child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 30, bottom: 20),
          child: Image.asset('assets/images/intec_logo.png', height: 140)
      ),
    );
  }

  Widget _imageAnimation(){
    return SafeArea(
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 30, bottom: 15),
          child: Lottie.asset('assets/json/Animation - 1702301450044.json', height: 140)

      ),
    );
  }

  Widget _textAppName(){
    return Text("Delivery App",
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 28,
          color: Colors.black,
          fontWeight: FontWeight.bold
      ),
    );
  }

  //Metodo con un cover de background
  Widget _boxCover(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.35,
      color: Colors.redAccent.withOpacity(0.40),
    );
  }

  //Formulario de login
    Widget _boxForm(BuildContext context){
    return Container(
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height*0.03,
        left: 50,
        right: 50,
      ),
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
      height: MediaQuery.of(context).size.height*0.45,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 15,
            offset: Offset(
              0, 0.75
            ),
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _textYourInfo(),
          SizedBox(
            height: 30.0,
          ),
          _textLogin(),
          _textPassword(),
          _buttonLogin()
        ],
      ),
    );
    }

    //Campo de entrada de correo
      Widget _textLogin(){
    return TextField(
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Correo electronico",
        prefixIcon: Icon(Icons.email)
      ),
    );
      }

  //Campo de entrada de contrasena
  Widget _textPassword(){
    return TextField(
      controller: controller.passwordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Contrasena",
          prefixIcon: Icon(Icons.lock)
      ),
    );
  }

  Widget _textYourInfo(){
    return Text("Ingresa tus datos",
    textAlign: TextAlign.center);
  }

  Widget _buttonLogin (){
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15)
        ),
          onPressed: (){
          return controller.login();
          },
          child: Text("Login")
      ),
    );
  }

  Widget _textDontHaveAnAccount(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("No tienes cuenta?"),
        SizedBox(width: 10),
        GestureDetector(
          child: Text("Registrate",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 17
          )
          ),
        onTap: (){
        return controller.gotoRegisterPage();
        },
        )
      ],
    );
  }
}