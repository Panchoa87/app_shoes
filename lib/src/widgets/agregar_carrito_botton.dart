import 'package:app_shoes/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class AgregarCarritoBotton extends StatelessWidget {
  final double monto;
  const AgregarCarritoBotton({super.key, required this.monto});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Row(
          children: [
              SizedBox(width: 20,),
              Text('\$$monto', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
              Spacer(),
              BotonNaranja(texto: 'Add to cart', alto: 50, ancho: 150, color: Colors.orange),
              SizedBox(width: 20,),
          ],
          ),
      ),
    );
  }
}