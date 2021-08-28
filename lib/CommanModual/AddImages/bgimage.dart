import 'package:flutter/material.dart';

class BgImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('assets/images/screen.jpg');
    Image image = Image(image: assetImage);
    return Image.asset("assets/images/screen.jpg",
      fit: BoxFit.cover,
      //color: Colors.black87.withOpacity(0.1),
      //colorBlendMode: BlendMode.darken,
    );
  }
}

