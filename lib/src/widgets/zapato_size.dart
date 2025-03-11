import 'package:app_shoes/src/models/zapato_model.dart';
import 'package:app_shoes/src/pages/zapato_desc_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ZapatoSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ZapatoSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => ZapatoDescPage() ) );
        }
      },
      child: Padding(
        padding:  EdgeInsets.symmetric(
                              horizontal: (fullScreen) ? 5: 30, 
                              vertical: (fullScreen) ? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (fullScreen) ? 410: 430,
      
          decoration: BoxDecoration(
            color: Color(0xffFFD468),
            borderRadius: 
            (!fullScreen)
            ? BorderRadius.circular(50)
            : BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              ),
            
          ),
          child: Column(
            children: <Widget>[
              // Zapato con sombra
              _ZapatoConSombra(),
      
              // Tallas
              if(!fullScreen)
                _ZapatoTallas(),
            ],
          ),
        ),
      ),
    );
  }
}

class _ZapatoTallas extends StatelessWidget {
  const _ZapatoTallas();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _TallaZapatoCaja(7),
          _TallaZapatoCaja(7.5),
          _TallaZapatoCaja(8),
          _TallaZapatoCaja(8.5),
          _TallaZapatoCaja(9),
          _TallaZapatoCaja(9.5),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends ConsumerWidget {
  final double numero;

  const _TallaZapatoCaja(this.numero);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final zapato = ref.watch(zapatoProvider);

    return GestureDetector(
      onTap: () {
        ref.read(zapatoProvider.notifier).cambiarTalla(numero);
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: (numero == zapato.talla) ? Color(0xffF1A23A) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            if (numero == zapato.talla)
              BoxShadow(
                color: Color(0xffF1A23A),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
          ],
        ),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: (numero == zapato.talla) ? Colors.white : Color(0xffF1A23A),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends ConsumerWidget {
  @override
  Widget build(BuildContext context,WidgetRef ref) {

final zapato = ref.watch(zapatoProvider);

    return Stack(
      children: <Widget>[
        Positioned(bottom: 20, right: 0, child: _ZapatoSombra()),
        Image(image: AssetImage(zapato.assetImage)),
      ],
    );
  }
}

class _ZapatoSombra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Color(0xffEAA14E), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}
