// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form/form_data.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formDataHash() => r'bff9f1eb21a23d7c8ebdf1ac65e50e2df81e9b76';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$FormData extends BuildlessAutoDisposeNotifier<FormGroup> {
  late final String? email;

  FormGroup build({
    String? email,
  });
}

/// See also [FormData].
@ProviderFor(FormData)
const formDataProvider = FormDataFamily();

/// See also [FormData].
class FormDataFamily extends Family<FormGroup> {
  /// See also [FormData].
  const FormDataFamily();

  /// See also [FormData].
  FormDataProvider call({
    String? email,
  }) {
    return FormDataProvider(
      email: email,
    );
  }

  @override
  FormDataProvider getProviderOverride(
    covariant FormDataProvider provider,
  ) {
    return call(
      email: provider.email,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formDataProvider';
}

/// See also [FormData].
class FormDataProvider
    extends AutoDisposeNotifierProviderImpl<FormData, FormGroup> {
  /// See also [FormData].
  FormDataProvider({
    String? email,
  }) : this._internal(
          () => FormData()..email = email,
          from: formDataProvider,
          name: r'formDataProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formDataHash,
          dependencies: FormDataFamily._dependencies,
          allTransitiveDependencies: FormDataFamily._allTransitiveDependencies,
          email: email,
        );

  FormDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.email,
  }) : super.internal();

  final String? email;

  @override
  FormGroup runNotifierBuild(
    covariant FormData notifier,
  ) {
    return notifier.build(
      email: email,
    );
  }

  @override
  Override overrideWith(FormData Function() create) {
    return ProviderOverride(
      origin: this,
      override: FormDataProvider._internal(
        () => create()..email = email,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        email: email,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<FormData, FormGroup> createElement() {
    return _FormDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormDataProvider && other.email == email;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, email.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FormDataRef on AutoDisposeNotifierProviderRef<FormGroup> {
  /// The parameter `email` of this provider.
  String? get email;
}

class _FormDataProviderElement
    extends AutoDisposeNotifierProviderElement<FormData, FormGroup>
    with FormDataRef {
  _FormDataProviderElement(super.provider);

  @override
  String? get email => (origin as FormDataProvider).email;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
