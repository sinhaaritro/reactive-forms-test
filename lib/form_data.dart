import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_data.g.dart';

@riverpod
class FormData extends _$FormData {
  @override
  FormGroup build() {
    return FormGroup({
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
    }, validators: [
      Validators.mustMatch('password', 'passwordConfirm')
    ]);
  }
}
