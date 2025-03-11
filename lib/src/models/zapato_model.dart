import 'package:flutter_riverpod/flutter_riverpod.dart';

// Definir el estado del zapato
class ZapatoState {
  final String assetImage;
  final double talla;

  ZapatoState({
    this.assetImage = 'assets/imgs/azul.png',
    this.talla = 9.0,
  });

  ZapatoState copyWith({String? assetImage, double? talla}) {
    return ZapatoState(
      assetImage: assetImage ?? this.assetImage,
      talla: talla ?? this.talla,
    );
  }
}

// StateNotifier para gestionar el estado
class ZapatoNotifier extends StateNotifier<ZapatoState> {
  ZapatoNotifier() : super(ZapatoState());

  void cambiarImagen(String nuevaImagen) {
    state = state.copyWith(assetImage: nuevaImagen);
  }

  void cambiarTalla(double nuevaTalla) {
    state = state.copyWith(talla: nuevaTalla);
  }
}

// Provider de Riverpod
final zapatoProvider = StateNotifierProvider<ZapatoNotifier, ZapatoState>((ref) {
  return ZapatoNotifier();
});
