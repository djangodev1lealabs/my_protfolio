import 'package:flutter/material.dart';
import '../models/education.dart';
import '../models/portfolio_theme.dart';
import '../models/project.dart';
import '../widgets/portfolio_card.dart';
import '../widgets/portfolio_section.dart';

class PortfolioPreviewScreen extends StatefulWidget {
  final PortfolioTheme selectedTheme;
  final String name;
  final String email;
  final String phone;
  final String bio;
  final List<String> skills;
  final List<Project> projects;
  final List<Education> educationList;

  const PortfolioPreviewScreen({
    super.key,
    required this.selectedTheme,
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
    required this.skills,
    required this.projects,
    required this.educationList,
  });

  @override
  State<PortfolioPreviewScreen> createState() => _PortfolioPreviewScreenState();
}

class _PortfolioPreviewScreenState extends State<PortfolioPreviewScreen> {
  late PortfolioTheme _activeTheme;

  @override
  void initState() {
    super.initState();
    _activeTheme = widget.selectedTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _activeTheme.backgroundColor,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Theme switcher bar to showcase dynamic visual themes
              _buildThemeSwitcher(),
              const SizedBox(height: 20),

              // 1. Header (Name, short professional description, email, phone)
              _buildHeader(),
              const SizedBox(height: 16),

              // 2. About (Bio)
              PortfolioSection(
                title: _activeTheme == PortfolioTheme.terminal
                    ? 'cat about_me.txt'
                    : 'About Me',
                icon: Icons.person_outline_rounded,
                theme: _activeTheme,
                terminalCommand: 'cat about_me.txt',
                child: _buildAboutSection(),
              ),

              // 3. Skills (All added skills)
              PortfolioSection(
                title: _activeTheme == PortfolioTheme.terminal
                    ? 'skills --list --all'
                    : 'Skills & Technologies',
                icon: Icons.code_rounded,
                theme: _activeTheme,
                terminalCommand: 'skills --list --all',
                child: _buildSkillsSection(),
              ),

              // 4. Projects (All projects: name, description, technology)
              PortfolioSection(
                title: _activeTheme == PortfolioTheme.terminal
                    ? 'ls -la ./projects'
                    : 'Featured Projects',
                icon: Icons.rocket_launch_outlined,
                theme: _activeTheme,
                terminalCommand: 'ls -la ./projects',
                child: _buildProjectsSection(),
              ),

              // 5. Education (All education entries: degree, institution, year)
              PortfolioSection(
                title: _activeTheme == PortfolioTheme.terminal
                    ? 'cat education.log'
                    : 'Education Background',
                icon: Icons.school_outlined,
                theme: _activeTheme,
                terminalCommand: 'cat education.log',
                child: _buildEducationSection(),
              ),

              // Footer
              _buildFooter(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    switch (_activeTheme) {
      case PortfolioTheme.astetcix:
        return AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF0F172A),
          title: const Text(
            'Portfolio Preview',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Start Over',
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        );

      case PortfolioTheme.cyberpunk:
        return AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF120E24),
          foregroundColor: const Color(0xFF00F0FF),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.5),
            child: Container(
              height: 1.5,
              color: const Color(0xFF00F0FF),
            ),
          ),
          title: const Text(
            '// PORTFOLIO.SYS // ONLINE',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              letterSpacing: 2.0,
              color: Color(0xFF00F0FF),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.restart_alt_rounded, color: Color(0xFFFF007F)),
              tooltip: 'Reset Generator',
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        );

      case PortfolioTheme.terminal:
        return AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF070B07),
          foregroundColor: const Color(0xFF00FF66),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              height: 1.0,
              color: const Color(0xFF00FF66),
            ),
          ),
          title: const Text(
            'guest@portfolio:~\$ preview --theme terminal',
            style: TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF00FF66),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.terminal, color: Color(0xFF00FF66)),
              tooltip: 'Exit to Start',
              onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        );
    }
  }

  Widget _buildThemeSwitcher() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: _activeTheme == PortfolioTheme.astetcix
            ? Colors.white
            : _activeTheme == PortfolioTheme.cyberpunk
                ? const Color(0xFF16132A)
                : const Color(0xFF0E160E),
        borderRadius: BorderRadius.circular(_activeTheme == PortfolioTheme.terminal ? 2 : 12),
        border: Border.all(
          color: _activeTheme == PortfolioTheme.astetcix
              ? const Color(0xFFE2E8F0)
              : _activeTheme == PortfolioTheme.cyberpunk
                  ? const Color(0xFF00F0FF).withValues(alpha: 0.4)
                  : const Color(0xFF00FF66).withValues(alpha: 0.4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 6),
            child: Text(
              _activeTheme == PortfolioTheme.terminal
                  ? '> switch_theme --active ${_activeTheme.displayName.toLowerCase()}'
                  : 'SWITCH THEME PREVIEW:',
              style: TextStyle(
                fontFamily: _activeTheme.fontFamily,
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: _activeTheme.textSecondaryColor,
                letterSpacing: 0.5,
              ),
            ),
          ),
          Row(
            children: PortfolioTheme.values.map((theme) {
              final isCurrent = _activeTheme == theme;
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _activeTheme = theme;
                      });
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: isCurrent
                            ? theme.primaryColor.withValues(alpha: 0.2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(theme == PortfolioTheme.terminal ? 2 : 8),
                        border: Border.all(
                          color: isCurrent ? theme.primaryColor : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            theme.icon,
                            size: 15,
                            color: isCurrent ? theme.primaryColor : _activeTheme.textSecondaryColor,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            theme.displayName,
                            style: TextStyle(
                              fontFamily: _activeTheme.fontFamily,
                              fontSize: 12,
                              fontWeight: isCurrent ? FontWeight.bold : FontWeight.w500,
                              color: isCurrent ? theme.primaryColor : _activeTheme.textSecondaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    switch (_activeTheme) {
      case PortfolioTheme.astetcix:
        return PortfolioCard(
          theme: _activeTheme,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 32,
                    backgroundColor: const Color(0xFFEEF2FF),
                    child: Text(
                      widget.name.isNotEmpty ? widget.name[0].toUpperCase() : 'P',
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F46E5),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: _activeTheme.textPrimaryColor,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Flutter & Mobile App Developer',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF4F46E5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Divider(height: 1, color: Color(0xFFF1F5F9)),
              const SizedBox(height: 14),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  _buildContactItem(Icons.email_outlined, widget.email),
                  _buildContactItem(Icons.phone_outlined, widget.phone),
                ],
              ),
            ],
          ),
        );

      case PortfolioTheme.cyberpunk:
        return PortfolioCard(
          theme: _activeTheme,
          padding: const EdgeInsets.all(20),
          accentBorderColor: const Color(0xFF00F0FF),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E173D),
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: const Color(0xFFFF007F), width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFFF007F).withValues(alpha: 0.4),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        widget.name.isNotEmpty ? widget.name[0].toUpperCase() : 'U',
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFFFF007F),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF00F0FF),
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFE600).withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFFFFE600), width: 0.8),
                          ),
                          child: const Text(
                            '[ CLASS: CYBER_ENGINEER // FLUTTER ]',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFFFFE600),
                              letterSpacing: 1.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Container(
                height: 1,
                color: const Color(0xFF00F0FF).withValues(alpha: 0.3),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  _buildCyberContact('EMAIL_LINK', widget.email, const Color(0xFF00F0FF)),
                  _buildCyberContact('PHONE_COMMS', widget.phone, const Color(0xFFFF007F)),
                ],
              ),
            ],
          ),
        );

      case PortfolioTheme.terminal:
        return PortfolioCard(
          theme: _activeTheme,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '/* ======================================================== */',
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF80FFA0),
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'NAME        : ${widget.name}',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF00FF66),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'ROLE        : Software & Flutter Developer',
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF80FFA0),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'EMAIL       : ${widget.email}',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF80FFA0),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'PHONE       : ${widget.phone}',
                style: const TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF80FFA0),
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                '/* ======================================================== */',
                style: TextStyle(
                  fontFamily: 'monospace',
                  color: Color(0xFF80FFA0),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
    }
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: const Color(0xFF4F46E5)),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF475569),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildCyberContact(String label, String value, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '[$label]: ',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.bold,
            color: color,
            letterSpacing: 1,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildAboutSection() {
    return PortfolioCard(
      theme: _activeTheme,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_activeTheme == PortfolioTheme.cyberpunk) ...[
            const Row(
              children: [
                Icon(Icons.bolt, color: Color(0xFFFF007F), size: 16),
                SizedBox(width: 6),
                Text(
                  'IDENTITY_MATRIX // BIO_STRING',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF007F),
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
          Text(
            widget.bio,
            style: TextStyle(
              fontFamily: _activeTheme.fontFamily,
              fontSize: 14,
              height: 1.6,
              color: _activeTheme.textPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillsSection() {
    return PortfolioCard(
      theme: _activeTheme,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: widget.skills.map((skill) {
          switch (_activeTheme) {
            case PortfolioTheme.astetcix:
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFC7D2FE)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.check_circle_rounded, size: 14, color: Color(0xFF4F46E5)),
                    const SizedBox(width: 6),
                    Text(
                      skill,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF4338CA),
                      ),
                    ),
                  ],
                ),
              );

            case PortfolioTheme.cyberpunk:
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E173D),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF00F0FF), width: 1.2),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF00F0FF).withValues(alpha: 0.2),
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: Text(
                  '# $skill',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF00F0FF),
                    letterSpacing: 1.0,
                  ),
                ),
              );

            case PortfolioTheme.terminal:
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF050A05),
                  border: Border.all(color: const Color(0xFF00FF66), width: 0.8),
                ),
                child: Text(
                  '[+] $skill',
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 12,
                    color: Color(0xFF00FF66),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
          }
        }).toList(),
      ),
    );
  }

  Widget _buildProjectsSection() {
    return Column(
      children: widget.projects.asMap().entries.map((entry) {
        final index = entry.key;
        final project = entry.value;

        switch (_activeTheme) {
          case PortfolioTheme.astetcix:
            return PortfolioCard(
              theme: _activeTheme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        project.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: const Color(0xFFECFDF5),
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: const Color(0xFFA7F3D0)),
                        ),
                        child: const Text(
                          'Project',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF059669),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF475569),
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.code_rounded, size: 16, color: Color(0xFF4F46E5)),
                      const SizedBox(width: 6),
                      Text(
                        'Tech: ${project.technology}',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF4F46E5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );

          case PortfolioTheme.cyberpunk:
            final isEven = index % 2 == 0;
            final accentCol = isEven ? const Color(0xFF00F0FF) : const Color(0xFFFF007F);
            return PortfolioCard(
              theme: _activeTheme,
              accentBorderColor: accentCol,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '// 0${index + 1} ',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                          color: accentCol,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          project.name.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    project.description,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFFB4B0D8),
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: accentCol.withValues(alpha: 0.1),
                      border: Border.all(color: accentCol, width: 0.8),
                    ),
                    child: Text(
                      'STACK: [ ${project.technology} ]',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: accentCol,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                ],
              ),
            );

          case PortfolioTheme.terminal:
            return PortfolioCard(
              theme: _activeTheme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '> PROJECT [${index + 1}]: "${project.name}"',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FF66),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '  description: ${project.description}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Color(0xFF80FFA0),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '  tech_stack : [${project.technology}]',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Color(0xFF00FF66),
                    ),
                  ),
                ],
              ),
            );
        }
      }).toList(),
    );
  }

  Widget _buildEducationSection() {
    return Column(
      children: widget.educationList.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;

        switch (_activeTheme) {
          case PortfolioTheme.astetcix:
            return PortfolioCard(
              theme: _activeTheme,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      color: Color(0xFF4F46E5),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.degree,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.institution,
                          style: const TextStyle(
                            fontSize: 13,
                            color: Color(0xFF475569),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            'Year: ${item.year}',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );

          case PortfolioTheme.cyberpunk:
            return PortfolioCard(
              theme: _activeTheme,
              accentBorderColor: const Color(0xFFFFE600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.school, size: 16, color: Color(0xFFFFE600)),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          item.degree.toUpperCase(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFFE600),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'INSTITUTION: ${item.institution}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'GRADUATION_YEAR: ${item.year}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: Color(0xFFB4B0D8),
                    ),
                  ),
                ],
              ),
            );

          case PortfolioTheme.terminal:
            return PortfolioCard(
              theme: _activeTheme,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '> EDU_RECORD [${index + 1}]:',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00FF66),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '  degree     : ${item.degree}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Color(0xFF80FFA0),
                    ),
                  ),
                  Text(
                    '  institution: ${item.institution}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Color(0xFF80FFA0),
                    ),
                  ),
                  Text(
                    '  year       : ${item.year}',
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      color: Color(0xFF00FF66),
                    ),
                  ),
                ],
              ),
            );
        }
      }).toList(),
    );
  }

  Widget _buildFooter() {
    switch (_activeTheme) {
      case PortfolioTheme.astetcix:
        return const Center(
          child: Column(
            children: [
              Divider(color: Color(0xFFE2E8F0)),
              SizedBox(height: 12),
              Text(
                'Generated with MyPortfolio App',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF64748B),
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Flutter Bootcamp • September 2026',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFF94A3B8),
                ),
              ),
            ],
          ),
        );

      case PortfolioTheme.cyberpunk:
        return Center(
          child: Column(
            children: [
              Container(
                height: 1,
                color: const Color(0xFF00F0FF).withValues(alpha: 0.3),
              ),
              const SizedBox(height: 12),
              const Text(
                '// POWERED BY FLUTTER // CYBERPUNK THEME ENGINE',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF00F0FF),
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        );

      case PortfolioTheme.terminal:
        return const Center(
          child: Text(
            '> [PROCESS COMPLETED WITH EXIT CODE 0]',
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 12,
              color: Color(0xFF00FF66),
            ),
          ),
        );
    }
  }
}
