import 'package:flutter/material.dart';

class HoverBtn extends StatelessWidget {
  final double scale;
  final EdgeInsets padding;
  final Color onHoverBackgroundColor;
  final Color backgroundColor;
  final Color onHoverBorderColor;
  final Color borderColor;
  final Color onHoverBoxShadowColor;
  final Color boxShadowColor;
  final Color onHoverIconColor;
  final Color iconColor;
  final Color onHoverTextColor;
  final Color textColor;
  final String? text;
  final double? fontSize;
  final double iconSize;
  final IconData? iconData;
  final double? paddinBetTextnIcon;

  const HoverBtn(
      {super.key,
      this.scale = 1.1,
      this.padding = const EdgeInsets.all(8),
      this.backgroundColor = const Color(0xFFFFFFFF), // Colors.white
      this.onHoverBackgroundColor =
          const Color(0xFFE0E0E0), // Colors.grey.shade300
      this.onHoverBorderColor = const Color(0xFFE0E0E0), // Colors.grey.shade300
      this.borderColor = const Color(0xFFF5F5F5), // Colors.grey.shade100
      this.onHoverBoxShadowColor =
          const Color(0xFFE0E0E0), // Colors.grey.shade300
      this.boxShadowColor = const Color(0xFFF5F5F5), // Colors.grey.shade100
      this.text,
      this.iconData,
      this.iconSize = 24,
      this.fontSize = 24,
      this.paddinBetTextnIcon = 4,
      this.onHoverTextColor = const Color(0xFF9E9E9E), // Colors.grey
      this.textColor = Colors.black,
      this.iconColor = const Color(0xFF9E9E9E), // Colors.grey
      this.onHoverIconColor = Colors.black})
      : assert(text != null || iconData != null,
            'Either text or iconData must be provided');

  @override
  Widget build(BuildContext context) {
    bool isHovered = false;
    return StatefulBuilder(
      builder: (context, setState) {
        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedScale(
            scale: isHovered ? scale : 1.0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              padding: padding,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: isHovered ? onHoverBackgroundColor : backgroundColor,
                border: Border.all(
                    color: isHovered ? onHoverBorderColor : borderColor),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 2.0,
                    color: isHovered ? onHoverBoxShadowColor : boxShadowColor,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  text != null
                      ? Text(
                          text!,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: isHovered ? textColor : onHoverTextColor,
                            fontWeight:
                                isHovered ? FontWeight.bold : FontWeight.normal,
                          ),
                        )
                      : const SizedBox(),
                  SizedBox(height: iconData != null ? paddinBetTextnIcon : 0),
                  iconData != null
                      ? Icon(iconData,
                          size: iconSize,
                          color: isHovered ? onHoverIconColor : iconColor)
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
