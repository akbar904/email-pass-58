
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';
import 'package:my_flutter_app/models/auth_state.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('AuthCubit', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = AuthCubit();
		});

		tearDown(() {
			authCubit.close();
		});

		test('initial state is AuthState(isLoggedIn: false)', () {
			expect(authCubit.state, AuthState(isLoggedIn: false));
		});

		blocTest<AuthCubit, AuthState>(
			'login emits [AuthState(isLoggedIn: true)] when email and password are provided',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [AuthState(isLoggedIn: true)],
		);

		blocTest<AuthCubit, AuthState>(
			'logout emits [AuthState(isLoggedIn: false)]',
			build: () => authCubit,
			act: (cubit) => cubit.logout(),
			expect: () => [AuthState(isLoggedIn: false)],
		);
	});
}
