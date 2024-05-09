import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormSection1 extends ConsumerWidget {
  const FormSection1({super.key, required this.formGroup});

  final FormGroup formGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ReactiveTextField(
          key: const Key('name'),
          formControlName: 'name',
          textInputAction: TextInputAction.next,
          onSubmitted: (control) => formGroup.focus('email'),
        ),
        ReactiveTextField(
            key: const Key('email'),
            formControlName: 'email',
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'The email must not be empty',
              ValidationMessage.email: (error) =>
                  'The email value must be a valid email',
            }),
        ReactiveTextField(
            key: const Key('password'),
            formControlName: 'password',
            obscureText: true,
            validationMessages: {
              ValidationMessage.minLength: (error) =>
                  'The password must be at least ${(error as Map)['requiredLength']} characters long'
            }),
        ReactiveTextField(
          key: const Key('passwordConfirm'),
          formControlName: 'passwordConfirm',
          obscureText: true,
        ),
        ReactiveTextField(
          formControlName: 'dateOfBirth',
          valueAccessor: DateTimeValueAccessor(),
          decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: ReactiveDatePicker(
              formControlName: 'dateOfBirth',
              firstDate: DateTime(1985),
              lastDate: DateTime.now(),
              builder: (context, picker, child) {
                return IconButton(
                  onPressed: picker.showPicker,
                  icon: const Icon(Icons.access_time),
                );
              },
            ),
          ),
        ),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () {},
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
