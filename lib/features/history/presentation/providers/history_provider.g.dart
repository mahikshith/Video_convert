// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$historyRepositoryHash() => r'182e9da82d121feed298b8272eafddb2eda3f9ae';

/// See also [historyRepository].
@ProviderFor(historyRepository)
final historyRepositoryProvider =
    AutoDisposeProvider<HistoryRepository>.internal(
      historyRepository,
      name: r'historyRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$historyRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HistoryRepositoryRef = AutoDisposeProviderRef<HistoryRepository>;
String _$historyControllerHash() => r'c67643caf01eb2f27e1c927542b7f70331c5b954';

/// See also [HistoryController].
@ProviderFor(HistoryController)
final historyControllerProvider =
    AutoDisposeAsyncNotifierProvider<
      HistoryController,
      List<ConversionHistoryEntry>
    >.internal(
      HistoryController.new,
      name: r'historyControllerProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$historyControllerHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HistoryController =
    AutoDisposeAsyncNotifier<List<ConversionHistoryEntry>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
