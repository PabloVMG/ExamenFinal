import 'package:almacen_online/screen/edit_category_screen.dart';
import 'package:almacen_online/screen/edit_proveedor.dart';
import 'package:almacen_online/screen/main.dart';
import 'package:flutter/material.dart';
import 'package:almacen_online/screen/screen.dart';


class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const ListProductScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
    'edit_categoria': (BuildContext context) => const EditCategoryScreen(),
    'edit_proveedor': (BuildContext context) => const EditProveedorScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    'main' : (BuildContext context) =>  const Main(),

    
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
