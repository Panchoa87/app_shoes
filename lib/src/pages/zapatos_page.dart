import 'package:app_shoes/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';

class ZapatosPage extends StatelessWidget {
  const ZapatosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: CustomerAppBar(texto: 'For you')
      // body: ZapatoSizePreview()
      body: Column(
        children: [
          CustomerAppBar(texto: 'For you'),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Hero(
                    tag: 'zapato-1',
                    child: ZapatoSizePreview()),
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        'A Nike Sportswear lifestyle sneaker, the Air Max 270 is a unique design that pairs the ultimate Air Max comfort with a modern-edge silhouette. Inspired by classic Air Max models from the 90s, this unique shoe provides extreme performance as well as iconic styling. Whether you are a casual urban sneaker wearer or a more serious running enthusiast, this cushioned shoe is the perfect addition to any sneaker collection.',
                  ),
                ],
              ),
            ),
          ),
          AgregarCarritoBotton(monto: 180.0),
        ],
      ),
    );
  }
}
