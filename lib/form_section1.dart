import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form/form_data.dart';

class FormSection1 extends ConsumerWidget {
  const FormSection1({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ReactiveTextField(
            key: Key(FormStaticData.userName.key),
            formControlName: FormStaticData.userName.field,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.email.field),
            decoration: InputDecoration(
              labelText: FormStaticData.userName.labelText,
              hintText: FormStaticData.userName.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'The username must not be empty',
              ValidationMessage.minLength: (error) =>
                  'The password must be at least ${(error as Map)['requiredLength']} characters long'
            }),
        const SizedBox(height: 8),
        ReactiveTextField(
            key: Key(FormStaticData.email.key),
            formControlName: FormStaticData.email.field,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.password.field),
            decoration: InputDecoration(
              labelText: FormStaticData.email.labelText,
              hintText: FormStaticData.email.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'The email must not be empty',
              ValidationMessage.email: (error) =>
                  'The email value must be a valid email',
              // TODO : Add Unique Email Validator
              'unique': (_) => 'This email is already in use'
            }),
        const SizedBox(height: 8),
        ReactiveTextField(
            key: Key(FormStaticData.password.key),
            formControlName: FormStaticData.password.field,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.passwordConfirm.field),
            // obscureText: true,
            decoration: InputDecoration(
              labelText: FormStaticData.password.labelText,
              hintText: FormStaticData.password.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'The password must not be empty',
              ValidationMessage.minLength: (error) =>
                  'The password must be at least ${(error as Map)['requiredLength']} characters long'
            }),
        const SizedBox(height: 8),
        ReactiveTextField(
            key: Key(FormStaticData.passwordConfirm.key),
            formControlName: FormStaticData.passwordConfirm.field,
            textInputAction: TextInputAction.done,
            // onSubmitted: (control) => formGroup.focus('submit-section-1'),
            // obscureText: true,
            decoration: InputDecoration(
              labelText: FormStaticData.passwordConfirm.labelText,
              hintText: FormStaticData.passwordConfirm.hintText,
              helperText: ' ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            validationMessages: {
              ValidationMessage.mustMatch: (error) =>
                  '${FormStaticData.password.labelText} and ${FormStaticData.passwordConfirm.labelText} must match',
            }),
        const SizedBox(height: 8),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              // TODO: Key to focus on button
              key: const Key('submit-section-1'),
              // TODO: Password and password confim validation should happen here
              onPressed: form.control(FormStaticData.systemInfo.key).valid
                  ? () => onUpdateCurrentPageIndex(1)
                  : null,
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
