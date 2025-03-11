import 'package:app_shoes/src/models/zapato_model.dart';
import 'package:app_shoes/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ZapatoDescPage extends StatelessWidget {
  const ZapatoDescPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ZapatoSizePreview(fullScreen: true),
              Positioned(
                top: 80,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  highlightElevation: 0,
                  child: Icon(
                    Icons.chevron_left,
                    color: Colors.white,
                    size: 60,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ZapatoDescripcion(
                    titulo: 'Nike Air Max 720',
                    descripcion:
                        'A Nike Sportswear lifestyle sneaker, the Air Max 270 is a unique design that pairs the ultimate Air Max comfort with a modern-edge silhouette. Inspired by classic Air Max models from the 90s.',
                  ),
                  _MontoBuyNow(),
                  _ColoresYmas(),
                  _BotonesLikeCartSettings(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BotonesLikeCartSettings extends StatelessWidget {
  const _BotonesLikeCartSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _BotonSombreado(Icon(Icons.star,color: Colors.red,size: 25,)),
          _BotonSombreado(Icon(Icons.shopping_cart,color: Colors.grey.withOpacity(0.4),size: 25,)),
          _BotonSombreado(Icon(Icons.settings,color: Colors.grey.withOpacity(0.4),size: 25,))
          ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;
  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: -5,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: icon,
    );
  }
}

class _ColoresYmas extends ConsumerWidget {
  const _ColoresYmas();

  @override
  Widget build(BuildContext context,WidgetRef ref) {

 final zapato = ref.watch(zapatoProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  left: 90,
                  child: _BotonColor(
                    color: Color(0xffC6D642),
                    index: 4,
                    url: 'assets/imgs/verde.png',
                  ),
                ),
                Positioned(
                  left: 60,
                  child: _BotonColor(
                    color: Color(0xffFFAD29),
                    index: 3,
                    url: 'assets/imgs/amarillo.png',
                  ),
                ),
                Positioned(
                  left: 30,
                  child: _BotonColor(
                    color: Color(0xff2099F1),
                    index: 2,
                    url: 'assets/imgs/azul.png',
                  ),
                ),
                _BotonColor(
                  color: Color(0xff364D56),
                  index: 1,
                  url: 'assets/imgs/negro.png',
                ),
              ],
            ),
          ),
          BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          ),
        ],
      ),
    );
  }
}

class _BotonColor extends ConsumerWidget {
  final Color color;
  final int index;
  final String url;
  const _BotonColor({required this.color, required this.index, required this.url});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    return GestureDetector(
      onTap: () {
         ref.read(zapatoProvider.notifier).cambiarImagen(url);
        
      },
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}

class _MontoBuyNow extends StatelessWidget {
  const _MontoBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            BotonNaranja(
              texto: 'Buy now',
              alto: 40,
              ancho: 120,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
