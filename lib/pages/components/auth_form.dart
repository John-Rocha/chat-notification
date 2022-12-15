import 'dart:io';

import 'package:chat_notification/pages/components/user_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

import 'package:chat_notification/models/auth_form_data.dart';

class AuthForm extends StatefulWidget {
  final void Function(AuthFormData authFormData) onSubmit;

  const AuthForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _authFormData = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  void _handleImagePick(File image) {
    _authFormData.image = image;
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(context).errorColor,
        ),
      );
  }

  void _submit() {
    final formValidate = _formKey.currentState?.validate() ?? false;

    if (!formValidate) return;

    if (_authFormData.image == null && _authFormData.isSignup) {
      return _showError('Imagem não selecionada');
    }

    widget.onSubmit(_authFormData);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _authFormData.isSignup
                  ? UserImagePicker(
                      onImagePick: _handleImagePick,
                    )
                  : const SizedBox.shrink(),
              _authFormData.isSignup
                  ? TextFormField(
                      decoration: const InputDecoration(labelText: 'Nome'),
                      initialValue: _authFormData.name,
                      onChanged: (name) => _authFormData.name = name,
                      validator: Validatorless.multiple([
                        Validatorless.required('Nome é obrigatório'),
                        Validatorless.min(
                          3,
                          'Nome precisa ter no mínimo 3 caractéres',
                        ),
                      ]),
                    )
                  : const SizedBox.shrink(),
              TextFormField(
                decoration: const InputDecoration(labelText: 'E-mail'),
                initialValue: _authFormData.email,
                onChanged: (email) => _authFormData.email = email,
                validator: Validatorless.multiple([
                  Validatorless.required('E-mail é obrigatório'),
                  Validatorless.email('Digite um e-mail válido'),
                ]),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                initialValue: _authFormData.password,
                onChanged: (password) => _authFormData.password = password,
                validator: Validatorless.multiple([
                  Validatorless.required('Senha é obrigatória'),
                  Validatorless.min(
                      6, 'A senha deve conter pelo menos 6 caractéres'),
                ]),
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
