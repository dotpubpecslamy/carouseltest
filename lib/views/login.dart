import 'package:carousel/providers/auth_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const path = 'Login';
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormBuilderState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FormBuilder(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('LOGIN', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500)),
              const SizedBox(height: 40),
              FormBuilderTextField(
                key: const Key('username'),
                name: 'username',
                decoration: const InputDecoration(
                  hintText: 'Username',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                key: const Key('password'),
                name: 'password',
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Consumer<AuthProvider>(
                  builder: (consumerContext, auth, _) {
                    if(auth.isLoading ?? false){
                      return const ElevatedButton(
                        onPressed: null, 
                        child: CircularProgressIndicator()
                      );
                    }

                    return ElevatedButton(
                      key: const Key('LoginButton'),
                      onPressed: () => context.read<AuthProvider>().tryFetchUser(context, _formKey, 'username', 'password'), 
                      child: const Text('Login', style: TextStyle(fontSize: 21))
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}