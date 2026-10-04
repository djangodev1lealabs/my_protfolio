import 'package:flutter/material.dart';

enum PortfolioTheme {
  astetcix,
  cyberpunk,
  terminal;

  String get displayName {
    switch (this) {
      case PortfolioTheme.astetcix:
        return 'Aesthetic';
      case PortfolioTheme.cyberpunk:
        return 'Cyber Punk';
      case PortfolioTheme.terminal:
        return 'Terminal';
    }
  }

  String get subtitle {
    switch (this) {
      case PortfolioTheme.astetcix:
        return 'Modern, clean & aesthetic minimal design';
      case PortfolioTheme.cyberpunk:
        return 'Futuristic dark UI with vibrant neon glow';
      case PortfolioTheme.terminal:
        return 'Retro developer console & hacker aesthetic';
    }
  }

  IconData get icon {
    switch (this) {
      case PortfolioTheme.astetcix:
        return Icons.auto_awesome_rounded;
      case PortfolioTheme.cyberpunk:
        return Icons.electric_bolt_rounded;
      case PortfolioTheme.terminal:
        return Icons.terminal_rounded;
    }
  }

  Color get primaryColor {
    switch (this) {
      case PortfolioTheme.astetcix:
        return const Color(0xFF4F46E5); // Indigo
      case PortfolioTheme.cyberpunk:
        return const Color(0xFF00F0FF); // Neon Cyan
      case PortfolioTheme.terminal:
        return const Color(0xFF00FF66); // Terminal Green
    }
  }

  Color get secondaryColor {
    switch (this) {
      case PortfolioTheme.astetcix:
        return const Color(0xFF06B6D4); // Cyan
      case PortfolioTheme.cyberpunk:
        return const Color(0xFFFF007F); // Neon Pink
      case PortfolioTheme.terminal:
        return const Color(0xFF80FFA0); // Mint Green
    }
  }

  Color get backgroundColor {
    switch (this) {
      case PortfolioTheme.astetcix:
        return const Color(0xFFF8FAFC); // Slate 50
      case PortfolioTheme.cyberpunk:
        return const Color(0xFF0D0B18); // Dark Space
      case PortfolioTheme.terminal:
        return const Color(0xFF0A0E0A); // Terminal Black
    }
  }

  Color get cardColor {
    switch (this) {
      case PortfolioTheme.astetcix:
        return Colors.white;
      case PortfolioTheme.cyberpunk:
        return const Color(0xFF16132A);
      case PortfolioTheme.terminal:
        return const Color(0xFF0E160E);
    }
  }

  Color get textPrimaryColor {
    switch (this) {
      case PortfolioTheme.astetcix:
        return const Color(0xFF0F172A); // Slate 900
      case PortfolioTheme.cyberpunk:
        return Colors.white;
      case PortfolioTheme.terminal:
        return const Color(0xFF00FF66); // Monospace Green
    }
  }

  Color get textSecondaryColor {
    switch (this) {
      case PortfolioTheme.astetcix:
        return const Color(0xFF64748B); // Slate 500
      case PortfolioTheme.cyberpunk:
        return const Color(0xFFB4B0D8);
      case PortfolioTheme.terminal:
        return const Color(0xFF80FFA0);
    }
  }

  String? get fontFamily {
    switch (this) {
      case PortfolioTheme.astetcix:
        return null; // System font
      case PortfolioTheme.cyberpunk:
        return null;
      case PortfolioTheme.terminal:
        return 'monospace';
    }
  }
}
