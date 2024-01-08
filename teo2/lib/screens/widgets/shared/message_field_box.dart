import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  final ValueChanged <String> onvalue;
  final textController = TextEditingController();
  final focusNode = FocusNode();

  final outlineInputBorder = UnderlineInputBorder(
    borderSide:  BorderSide(
      color: Colors.transparent
    ),
    borderRadius:  BorderRadius.circular(40)
  );

  MessageFieldBox({super.key, required this.onvalue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event){
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: InputDecoration(
        hintText: "Digite tu mensaje terminado con un ?",
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
          icon: Icon(Icons.send_outlined),
        onPressed: (){
            final textvalue = textController.value.text;
            print("Send value = $textvalue");
            textController.clear();
            focusNode.requestFocus();
            onvalue(textvalue);

        })
      ),

      onFieldSubmitted: (value){
        print("Submmited $value");
        textController.clear();
        focusNode.requestFocus();
        onvalue(value);
      },
    );
  }
}

