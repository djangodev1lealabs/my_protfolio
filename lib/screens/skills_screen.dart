import 'package:flutter/material.dart';
import '../models/portfolio_theme.dart';
import 'projects_screen.dart';

class SkillsScreen extends StatefulWidget {
  final PortfolioTheme selectedTheme;
  final String name;
  final String email;
  final String phone;
  final String bio;

  const SkillsScreen({
    super.key,
    required this.selectedTheme,
    required this.name,
    required this.email,
    required this.phone,
    required this.bio,
  });

  @override
  State<SkillsScreen> createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  final TextEditingController _skillController = TextEditingController();
  final List<String> _skills = [];

  final List<String> _sampleSkillSuggestions = [
    'Flutter',
    'Dart',
    'Python',
    'Django',
    'Git',
    'UI Design',
    'REST APIs',
    'Firebase',
  ];

  @override
  void dispose() {
    _skillController.dispose();
    super.dispose();
  }

  void _addSkill([String? predefinedSkill]) {
    final skillToAdd = (predefinedSkill ?? _skillController.text).trim();

    if (skillToAdd.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a skill name'),
          duration: Duration(seconds: 1),
        ),
      );
      return;
    }

    if (_skills.any((s) => s.toLowerCase() == skillToAdd.toLowerCase())) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"$skillToAdd" is already added!'),
          duration: const Duration(seconds: 1),
        ),
      );
      return;
    }

    setState(() {
      _skills.add(skillToAdd);
      if (predefinedSkill == null) {
        _skillController.clear();
      }
    });
  }

  void _removeSkill(int index) {
    setState(() {
      _skills.removeAt(index);
    });
  }

  void _loadAllSampleSkills() {
    setState(() {
      for (final skill in ['Flutter', 'Dart', 'Python', 'Django', 'Git', 'UI Design']) {
        if (!_skills.any((s) => s.toLowerCase() == skill.toLowerCase())) {
          _skills.add(skill);
        }
      }
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Loaded sample skills!'),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _continueToProjects() {
    if (_skills.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please add at least one skill before continuing'),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProjectsScreen(
          selectedTheme: widget.selectedTheme,
          name: widget.name,
          email: widget.email,
          phone: widget.phone,
          bio: widget.bio,
          skills: _skills,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF0F172A),
        title: const Text(
          'Technical Skills',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          TextButton.icon(
            onPressed: _loadAllSampleSkills,
            icon: const Icon(Icons.playlist_add_check, size: 18, color: Color(0xFF4F46E5)),
            label: const Text(
              'Sample Skills',
              style: TextStyle(color: Color(0xFF4F46E5), fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFC7D2FE)),
                    ),
                    child: const Text(
                      'STEP 3 OF 5',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F46E5),
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),
                  Text(
                    '${_skills.length} added',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              const Text(
                'Add Your Skills',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Type a skill name and press "Add". You can add multiple technologies and tools you are familiar with.',
                style: TextStyle(fontSize: 14, color: Color(0xFF64748B), height: 1.4),
              ),
              const SizedBox(height: 20),

              // Input Row
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x06000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Skill Name',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1E293B),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _skillController,
                            onSubmitted: (_) => _addSkill(),
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              hintText: 'e.g. Flutter, Dart, Python...',
                              hintStyle: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                              prefixIcon: const Icon(Icons.code_rounded, color: Color(0xFF64748B), size: 20),
                              filled: true,
                              fillColor: const Color(0xFFF8FAFC),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFFCBD5E1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Color(0xFF4F46E5), width: 2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          height: 48,
                          child: ElevatedButton.icon(
                            onPressed: () => _addSkill(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF4F46E5),
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                            icon: const Icon(Icons.add, size: 18),
                            label: const Text(
                              'Add',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Quick suggestion pills
                    const Text(
                      'Quick suggestions (tap to add):',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF64748B),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: _sampleSkillSuggestions.map((skill) {
                        final isAdded = _skills.any((s) => s.toLowerCase() == skill.toLowerCase());
                        return InkWell(
                          onTap: isAdded ? null : () => _addSkill(skill),
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: isAdded ? const Color(0xFFF1F5F9) : const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: isAdded ? const Color(0xFFCBD5E1) : const Color(0xFFC7D2FE),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  skill,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: isAdded ? const Color(0xFF94A3B8) : const Color(0xFF4F46E5),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  isAdded ? Icons.check : Icons.add,
                                  size: 14,
                                  color: isAdded ? const Color(0xFF94A3B8) : const Color(0xFF4F46E5),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Skills List display section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Skills Added',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  if (_skills.isNotEmpty)
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _skills.clear();
                        });
                      },
                      child: const Text(
                        'Clear all',
                        style: TextStyle(color: Color(0xFFEF4444), fontSize: 12),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              if (_skills.isEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: const Column(
                    children: [
                      Icon(Icons.terminal, color: Color(0xFF94A3B8), size: 36),
                      SizedBox(height: 8),
                      Text(
                        'No skills added yet',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Type a skill above or tap one of the suggestions to add it to your portfolio.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                      ),
                    ],
                  ),
                )
              else
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _skills.length,
                    separatorBuilder: (context, index) => const Divider(
                      height: 1,
                      color: Color(0xFFF1F5F9),
                    ),
                    itemBuilder: (context, index) {
                      final skill = _skills[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEF2FF),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4F46E5),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                skill,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E293B),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close_rounded,
                                color: Color(0xFFEF4444),
                                size: 18,
                              ),
                              tooltip: 'Remove $skill',
                              onPressed: () => _removeSkill(index),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              const SizedBox(height: 32),

              // Continue Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _continueToProjects,
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
                        'Continue to Projects',
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
}
