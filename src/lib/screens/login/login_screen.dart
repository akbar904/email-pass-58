
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_app/cubits/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('Login'),
			),
			body: Padding(
				padding: const EdgeInsets.all(16.0),
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: [
						TextField(
							key: Key('emailField'),
							decoration: InputDecoration(
								labelText: 'Email',
							),
						),
						TextField(
							key: Key('passwordField'),
							decoration: InputDecoration(
								labelText: 'Password',
							),
							obscureText: true,
						),
						SizedBox(height: 20),
						ElevatedButton(
							onPressed: () {
								final email = (context as Element).findAncestorWidgetOfExactType<TextField>()?.controller?.text;
								final password = (context as Element).findAncestorWidgetOfExactType<TextField>()?.controller?.text;
								if (email != null && password != null) {
									context.read<AuthCubit>().login(email, password);
								}
							},
							child: Text('Login'),
						),
					],
				),
			),
		);
	}
}
