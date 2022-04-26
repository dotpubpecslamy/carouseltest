import 'package:carousel/model/model.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  Future login(String username, String password){

    return Future.delayed(const Duration(seconds: 1), (){
      return User(firstName: 'Builta', lastName: 'Mart');
    });
  }


}