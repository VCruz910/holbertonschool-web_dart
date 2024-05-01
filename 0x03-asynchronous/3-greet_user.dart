import 'dart:convert';
import '3-util.dart';

Future<String> greetUser() async {
  try {
    String userData = await fetchUserData();
    Map<String, dynamic> userDataMap = json.decode(userData);
    return "Hello ${userDataMap['username']}";
  } catch (error) {
    return "error caught: $error";
  }
}

Future<String> loginUser() async {
  try {
    bool hasUser = await checkCredentials();
    if (hasUser) {
      print("There is a user: true");
      return await greetUser();
    } else {
      print("There is a user: false");
      return "Wrong credentials";
    }
  } catch (error) {
    return "error caught: $error";
  }
}