import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test_reactive_forms/form/form_data.dart';

class FormSection3 extends ConsumerStatefulWidget {
  const FormSection3({
    super.key,
    required this.formGroup,
    required this.onUpdateCurrentPageIndex,
  });

  final FormGroup formGroup;
  final void Function(int) onUpdateCurrentPageIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FormSection3State();
}

class _FormSection3State extends ConsumerState<FormSection3> {
  FormGroup get formGroup => widget.formGroup;
  void Function(int) get onUpdateCurrentPageIndex =>
      widget.onUpdateCurrentPageIndex;

  late FocusNode _textControllerFocusNode;
  late FocusNode _lastArrayFocusNode;
  late TextEditingController _textEditingController;
  late bool _isNewFieldReady;

  @override
  void initState() {
    super.initState();
    _isNewFieldReady = true;
    _textEditingController = TextEditingController();
    _textControllerFocusNode = FocusNode(debugLabel: 'dummyControl');
    _lastArrayFocusNode = FocusNode(debugLabel: 'lastItemOfArray');
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _textControllerFocusNode.dispose();
    _lastArrayFocusNode.dispose();
    super.dispose();
  }

  _addNewControlToArray(FormArray<String> formArray) {
    if (_isNewFieldReady == true) {
      formArray.add(FormControl<String>());
      Future.delayed(const Duration(milliseconds: 50), () {
        formArray.controls.last.value = _textEditingController.text;
        _textEditingController.text = '';
        _textControllerFocusNode.unfocus();
        _lastArrayFocusNode.requestFocus();
        _isNewFieldReady = true;
      });
    }
    _isNewFieldReady = false;
  }

  @override
  Widget build(BuildContext context) {
    final emailOrPhone = formGroup.control(FormStaticData.emailOrPhone.field)
        as FormArray<String>;

    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        ReactiveFormArray(
          formArray: emailOrPhone,
          builder: (BuildContext context, FormArray<String> formArray,
              Widget? child) {
            return Column(
              children: [
                for (final control in formArray.controls)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: ReactiveTextField<String>(
                      // key: const Key(control),
                      formControl: control as FormControl<String>,
                      focusNode: control == formArray.controls.last
                          ? _lastArrayFocusNode
                          : null,
                      decoration: InputDecoration(
                        labelText: FormStaticData.emailOrPhone.labelText,
                        hintText: FormStaticData.emailOrPhone.hintText,
                        helperText: ' ',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () => formArray.remove(control),
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 8.0),
                TextFormField(
                  key: const Key('blankTextFormField'),
                  focusNode: _textControllerFocusNode,
                  controller: _textEditingController,
                  onChanged: (value) => _addNewControlToArray(formArray),
                  decoration: InputDecoration(
                    labelText: FormStaticData.emailOrPhone.labelText,
                    hintText: FormStaticData.emailOrPhone.hintText,
                    helperText: ' ',
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 8.0),
        ReactiveFormConsumer(
          builder: (context, form, child) {
            return ElevatedButton(
              onPressed: () {
                print(form.valid);
                print(form.value);
                // onUpdateCurrentPageIndex(3);
              },
              child: const Text('Next Page'),
            );
          },
        ),
      ],
    );
  }
}
