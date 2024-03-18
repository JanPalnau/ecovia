import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
//import 'package:shared_preferences/shared_preferences.dart';

//Reference get firebaseStorage => FirebaseStorage.instance.ref();
class FirebaseStorageService {
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> downloadURL(String imageName) async {
    String downloadURL =
        await storage.ref('recipe_images/$imageName').getDownloadURL();
    //(await SharedPreferences.getInstance()).setString(imageName, downloadURL);
    return downloadURL;
  }
}
