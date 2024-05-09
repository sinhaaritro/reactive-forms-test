import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form_data.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final form = FormGroup({
    'name': FormControl<String>(value: 'John Doe'),
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [Validators.minLength(8)]),
    'passwordConfirm': FormControl<String>(),
    'email2phone': FormControl<String>(validators: [
      Validators.composeOR([
        Validators.email,
        Validators.pattern(r'/\d/g'),
      ])
    ]),
    'dateOfBirth': FormControl<DateTime>(),
    'gender': FormControl<String>(),
    'card': FormControl<String>(
        validators: [Validators.pattern(r'^3[47][0-9]{13}$')]),
    'address': FormGroup({
      'street': FormControl<String>(validators: [Validators.required]),
      'city': FormControl<String>(validators: [Validators.required]),
      'zip': FormControl<String>(validators: [Validators.required]),
      'state': FormControl<String>(validators: [Validators.required]),
      'country': FormControl<String>(validators: [Validators.required]),
    })
  }, validators: [
    Validators.mustMatch('password', 'passwordConfirm')
  ]);

  void _printEnteredName() {
    print(form.control('name').value);
  }

  void _printForm() {
    print(form.value);
  }

  @override
  Widget build(BuildContext context) {
    FormGroup formGroup = ref.watch(formDataProvider());
    AbstractControl<dynamic> stateControl = form.control('address.state');
    stateControl.markAsDisabled();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: ReactiveForm(
        formGroup: formGroup,
        child: ListView(
          children: <Widget>[
            ReactiveTextField(
              key: const Key('name'),
              formControlName: 'name',
              textInputAction: TextInputAction.next,
              onSubmitted: (control) => form.focus('email'),
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
                  onPressed: formGroup.valid ? _printForm : null,
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _printForm();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.save),
      ),
    );
  }
}
