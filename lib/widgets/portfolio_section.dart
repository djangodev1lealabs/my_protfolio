import 'package:flutter/material.dart';
import '../models/portfolio_theme.dart';

class PortfolioSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;
  final PortfolioTheme theme;
  final String? terminalCommand;

  const PortfolioSection({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
    required this.theme,
    this.terminalCommand,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildHeader() {
    switch (theme) {
      case PortfolioTheme.astetcix:
        return Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: theme.primaryColor,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: theme.textPrimaryColor,
                letterSpacing: -0.3,
              ),
            ),
          ],
        );

      case PortfolioTheme.cyberpunk:
        return Row(
          children: [
            Text(
              '//',
              style: TextStyle(
                color: theme.secondaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: theme.primaryColor,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 1.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      theme.secondaryColor.withValues(alpha: 0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
          ],
        );

      case PortfolioTheme.terminal:
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: const Color(0xFF070B07),
            border: Border.all(
              color: const Color(0xFF00FF66).withValues(alpha: 0.4),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'guest@portfolio:~\$ ',
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF80FFA0),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                terminalCommand ?? title.toLowerCase().replaceAll(' ', '_'),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF00FF66),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
    }
  }
}
