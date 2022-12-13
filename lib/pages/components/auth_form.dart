import 'package:chat_notification/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _authFormData = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final formValidate = _formKey.currentState?.validate() ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _authFormData.isSignup
                  ? TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                      initialValue: _authFormData.name,
                      onChanged: (name) => _authFormData.name = name,
                    )
                  : const SizedBox.shrink(),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                initialValue: _authFormData.email,
                onChanged: (email) => _authFormData.email = email,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Senha'),
                initialValue: _authFormData.password,
                onChanged: (password) => _authFormData.password = password,
                obscureText: true,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _submit,
                child: Text(
                  _authFormData.isLogin ? 'Entrar' : 'Cadastrar',
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _authFormData.toggleAuthMode();
                  });
                },
                child: Text(
                  _authFormData.isLogin
                      ? 'Criar uma nova conta?'
                      : 'Já possui conta?',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
