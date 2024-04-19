import 'package:flutter/material.dart';

import 'common/util_api.dart';

class MyTheme {
  Color backLogin = const Color(0xFF2D2D2D);
  Color white =  const Color(0xFFFFFFFF);

  final Map<int,Color> blue = {
    400: const Color(0xFF053661)
  };
  final Map<int, Color> green = {
    350: const Color(0xFF309E3A),
    400: const Color(0xFF379340),
    600: const Color(0xFF2C6132),
  };

  final Map<int, Color> gray = {
    200: const Color(0xFFB9B9B9),
    250: const Color(0xFFB5B5B5),
    350: const Color(0xFFA4A4A4),
    450: const Color(0xFF909090),
    700: const Color(0xFF4B4B4B),
    750: const Color(0xFF3D3D3D),
    790: const Color(0xFF373737),
    800: const Color(0xFF353355),
    850: const Color(0xFF272727)
  };

}

class Geral{
  static dynamic getValorJson(dynamic valor, TpValor tpValor, {dynamic valorPadrao}) {
    if (valor == null) return valorPadrao;
    if (tpValor == TpValor.double) {
      return double.parse(valor.toString());
    } else if (tpValor == TpValor.dateTime) {
      return DateTime.tryParse(valor);
    }
  }
}

