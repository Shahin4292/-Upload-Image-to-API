import 'package:http/http.dart' as http;

class UploadApiImage {
  Future<dynamic> uploadImage() async {
    final Uri url = Uri.parse("");
    var request = http.MultipartRequest("POST", url);
  }
}
