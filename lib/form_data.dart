import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'form_data.g.dart';

@riverpod
class FormData extends _$FormData {
  @override
  FormGroup build({String? email}) {
    // // Forced Delay to make sure the call happens. Shouldnt be a problem when
    // // we are dealing with actual data with Async Call
    // if (email!=null)
    // Future.delayed(const Duration(milliseconds: 1), () async => _loadData(email:email));
    return FormGroup({
      'name': FormControl<String>(),
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

  // FutureOr<void> _loadData({String? email}) async {
  // }

  // void resetForm({String? email}) {
  //   _loadData(email:email);
  // }

  // FutureOr<void> submitForm() async {
  //   try {
  //     // TODO(AS): FINAL VALIDATION
  //     // Validate
  //     // if (false){
  //     // state = FormStateReady();
  //     // }
  // }
}
