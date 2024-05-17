import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form/form_data.dart';

class FormSection5 extends ConsumerWidget {
  const FormSection5({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: [
        ReactiveCheckboxListTile(
          key: Key(FormStaticData.acceptTerms.key),
          formControlName: FormStaticData.acceptTerms.fullName,
          title: const Text('Accept terms & conditions'),
        ),
        ReactiveStatusListenableBuilder(
          formControlName: FormStaticData.acceptTerms.fullName,
          builder: (context, control, child) {
            return control.invalid && (control.dirty || control.touched)
                ? const Text("required true")
                : Container();
          },
        ),
        const SizedBox(height: 8),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () {
                form.control(FormStaticData.acceptTerms.fullName).markAsDirty();

                // print(form.valid);
                // print(form.value);
                if (form.valid) {
                  const snackBar = SnackBar(
                    content: Text('Valid Form'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
