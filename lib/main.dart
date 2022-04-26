import 'package:carousel/app_providers.dart';
import 'package:carousel/views/gallery.dart';
import 'package:carousel/views/gallery_details.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:provider/provider.dart';

import 'views/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: const [
          FormBuilderLocalizations.delegate,
        ],
        initialRoute: Login.path,
        routes: {
          Login.path: ((context) => const Login()),
          Gallery.path: ((context) => const Gallery()),
          GalleryDetails.path: ((context) => const GalleryDetails()),
        },
      ),
    );
  }
}

