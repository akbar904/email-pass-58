
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.my_flutter_app/models/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthState', () {
		test('Initial state should have isLoggedIn as false', () {
			final authState = AuthState(isLoggedIn: false);
			expect(authState.isLoggedIn, false);
		});

		test('State can be updated to isLoggedIn true', () {
			final authState = AuthState(isLoggedIn: true);
			expect(authState.isLoggedIn, true);
		});
	});

	group('AuthCubit', () {
		late MockAuthCubit mockAuthCubit;

		setUp(() {
			mockAuthCubit = MockAuthCubit();
		});

		blocTest<MockAuthCubit, AuthState>(
			'emit [AuthState(isLoggedIn: true)] when login is called',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.login('email', 'password'),
			expect: () => [AuthState(isLoggedIn: true)],
		);

		blocTest<MockAuthCubit, AuthState>(
			'emit [AuthState(isLoggedIn: false)] when logout is called',
			build: () => mockAuthCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthState(isLoggedIn: false)],
		);
	});
}
