
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/models/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthState(isLoggedIn: false));

	void login(String email, String password) {
		// For simplicity, let's assume any email and password combination is valid.
		emit(AuthState(isLoggedIn: true));
	}

	void logout() {
		emit(AuthState(isLoggedIn: false));
	}
}
