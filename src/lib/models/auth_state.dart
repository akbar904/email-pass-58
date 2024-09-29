
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
	final bool isLoggedIn;

	AuthState({required this.isLoggedIn});

	@override
	List<Object> get props => [isLoggedIn];
}
