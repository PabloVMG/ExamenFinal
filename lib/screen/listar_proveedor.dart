import 'package:flutter/material.dart';
import 'package:almacen_online/models/proveedores.dart';
import 'package:almacen_online/services/proveedor_service.dart';
import 'package:almacen_online/widgets/proveedor_card.dart';
import 'package:provider/provider.dart';
import 'package:almacen_online/screen/screen.dart';
import 'package:almacen_online/screen/edit_proveedor.dart';

class ListarProveedor extends StatelessWidget {
  const ListarProveedor({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);
    if (proveedorService.isLoading) return LoadingScreen();
    return Scaffold(
     
      body: ListView.builder(
        itemCount: proveedorService.proveedors.length,
        itemBuilder: (BuildContext context, index) {
          final proveedor = proveedorService.proveedors[index];
          return ListTile(
            onTap: () {
              proveedorService.SelectProveedor = proveedor.copy();
              Navigator.pushNamed(context, 'edit_proveedor');
            },
            title: Text(proveedor.proveedorName),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(proveedor.proveedorLastName),
                Text(proveedor.proveedorMail),
              ],
            ),
            trailing: Icon(Icons.arrow_forward),
          );
        },
      ),
   

   floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          proveedorService.SelectProveedor = Listado(
            proveedorId: 0,
            proveedorName: '',
            proveedorLastName: '',
            proveedorMail: '',
            proveedorState: '',
          );
          Navigator.pushNamed(context,'edit_proveedor');
        },
      ),

    );
  }
}