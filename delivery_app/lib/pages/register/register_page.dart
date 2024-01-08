import 'package:delivery_app/pages/register/register_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  //Crear un objeto de tipo controller
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                  children: [
                    Row(
                      children: [
                      _botonAtras()
                      ],
                    ),
                    //_imageCover(),
                    _fotoAvatar(context),
                    _textAppName(),
                    _boxForm(context),
                  ]
              ),
            )
          ],
        ),
        bottomNavigationBar: SizedBox(
            height: 60,
      )
      ),
    );
  }


  Widget _botonAtras(){
    return  Container(
      child: ElevatedButton(
        onPressed: () {
          // Navegar hacia atrás cuando se presiona el botón
          controller.gotoLoginPage();
        },
        child: Icon(Icons.arrow_back),
      ),
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

Widget _fotoAvatar(BuildContext context){
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
        child: CircleAvatar(
          backgroundColor: Colors.red.withOpacity(0.5),
          radius: MediaQuery.of(context).size.width *0.1,
          child: Icon(Icons.person, color: Colors.white, size: 50),
        ),
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
    height: MediaQuery.of(context).size.height*0.75,
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
        _textNombre(),
        _textApellido(),
        _textTelefono(),
        _textRegister(),
        _textPassword(),
        _textConfirmPassword(),
        _buttonRegister()
      ],
    ),
  );
}


//Campo de entrada de nombre
  Widget _textNombre(){
    return TextField(
      controller: controller.nombreController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Nombre",
          prefixIcon: Icon(Icons.person)
      ),
    );
  }

  //Campo de entrada de apellido
  Widget _textApellido(){
    return TextField(
      controller: controller.apellidoController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Apellido",
          prefixIcon: Icon(Icons.person)
      ),
    );
  }

  //Campo de entrada de telefono
  Widget _textTelefono(){
    return TextField(
      controller: controller.telefonoController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          hintText: "Telefono",
          prefixIcon: Icon(Icons.phone)
      ),
    );
  }

//Campo de entrada de correo
Widget _textRegister(){
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

//Campo de entrada de confirmar contrasena
  Widget _textConfirmPassword(){
    return TextField(
      controller: controller.confirmPasswordController,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "Confirmar contrasena",
          prefixIcon: Icon(Icons.lock)
      ),
    );
  }


Widget _textYourInfo(){
  return Text("Ingresa tus datos",
      textAlign: TextAlign.center);
}

Widget _buttonRegister (){
  return Container(
    margin: EdgeInsets.only(top: 50),
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15)
        ),
        onPressed: (){
          return controller.register();
        },
        child: Text("Registrar")
    ),
  );
}
}
