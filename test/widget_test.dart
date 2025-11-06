import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:h1d023023_tugas6/main.dart';
import 'package:h1d023023_tugas6/ui/form_data.dart';
import 'package:h1d023023_tugas6/ui/tampil_data.dart';

void main() {
  testWidgets('Form input data test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that form elements are present
    expect(find.text('Form Input Data'), findsOneWidget);
    expect(
      find.byType(TextFormField),
      findsNWidgets(3),
    ); // Nama, NIM, Tahun Lahir
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Simpan'), findsOneWidget);
  });

  testWidgets('Form validation test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Tap the 'Simpan' button without filling the form
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that validation errors appear
    expect(find.text('Nama tidak boleh kosong'), findsOneWidget);
    expect(find.text('NIM tidak boleh kosong'), findsOneWidget);
    expect(find.text('Tahun lahir tidak boleh kosong'), findsOneWidget);
  });

  testWidgets('Form submission and navigation test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Fill the form
    await tester.enterText(find.byKey(Key('Nama Lengkap')), 'Stephen Prasetya');
    await tester.enterText(find.byKey(Key('NIM')), 'H1D021025');
    await tester.enterText(find.byKey(Key('Tahun Lahir')), '2004');

    // Tap the 'Simpan' button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that we navigated to TampilData
    expect(find.byType(TampilData), findsOneWidget);
    expect(find.text('Stephen Prasetya'), findsOneWidget);
    expect(find.text('H1D021025'), findsOneWidget);
    expect(find.text('2004'), findsOneWidget);
  });
}
