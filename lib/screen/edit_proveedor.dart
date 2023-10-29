import 'package:flutter/material.dart';
import 'package:almacen_online/providers/proveedor_form_provider.dart';
import 'package:almacen_online/services/proveedor_service.dart';
import 'package:provider/provider.dart';
import '../ui/input_decorations.dart';

class EditProveedorScreen extends StatelessWidget {
  const EditProveedorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);
    return ChangeNotifierProvider(
        create: (_) => ProveedorFormProvider(proveedorService.SelectProveedor!),
        child: _ProveedorScreenBody(
          proveedorService: proveedorService,
        ));
  }
}

class _ProveedorScreenBody extends StatelessWidget {
  const _ProveedorScreenBody({
    Key? key,
    required this.proveedorService,
  }) : super(key: key);

  final ProveedorService proveedorService;
  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedorFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Proveedores"),
        elevation: 1,
        backgroundColor: Color.fromARGB(255, 4, 1, 171),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _ProveedorForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!proveedorForm.isValidForm()) return;
              await proveedorService.deleteProveedor(proveedorForm.proveedor, context);
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save_alt_outlined),
            onPressed: () async {
              if (!proveedorForm.isValidForm()) return;
              await proveedorService.editOrCreateProveedor(proveedorForm.proveedor);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}

class _ProveedorForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedorFormProvider>(context);
    final proveedor = proveedorForm.proveedor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: proveedorForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: proveedor.proveedorName,
                onChanged: (value) => proveedor.proveedorName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El nombre es obligatorio';
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre del proveedor',
                  labelText: 'Nombre proveedor',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: proveedor.proveedorLastName,
                onChanged: (value) => proveedor.proveedorLastName = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El apellido es obligatorio';
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Apellido del proveedor',
                  labelText: 'Apellido proveedor',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: proveedor.proveedorMail,
                onChanged: (value) => proveedor.proveedorMail = value,
                validator: (value) {
                  //  agregar validaciones específicas para el correo aquí
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Correo del proveedor',
                  labelText: 'Correo proveedor',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: proveedor.proveedorState,
                onChanged: (value) => proveedor.proveedorState = value,
                validator: (value) {
                  // Puedes agregar validaciones específicas para el estado aquí
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Estado del proveedor',
                  labelText: 'Estado proveedor',
                ),
              ),
              const SizedBox(height: 20),
              SwitchListTile.adaptive(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.blue,
                title: const Text('Activo'),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}