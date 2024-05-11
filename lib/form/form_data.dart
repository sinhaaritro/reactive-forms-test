import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_reactive_forms/data/user.dart';

part '../form_data.g.dart';

class FormField {
  final String key;
  final String field;
  final String labelText;
  final String hintText;

  FormField(
      {required this.key, String? field, String? labelText, String? hintText})
      : field = field ?? key,
        labelText = labelText ?? key,
        hintText = hintText ?? labelText ?? key;
}

class FormStaticData {
  static FormField systemInfo = FormField(key: 'systemInfo');
  static FormField userName = FormField(
      key: 'userName',
      field: '${FormStaticData.systemInfo.field}.userName',
      hintText: 'Enter username',
      labelText: 'Username');
  static FormField email = FormField(
      key: 'email',
      field: '${FormStaticData.systemInfo.field}.email',
      hintText: 'Enter email',
      labelText: 'Email');
  static FormField password = FormField(
      key: 'password',
      field: '${FormStaticData.systemInfo.field}.password',
      hintText: 'Enter password',
      labelText: 'Password');
  static FormField passwordConfirm = FormField(
      key: 'passwordConfirm',
      field: '${FormStaticData.systemInfo.field}.passwordConfirm',
      hintText: 'Enter password again',
      labelText: 'Confirm Password');

  static FormField personnelInfo = FormField(key: 'personnelInfo');
  static FormField gender = FormField(
      key: 'gender', field: '${FormStaticData.personnelInfo.field}.gender');
  static FormField genderName = FormField(
      key: 'genderName',
      field: '${FormStaticData.personnelInfo.field}.genderName',
      hintText: 'Enter Gender Name',
      labelText: 'Enter Gender Name');
  static FormField dateOfBirth = FormField(
      key: 'dateOfBirth',
      field: '${FormStaticData.personnelInfo.field}.dateOfBirth',
      hintText: 'YYYY-MM-DD',
      labelText: 'Enter Date of Birth');

  static FormField contactInfo = FormField(key: 'contactInfo');
  static FormField finalCheck = FormField(key: 'finalCheck');
  static FormField acceptTerms = FormField(
      key: 'acceptTerms',
      field: '${FormStaticData.finalCheck.field}.acceptTerms');
  static const String firstNameKey = 'firstName';
  static const String lastNameKey = 'lastName';
  static const String email2phoneKey = 'email2phone';
}

@riverpod
class FormData extends _$FormData {
  @override
  FormGroup build({String? email}) {
    // // Forced Delay to make sure the call happens. Shouldnt be a problem when
    // // we are dealing with actual data with Async Call
    // if (email!=null)
    // Future.delayed(const Duration(milliseconds: 1), () async => _loadData(email:email));
    return FormGroup(
      {
        FormStaticData.systemInfo.key: FormGroup({
          FormStaticData.userName.key: FormControl<String>(
              // validators: [
              //   Validators.required,
              //   Validators.minLength(3),
              // ],
              ),
          FormStaticData.email.key: FormControl<String>(
              // validators: [
              //   Validators.required,
              //   Validators.email,
              // ],
              // asyncValidators: [UniqueEmailAsyncValidator()],
              // asyncValidatorsDebounceTime: 1000,
              ),
          FormStaticData.password.key: FormControl<String>(
              // validators: [
              //   Validators.required,
              //   Validators.minLength(2),
              // ],
              ),
          FormStaticData.passwordConfirm.key: FormControl<String>(),
        }),
        FormStaticData.personnelInfo.key: FormGroup({
          FormStaticData.gender.key: FormControl<Gender>(
              // validators: [
              //   Validators.required,
              // ],
              ),
          FormStaticData.genderName.key: FormControl<String>(
              // disabled: true,
              // validators: [
              //   Validators.required,
              // ],
              ),
          FormStaticData.dateOfBirth.key: FormControl<DateTime>(
            validators: [
              Validators.required,
            ],
          ),
          'date': FormControl<DateTime>(
            validators: [
              Validators.required,
            ],
          ),
        }),
        FormStaticData.contactInfo.key: FormGroup({}),
        FormStaticData.finalCheck.key: FormGroup({
          FormStaticData.acceptTerms.key: FormControl<bool>(
              // validators: [Validators.required],
              ),
        }),
        FormStaticData.email2phoneKey: FormControl<String>(
            // validators: [
            //   Validators.composeOR(
            //     [
            //       Validators.email,
            //       Validators.pattern(r'/\d/g'),
            //     ],
            //   )
            // ],
            ),
      },
      // validators: [
      //   Validators.mustMatch(FormStaticData.password.field,
      //       FormStaticData.passwordConfirm.field),
      // ],
    );
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
