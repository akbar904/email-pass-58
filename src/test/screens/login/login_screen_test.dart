
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Mock dependencies if necessary
class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

// Main test file for lib/screens/login/login_screen.dart
void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('renders email and password TextFields and Login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextField), findsNWidgets(2));
			expect(find.text('Email'), findsOneWidget);
			expect(find.text('Password'), findsOneWidget);
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Login'), findsOneWidget);
		});
	});

	group('LoginScreen Cubit Tests', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, AuthState>(
			'emits AuthState when login button is pressed',
			build: () => mockAuthCubit,
			act: (cubit) {
				when(() => cubit.login(any(), any())).thenAnswer((_) async {});
				return cubit.login('test@example.com', 'password123');
			},
			expect: () => [],
		);

		testWidgets('invokes login on AuthCubit when login button is pressed', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (_) => mockAuthCubit,
						child: LoginScreen(),
					),
				),
			);

			await tester.enterText(find.byKey(Key('emailField')), 'test@example.com');
			await tester.enterText(find.byKey(Key('passwordField')), 'password123');
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			verify(() => mockAuthCubit.login('test@example.com', 'password123')).called(1);
		});
	});
}
