import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form/date_time_value_accessor_custom.dart';
import 'package:test_reactive_forms/form/form_data.dart';

class FormSection4 extends ConsumerStatefulWidget {
  const FormSection4({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSection2State();
}

class _FormSection2State extends ConsumerState<FormSection4> {
  FormGroup get formGroup => widget.formGroup;
  void Function(int) get onUpdateCurrentPageIndex =>
      widget.onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ReactiveTextField(
          key: Key(FormStaticData.dateOfBirth.key),
          formControlName: FormStaticData.dateOfBirth.fullName,
          valueAccessor: DateTimeValueAccessorCustom(),
          decoration: InputDecoration(
            labelText: FormStaticData.dateOfBirth.labelText,
            hintText: FormStaticData.dateOfBirth.hintText,
            helperText: ' ',
            suffixIcon: ReactiveDatePicker(
              formControlName: FormStaticData.dateOfBirth.fullName,
              firstDate: DateTime(1985),
              lastDate: DateTime.now(),
              builder: (context, picker, child) {
                return IconButton(
                  onPressed: picker.showPicker,
                  icon: const Icon(Icons.calendar_today),
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 8),
        ReactiveSwitchListTile.adaptative(
          key: Key(FormStaticData.spouse.key),
          formControlName: 'spouse',
          title: Text(FormStaticData.spouse.labelText),
        ),
        const SizedBox(height: 8),
        ReactiveDatePicker<DateTime>(
          formControlName: FormStaticData.spouseBirth.fullName,
          firstDate: DateTime(1985),
          lastDate: DateTime(2030),
          builder: (context, picker, child) {
            Widget suffix = InkWell(
              onTap: () => picker.control.value = null,
              child: const Icon(Icons.clear),
            );

            if (picker.value == null) {
              suffix = const Icon(Icons.calendar_today);
            }

            return ReactiveTextField(
              onTap: (value) => picker.showPicker(),
              valueAccessor: DateTimeValueAccessor(),
              formControlName: FormStaticData.spouseBirth.fullName,
              readOnly: true,
              validationMessages: {
                ValidationMessage.required: (error) =>
                    'If Date of Birth must be present',
              },
              decoration: InputDecoration(
                labelText: FormStaticData.dateOfBirth.labelText,
                hintText: FormStaticData.dateOfBirth.hintText,
                helperText: ' ',
                suffixIcon: suffix,
              ),
            );
          },
        ),
        const SizedBox(height: 8.0),
        ReactiveSlider(
          key: Key(FormStaticData.numberOfChildren.key),
          formControlName: FormStaticData.numberOfChildren.fullName,
          max: 10,
          divisions: 10,
          labelBuilder: (double value) =>
              '${value.toStringAsFixed(2)} children',
        ),
        ReactiveValueListenableBuilder(
          formControlName: FormStaticData.numberOfChildren.fullName,
          builder: (context, control, child) {
            switch (control.value) {
              case null:
                return const Text("No children");
              case 1:
                return const Text("Number of child is 1");
              default:
                return Text("Number of children is ${control.value}");
            }
          },
        ),
        const SizedBox(height: 8.0),
        ReactiveTextField(
            key: Key(FormStaticData.ageOfChildren1.key),
            formControlName: FormStaticData.ageOfChildren1.fullName,
            textInputAction: TextInputAction.next,
            keyboardType: const TextInputType.numberWithOptions(),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              labelText: FormStaticData.ageOfChildren1.labelText,
              hintText: FormStaticData.ageOfChildren1.hintText,
              helperText: ' ',
            ),
            validationMessages: {
              ValidationMessage.number: (error) => 'Age must be positive',
            }),
        const SizedBox(height: 8.0),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () => onUpdateCurrentPageIndex(4),
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
