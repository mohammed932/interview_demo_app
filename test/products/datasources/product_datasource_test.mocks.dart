// Mocks generated by Mockito 5.4.2 from annotations
// in interview_test/test/products/datasources/product_datasource_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:interview_test/core/network/network_interface.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [BaseNetwork].
///
/// See the documentation for Mockito's code generation for more information.
class MockBaseNetwork extends _i1.Mock implements _i2.BaseNetwork {
  MockBaseNetwork() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> get(String? endPoint) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [endPoint],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<dynamic> post(String? endPoint) => (super.noSuchMethod(
        Invocation.method(
          #post,
          [endPoint],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<dynamic> delete(String? endPoint) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [endPoint],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);

  @override
  _i3.Future<dynamic> update(String? endPoint) => (super.noSuchMethod(
        Invocation.method(
          #update,
          [endPoint],
        ),
        returnValue: _i3.Future<dynamic>.value(),
      ) as _i3.Future<dynamic>);
}
