import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterController extends  GetxController{
  TextEditingController nombreController = TextEditingController();
  TextEditingController apellidoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //Metodo para movernos a la pagina de registro
  void gotoLoginPage(){
    Get.back();
  }

  void register() {
    String nombre = nombreController.text.trim();
    String apellido = apellidoController.text.trim();
    String telefono = telefonoController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    if (validForm(nombre, apellido, telefono, email, password, confirmPassword)) {
      Get.snackbar("Formulario valido", "Formulario listo para enviar");
    }
  }

  bool validForm(String nombre, String apellido, String telefono, email, String password, String confirmPassword){

    if(nombre.isEmpty){
      Get.snackbar("Formulario invalido", "Debes ingresar un nombre");
      return false;
    }

    if(apellido.isEmpty){
      Get.snackbar("Formulario invalido", "Debes ingresar un apellido");
      return false;
    }

    if(telefono.isEmpty){
      Get.snackbar("Formulario invalido", "Debes ingresar un telefono");
      return false;
    }

    if(telefono.length ==10 && telefono.isNumericOnly){
      Get.snackbar("Formulario invalido", "Debes ingresar un telefono valido");
      return false;
    }


    if(!GetUtils.isEmail(email)){
      Get.snackbar("Formulario invalido", "Debes ingresar un email valido");
      return false;
    }

    if(email.isEmpty){
      Get.snackbar("Formulario invalido", "Debes ingresar un email");
      return false;

    }

    if(password.isEmpty){
      Get.snackbar("Formulario invalido", "Debes ingresar una contrasena");
      return false;
    }

    if(confirmPassword.isEmpty){
      Get.snackbar("Formulario invalido", "Debes confirmar la contrasena");
      return false;
    }

    if(password != confirmPassword){
      Get.snackbar("Formulario invalido","Los campos de contrasena y confirmacion de contrasena no coinciden");
      return false;
    }
    return true;
  }
}

