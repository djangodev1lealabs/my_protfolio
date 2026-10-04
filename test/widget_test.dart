import 'package:flutter_test/flutter_test.dart';
import 'package:my_protfolio/main.dart';

void main() {
  testWidgets('Complete End-to-End flow: Theme -> Bio -> Skills -> Projects -> Education -> Preview',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyPortfolioApp());

    // 1. Verify Theme Selection Screen
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('Choose a Visual Theme'), findsOneWidget);

    // Select Cyber Punk
    await tester.tap(find.text('Cyber Punk'));
    await tester.pumpAndSettle();

    // Scroll and tap Continue to Bio
    final continueToBio = find.text('Continue to Bio');
    await tester.ensureVisible(continueToBio);
    await tester.tap(continueToBio);
    await tester.pumpAndSettle();

    // 2. Verify Bio Screen
    expect(find.text('Personal Info'), findsOneWidget);
    expect(find.text('Tell us about yourself'), findsOneWidget);

    // Tap Sample Data action button to populate form
    await tester.tap(find.text('Sample Data'));
    await tester.pumpAndSettle();

    expect(find.text('Alex Johnson'), findsOneWidget);
    expect(find.text('alex@example.com'), findsOneWidget);

    // Continue to Skills
    final continueToSkills = find.text('Continue to Skills');
    await tester.ensureVisible(continueToSkills);
    await tester.tap(continueToSkills);
    await tester.pumpAndSettle();

    // 3. Verify Skills Screen
    expect(find.text('Technical Skills'), findsOneWidget);
    expect(find.text('Add Your Skills'), findsOneWidget);

    // Tap Sample Skills button
    await tester.tap(find.text('Sample Skills'));
    await tester.pumpAndSettle();

    expect(find.text('Flutter'), findsWidgets);
    expect(find.text('Dart'), findsWidgets);

    // Continue to Projects
    final continueToProjects = find.text('Continue to Projects');
    await tester.ensureVisible(continueToProjects);
    await tester.tap(continueToProjects);
    await tester.pumpAndSettle();

    // 4. Verify Projects Screen
    expect(find.text('Featured Projects'), findsOneWidget);
    expect(find.text('Showcase Your Projects'), findsOneWidget);

    // Tap Sample Projects button
    await tester.tap(find.text('Sample Projects'));
    await tester.pumpAndSettle();

    expect(find.text('My Portfolio App'), findsOneWidget);
    expect(find.text('Student Management System'), findsOneWidget);

    // Continue to Education
    final continueToEducation = find.text('Continue to Education');
    await tester.ensureVisible(continueToEducation);
    await tester.tap(continueToEducation);
    await tester.pumpAndSettle();

    // 5. Verify Education Screen
    expect(find.text('Education History'), findsOneWidget);
    expect(find.text('Education Details'), findsOneWidget);

    // Tap Sample Edu button
    await tester.tap(find.text('Sample Edu'));
    await tester.pumpAndSettle();

    expect(find.text('B.Tech Computer Science'), findsOneWidget);
    expect(find.text('ABC College of Engineering'), findsOneWidget);

    // Tap Generate Portfolio
    final generateBtn = find.text('Generate Portfolio Preview');
    await tester.ensureVisible(generateBtn);
    await tester.tap(generateBtn);
    await tester.pumpAndSettle();

    // 6. Verify Portfolio Preview Screen
    expect(find.text('// PORTFOLIO.SYS // ONLINE'), findsOneWidget);
    expect(find.text('ALEX JOHNSON'), findsOneWidget);
    expect(find.text('alex@example.com'), findsOneWidget);
    expect(find.text('+91 9876543210'), findsOneWidget);

    // Verify theme switching on preview screen
    expect(find.text('Terminal'), findsOneWidget);
    await tester.tap(find.text('Terminal'));
    await tester.pumpAndSettle();

    expect(find.textContaining('guest@portfolio:~\$ preview --theme terminal'), findsOneWidget);

    // Switch to Astetcix
    await tester.tap(find.text('Astetcix'));
    await tester.pumpAndSettle();

    expect(find.text('Portfolio Preview'), findsOneWidget);
    expect(find.text('Flutter & Mobile App Developer'), findsOneWidget);
  });
}
