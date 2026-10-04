import 'package:flutter/material.dart';
import '../models/portfolio_theme.dart';
import 'bio_screen.dart';

class ThemeSelectionScreen extends StatefulWidget {
  const ThemeSelectionScreen({super.key});

  @override
  State<ThemeSelectionScreen> createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  PortfolioTheme _selectedTheme = PortfolioTheme.astetcix;

  void _continueToBio() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BioScreen(
          selectedTheme: _selectedTheme,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Soft slate background
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFF4F46E5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.badge_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'MyPortfolio',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xFF0F172A),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step indicator
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFC7D2FE)),
                ),
                child: const Text(
                  'STEP 1 OF 5',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F46E5),
                    letterSpacing: 1.0,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Choose a Visual Theme',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Select the design style for your generated portfolio. You will be able to preview how your information looks across themes!',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),

              // Theme 1: Astetcix
              _buildThemeCard(
                theme: PortfolioTheme.astetcix,
                title: 'Aesthetic',
                subtitle: 'A modern, clean and aesthetic design with soft visual hierarchy and elegant typography.',
                previewWidget: _buildAstetcixPreview(),
              ),

              const SizedBox(height: 16),

              // Theme 2: Cyber Punk
              _buildThemeCard(
                theme: PortfolioTheme.cyberpunk,
                title: 'Cyber Punk',
                subtitle: 'Futuristic dark design with bright neon cyan & pink accents and high-contrast styling.',
                previewWidget: _buildCyberpunkPreview(),
              ),

              const SizedBox(height: 16),

              // Theme 3: Terminal
              _buildThemeCard(
                theme: PortfolioTheme.terminal,
                title: 'Terminal',
                subtitle: 'Developer-inspired console design with a dark background, green accents, and monospace formatting.',
                previewWidget: _buildTerminalPreview(),
              ),

              const SizedBox(height: 32),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _continueToBio,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4F46E5),
                    foregroundColor: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue to Bio',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward_rounded, size: 20),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildThemeCard({
    required PortfolioTheme theme,
    required String title,
    required String subtitle,
    required Widget previewWidget,
  }) {
    final isSelected = _selectedTheme == theme;

    return InkWell(
      onTap: () {
        setState(() {
          _selectedTheme = theme;
        });
      },
      borderRadius: BorderRadius.circular(16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFFE2E8F0),
            width: isSelected ? 2.5 : 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? const Color(0xFF4F46E5).withValues(alpha: 0.15)
                  : const Color(0x08000000),
              blurRadius: isSelected ? 14 : 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color(0xFF4F46E5).withValues(alpha: 0.1)
                        : const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    theme.icon,
                    color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFF64748B),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFF0F172A),
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF64748B),
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? const Color(0xFF4F46E5) : Colors.transparent,
                    border: Border.all(
                      color: isSelected ? const Color(0xFF4F46E5) : const Color(0xFFCBD5E1),
                      width: 2,
                    ),
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          size: 16,
                          color: Colors.white,
                        )
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Mini visual sample of this theme
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: previewWidget,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAstetcixPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFEEF2FF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, color: Color(0xFF4F46E5), size: 18),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alex Johnson',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  Text(
                    'Flutter Developer',
                    style: TextStyle(fontSize: 11, color: Color(0xFF64748B)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildSampleTag('Flutter', const Color(0xFFEEF2FF), const Color(0xFF4F46E5)),
              const SizedBox(width: 6),
              _buildSampleTag('Dart', const Color(0xFFECFDF5), const Color(0xFF059669)),
              const SizedBox(width: 6),
              _buildSampleTag('Clean UI', const Color(0xFFF0FDF4), const Color(0xFF16A34A)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCyberpunkPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0C20),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF00F0FF), width: 1.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E173D),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFFFF007F)),
                ),
                child: const Icon(Icons.bolt, color: Color(0xFFFF007F), size: 18),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ALEX_JOHNSON // DEV',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00F0FF),
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    '[ STATUS: ACTIVE_DEV ]',
                    style: TextStyle(fontSize: 10, color: Color(0xFFFF007F)),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildSampleTag('[ FLUTTER ]', const Color(0xFF1E173D), const Color(0xFF00F0FF)),
              const SizedBox(width: 6),
              _buildSampleTag('[ DART ]', const Color(0xFF1E173D), const Color(0xFFFF007F)),
              const SizedBox(width: 6),
              _buildSampleTag('[ NEON ]', const Color(0xFF1E173D), const Color(0xFFFFE600)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTerminalPreview() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF0A0E0A),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF00FF66), width: 1),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'guest@portfolio:~\$ cat bio.txt',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              color: Color(0xFF80FFA0),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Name: Alex Johnson | Role: Flutter Dev',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00FF66),
            ),
          ),
          SizedBox(height: 6),
          Text(
            '> skills: [Flutter, Dart, Python, Git]',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 10,
              color: Color(0xFF00FF66),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSampleTag(String label, Color bg, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
