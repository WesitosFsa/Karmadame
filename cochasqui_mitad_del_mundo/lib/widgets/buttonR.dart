import 'package:flutter/material.dart';

class ButtonR extends StatelessWidget {
  bool? isResponsive;
  double? width;
  final VoidCallback? onTap;
  String? text;
  final bool showIcon; // 👈 Nueva propiedad

  ButtonR({
    Key? key,
    this.width,
    this.isResponsive = false,
    this.onTap,
    this.text,
    this.showIcon = true, // 👈 Valor por defecto: muestra ícono
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(186, 83, 157, 226),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showIcon) Image.asset("assets/images/icono.png"), // 👈 Solo si showIcon es true
            if (text != null) ...[
              if (showIcon) const SizedBox(width: 10), // 👈 Espacio solo si hay ícono
              Text(
                text!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
