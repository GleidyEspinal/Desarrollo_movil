import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {
  const UploadBannerScreen({super.key});

  static const String screenRoute = "UploadBannerScreen";

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  dynamic _image;

  String? _filename;
//? puede ser nula
  pickIMage() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.image
    );
    if(result != null){
      setState(() {
        _image = result.files.first.bytes;
        _filename = result.files.first.name;
      });
    }
  }

  _uploadToFirebaseStorage(dynamic image) async{
    var ref = _firebaseStorage.ref().child("banner").child(_filename!);

    UploadTask uploadTask = ref.putData(image);

    TaskSnapshot taskSnapshot = await uploadTask;

    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }

  _uploadToFirestore() async {
    EasyLoading.show();
    if(_image!=null){
      var imageURL = await _uploadToFirebaseStorage(_image);
      await _firebaseFirestore.collection("banner").doc(_filename).set({
      "image": imageURL
      }
      ).whenComplete(() {
        EasyLoading.dismiss();
        setState(() {
          _image = null;
        });
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Upload Banner',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
            ),

            Divider(
              color: Colors.grey,
            ),

            Row(
              children: [
                Container(
                  width: 140.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade500,
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child: _image != null ? Image.memory(_image, fit: BoxFit.cover,): Center(child: Text("Upload Banner"))
                ),
                SizedBox(
                  width: 30,
                ),

                ElevatedButton(
                    onPressed: (){
                      _uploadToFirestore();
                    },
                    child: Text("Save Banner"))
              ],
            ),
            SizedBox(
              height: 30,
            ),

            ElevatedButton(
                onPressed: (){
                  pickIMage();
                },
                child: Text("Select Browse"))

          ],
        ),
      ),
    );
  }
}
