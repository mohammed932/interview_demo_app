import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final String message;
  const Failure({required this.message});
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});
  @override
  List<Object?> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});
  @override
  List<Object?> get props => [message];
}
