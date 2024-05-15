import 'package:reactive_forms/reactive_forms.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:test_reactive_forms/data/location.dart';

part 'form_data.g.dart';

class FormFieldGroup {
  final String key;
  final String name;

  FormFieldGroup({required this.key, String? name}) : name = name ?? key;
}

class FormField<T> {
  final String key;
  final String name;
  final String labelText;
  final String hintText;
  final FormControl<T> control;

  FormField({
    required this.key,
    required this.control,
    String? name,
    String? labelText,
    String? hintText,
  })  : name = name ?? key,
        labelText = labelText ?? key,
        hintText = hintText ?? labelText ?? key;
}

class FormStaticData {
  // System Info
  static FormFieldGroup systemInfo = FormFieldGroup(key: 'systemInfo');
  static FormField<String> userName = FormField(
      key: 'userName',
      name: '${FormStaticData.systemInfo.name}.userName',
      control: FormControl(
          // validators: [
          //   Validators.required,
          //   Validators.minLength(3),
          // ],
          ),
      hintText: 'Enter username',
      labelText: 'Username');
  static FormField<String> email = FormField(
      key: 'email',
      name: '${FormStaticData.systemInfo.name}.email',
      control: FormControl<String>(
          // validators: [
          //   Validators.required,
          //   Validators.email,
          // ],
          // asyncValidators: [UniqueEmailAsyncValidator()],
          // asyncValidatorsDebounceTime: 1000,
          ),
      hintText: 'Enter email',
      labelText: 'Email');
  static FormField<String> password = FormField(
      key: 'password',
      name: '${FormStaticData.systemInfo.name}.password',
      control: FormControl<String>(
          // validators: [
          //   Validators.required,
          //   Validators.minLength(2),
          // ],
          ),
      hintText: 'Enter password',
      labelText: 'Password');
  static FormField<String> passwordConfirm = FormField(
      key: 'passwordConfirm',
      control: FormControl<String>(),
      name: '${FormStaticData.systemInfo.name}.passwordConfirm',
      hintText: 'Enter password again',
      labelText: 'Confirm Password');

  // Personal Info
  static FormFieldGroup personnelInfo = FormFieldGroup(key: 'personnelInfo');
  static FormField<String> gender = FormField(
      key: 'gender',
      name: '${FormStaticData.personnelInfo.name}.gender',
      control: FormControl<String>(
          // validators: [
          //   Validators.required,
          // ],
          ));
  static FormField<String> genderName = FormField(
      key: 'genderName',
      name: '${FormStaticData.personnelInfo.name}.genderName',
      control: FormControl<String>(
          // disabled: true,
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'Enter Gender Name',
      labelText: 'Enter Gender Name');
  static FormField<DateTime> dateOfBirth = FormField(
      key: 'dateOfBirth',
      name: '${FormStaticData.personnelInfo.name}.dateOfBirth',
      control: FormControl<DateTime>(
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'YYYY-MM-DD',
      labelText: 'Enter Date of Birth');
  static FormField<Country> currentCountry = FormField(
      key: 'currentCountry',
      name: '${FormStaticData.personnelInfo.name}.currentCountry',
      control: FormControl<Country>(
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'Enter Current Country',
      labelText: 'Enter Current Country');
  static FormField<CountryState> currentState = FormField(
      key: 'currentState',
      name: '${FormStaticData.personnelInfo.name}.currentState',
      control: FormControl<CountryState>(
          // validators: [
          //   Validators.required,
          // ],
          ),
      hintText: 'Enter Current State',
      labelText: 'Enter Current State');
  static FormField<String> currentAddress1 = FormField(
      key: 'currentAddress1',
      name: '${FormStaticData.personnelInfo.name}.currentAddress1',
      control: FormControl<String>(),
      hintText: 'Enter Address Line 1',
      labelText: 'Enter Address Line 1');
  static FormField<String> currentAddress2 = FormField(
      key: 'currentAddress2',
      name: '${FormStaticData.personnelInfo.name}.currentAddress2',
      control: FormControl<String>(),
      hintText: 'Enter Address Line 2',
      labelText: 'Enter Address Line 2');
  static FormField<int> currentPincode = FormField(
      key: 'currentPincode',
      name: '${FormStaticData.personnelInfo.name}.currentPincode',
      control: FormControl<int>(),
      hintText: 'Enter current Pincode',
      labelText: 'Enter current Pincode');

  // Contact Info
  static FormFieldGroup contactInfo = FormFieldGroup(key: 'contactInfo');
  static FormField<String> emailOrPhone = FormField(
      key: 'emailOrPhone',
      name: '${FormStaticData.contactInfo.name}.emailOrPhone',
      control: FormControl<String>(
          // validators: [
          //   Validators.composeOR(
          //     [
          //       Validators.email,
          //       Validators.pattern(r'/\d/g'),
          //     ],
          //   )
          ),
      hintText: 'Enter alternate email or phone number',
      labelText: 'Enter alternate email or phone number');

  // Family Info
  static FormFieldGroup familyInfo = FormFieldGroup(key: 'familyInfo');

  // Final Check
  static FormFieldGroup finalCheck = FormFieldGroup(key: 'finalCheck');
  static FormField acceptTerms = FormField(
      key: 'acceptTerms',
      name: '${FormStaticData.finalCheck.name}.acceptTerms',
      control: FormControl<bool>(
          // validators: [Validators.required],
          ));
  static const String firstNameKey = 'firstName';
  static const String lastNameKey = 'lastName';
}

@riverpod
class FormData extends _$FormData {
  @override
  FormGroup build({String? email}) {
    // // Forced Delay to make sure the call happens. Shouldnt be a problem when
    // // we are dealing with actual data with Async Call
    if (email != null) {
      Future.delayed(
          const Duration(milliseconds: 1), () async => _loadData(email: email));
    }
    return FormGroup(
      {
        FormStaticData.systemInfo.key: FormGroup({
          FormStaticData.userName.key: FormStaticData.userName.control
            ..patchValue(null),
          FormStaticData.email.key: FormStaticData.email.control,
          FormStaticData.password.key: FormStaticData.password.control,
          FormStaticData.passwordConfirm.key:
              FormStaticData.passwordConfirm.control,
        }),
        FormStaticData.personnelInfo.key: FormGroup({
          FormStaticData.gender.key: FormStaticData.gender.control,
          FormStaticData.genderName.key: FormStaticData.genderName.control,
          FormStaticData.dateOfBirth.key: FormStaticData.dateOfBirth.control,
          'date': FormControl<DateTime>(
              // validators: [
              //   Validators.required,
              // ],
              ),
          FormStaticData.currentCountry.key:
              FormStaticData.currentCountry.control,
          FormStaticData.currentState.key: FormStaticData.currentState.control,
          FormStaticData.currentAddress1.key:
              FormStaticData.currentAddress1.control,
          FormStaticData.currentAddress2.key:
              FormStaticData.currentAddress2.control,
          FormStaticData.currentPincode.key:
              FormStaticData.currentPincode.control,
        }),
        FormStaticData.contactInfo.key: FormGroup({
          FormStaticData.emailOrPhone.key: FormArray<String>(
              [FormStaticData.emailOrPhone.control..patchValue('a@g.cm')]),
        }),
        FormStaticData.finalCheck.key: FormGroup({
          FormStaticData.acceptTerms.key: FormStaticData.acceptTerms.control,
        }),
      },
      // validators: [
      //   Validators.mustMatch(FormStaticData.password.field,
      //       FormStaticData.passwordConfirm.field),
      // ],
    );
  }

  FutureOr<void> _loadData({String? email}) async {
    state = FormGroup({});
  }

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
