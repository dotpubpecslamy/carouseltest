import 'package:provider/provider.dart';

import 'package:carousel/providers/auth_provider.dart';
import 'package:carousel/providers/gallery_provider.dart';

class AppProviders {
  static List<ChangeNotifierProvider> providers = [
    ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
    ChangeNotifierProvider<GalleryProvider>(create: (_) => GalleryProvider()),
  ];
}
