import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/data/location.dart';
import 'package:test_reactive_forms/data/user.dart';
import 'package:test_reactive_forms/form/form_data.dart';
import 'package:test_reactive_forms/form/pincode_formatter.dart';
import 'package:test_reactive_forms/form/pindoce_value_accessor.dart';

class FormSection2 extends ConsumerStatefulWidget {
  const FormSection2({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSection2State();
}

class _FormSection2State extends ConsumerState<FormSection2> {
  FormGroup get formGroup => widget.formGroup;
  void Function(int) get onUpdateCurrentPageIndex =>
      widget.onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.male.id),
          title: Text(Gender.male.name),
          value: Gender.male,
          formControlName: FormStaticData.gender.fullName,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.fullName)
              .markAsDisabled(),
        ),
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.female.id),
          title: Text(Gender.female.name),
          value: Gender.female,
          formControlName: FormStaticData.gender.fullName,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.fullName)
              .markAsDisabled(),
        ),
        ReactiveRadioListTile<Gender>(
          key: Key(Gender.others.id),
          title: Text(Gender.others.name),
          value: Gender.others,
          formControlName: FormStaticData.gender.fullName,
          onChanged: (control) => formGroup
              .control(FormStaticData.genderName.fullName)
              .markAsEnabled(),
        ),
        const SizedBox(height: 8),
        ReactiveTextField(
            key: Key(FormStaticData.genderName.key),
            formControlName: FormStaticData.genderName.fullName,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: FormStaticData.genderName.labelText,
              hintText: FormStaticData.genderName.hintText,
              helperText: ' ',
            ),
            validationMessages: {
              ValidationMessage.required: (error) =>
                  'If other is selected then the gender must not be empty',
            }),
        const SizedBox(height: 8),
        ReactiveDropdownField<Country>(
          formControlName: FormStaticData.currentCountry.fullName,
          decoration: InputDecoration(
            labelText: FormStaticData.currentCountry.labelText,
            hintText: FormStaticData.currentCountry.hintText,
            helperText: ' ',
          ),
          items: countries
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
          onChanged: (control) => setState(() => formGroup
              .control(FormStaticData.currentState.fullName)
              .value = null),
        ),
        const SizedBox(height: 8.0),
        ReactiveDropdownField<CountryState>(
          formControlName: FormStaticData.currentState.fullName,
          decoration: InputDecoration(
            labelText: FormStaticData.currentState.labelText,
            hintText: FormStaticData.currentState.hintText,
            helperText: ' ',
          ),
          items: states
              .where((e) {
                Country? selectedCountry = formGroup
                    .control(FormStaticData.currentCountry.fullName)
                    .value as Country?;
                return selectedCountry == null || e.country == selectedCountry;
              })
              .map((e) => DropdownMenuItem(value: e, child: Text(e.name)))
              .toList(),
        ),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.currentAddress1.key),
            formControlName: FormStaticData.currentAddress1.fullName,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.currentAddress2.fullName),
            decoration: InputDecoration(
              labelText: FormStaticData.currentAddress1.labelText,
              hintText: FormStaticData.currentAddress1.hintText,
              helperText: ' ',
            )),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.currentAddress2.key),
            formControlName: FormStaticData.currentAddress2.fullName,
            textInputAction: TextInputAction.next,
            onSubmitted: (control) =>
                formGroup.focus(FormStaticData.currentPincode.fullName),
            decoration: InputDecoration(
              labelText: FormStaticData.currentAddress2.labelText,
              hintText: FormStaticData.currentAddress2.hintText,
              helperText: ' ',
            )),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.currentPincode.key),
            formControlName: FormStaticData.currentPincode.fullName,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            valueAccessor: PincodeValueAccessor(),
            inputFormatters: [
              LengthLimitingTextInputFormatter(6 + (1 * 1)),
              PinCodeFormatter(separator: ' '),
            ],
            decoration: InputDecoration(
              labelText: FormStaticData.currentPincode.labelText,
              hintText: FormStaticData.currentPincode.hintText,
              helperText: ' ',
            )),
        const SizedBox(height: 8.0),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () => onUpdateCurrentPageIndex(2),
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
