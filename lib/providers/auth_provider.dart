import 'package:flutter/widgets.dart';

import 'package:carousel/views/gallery.dart';
import 'package:carousel/services/dialog_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:carousel/services/auth_service.dart';
import '../model/model.dart';

class AuthProvider extends ChangeNotifier {
  User? _user;
  bool? _isLoading;
  
  get user => _user;
  bool? get isLoading => _isLoading;

  tryFetchUser(BuildContext context, GlobalKey<FormBuilderState> formKey, String username, String password) async {
    if(formKey.currentState!.saveAndValidate()){
      _isLoading = true;
      notifyListeners();

      try{
        _user = await AuthService().login(username, password);
        formKey.currentState!.reset();
        _isLoading = false;
        notifyListeners();

        Navigator.pushNamed(context, Gallery.path);
      } catch(exc){
        debugPrint(exc.toString());
        _isLoading = false;
        notifyListeners();
      }
    }else {
      DialogService.showErrorDialog(context, 'Login Error', 'Please fill out required fields');
    }
  }

}