import 'package:flutter/material.dart';

class SocialIconButton extends StatelessWidget {
  final String assetPath; // Idealmente pasas un SVG o imagen PNG de Google/Apple

  const SocialIconButton({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Image.asset(assetPath, height: 24, width: 24), 
      // Nota: Sustituye con Icon() si usas iconos en lugar de imágenes de momento.
    );
  }
}