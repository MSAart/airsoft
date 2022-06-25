import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSvg extends StatelessWidget {
  const IconSvg({
    required this.assetname,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String assetname;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(8),
        child: SvgPicture.asset(
          assetname,
          height: 30,
          width: 30,
        ),
      ),
      onTap: onTap,
    );
  }
}
