// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsRepositoryHash() =>
    r'acec6d20e244441b52ebb1484553bcf2aecc3e7d';

/// See also [settingsRepository].
@ProviderFor(settingsRepository)
final settingsRepositoryProvider =
    AutoDisposeProvider<SettingsRepository>.internal(
      settingsRepository,
      name: r'settingsRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$settingsRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SettingsRepositoryRef = AutoDisposeProviderRef<SettingsRepository>;
String _$defaultPresetControllerHash() =>
    r'e53fa61c436b2d7b357245a2e9a8660bd2cc5743';

/// See also [DefaultPresetController].
@ProviderFor(DefaultPresetController)
final defaultPresetControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      DefaultPresetController,
      ConversionPreset
    >.internal(
      DefaultPresetController.new,
      name: r'defaultPresetControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$defaultPresetControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DefaultPresetController = AutoDisposeAsyncNotifier<ConversionPreset>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
