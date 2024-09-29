
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:my_flutter_app/main.dart';

void main() {
	group('Main App Initialization', () {
		testWidgets('App launches and shows LoginScreen initially', (WidgetTester tester) async {
			// Arrange & Act
			await tester.pumpWidget(MyApp());

			// Assert
			expect(find.text('Login'), findsOneWidget);
			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});
}
