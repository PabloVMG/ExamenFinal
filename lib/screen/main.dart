import 'package:flutter/material.dart';
import 'package:almacen_online/screen/listar_categoria.dart';
import 'package:almacen_online/screen/listar_proveedor.dart';
import 'package:almacen_online/screen/screen.dart';
import 'package:almacen_online/services/proveedor_service.dart'; 
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProveedorService>(
          create: (context) => ProveedorService(),
        ),
      
      ],
      child: MaterialApp(
        home: Main(),
      ),
    ),
  );
}

class Main extends StatefulWidget {
  const Main({Key? key}); 
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  String _selectedValue = '1';
  int _pageIndex = 0;
  List<Widget> _pages = [
    ListarProveedor(),
    ListarCategoria(),
    ListProductScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sesión iniciada'),
        elevation: 1,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _selectedValue = value;
                _pageIndex = int.parse(value) - 1; // 
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: '1',
                child: Text('Proveedores'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('Categorías'),
              ),
              PopupMenuItem(
                value: '3',
                child: Text('Productos'),
              ),
            ],
          )
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}