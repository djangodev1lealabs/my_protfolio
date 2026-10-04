import 'package:flutter/material.dart';
import '../models/portfolio_theme.dart';

class PortfolioCard extends StatelessWidget {
  final Widget child;
  final PortfolioTheme theme;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Color? accentBorderColor;

  const PortfolioCard({
    super.key,
    required this.child,
    required this.theme,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.only(bottom: 12.0),
    this.accentBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    switch (theme) {
      case PortfolioTheme.astetcix:
        return Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFE2E8F0),
              width: 1.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0x0A000000),
                blurRadius: 12,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: child,
        );

      case PortfolioTheme.cyberpunk:
        final borderCol = accentBorderColor ?? theme.primaryColor;
        return Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            color: const Color(0xFF16132A),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: borderCol,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: borderCol.withValues(alpha: 0.25),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: child,
        );

      case PortfolioTheme.terminal:
        return Container(
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            color: const Color(0xFF0E160E),
            borderRadius: BorderRadius.circular(2),
            border: Border.all(
              color: const Color(0xFF00FF66),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF00FF66).withValues(alpha: 0.08),
                blurRadius: 4,
              ),
            ],
          ),
          child: child,
        );
    }
  }
}
