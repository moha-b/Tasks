part of 'verb_bloc.dart';

abstract class VerbState extends Equatable {
  const VerbState();
}

class VerbLoading extends VerbState {
  @override
  List<Object> get props => [];
}

class VerbLoaded extends VerbState {
  final List<VerbsList> verb;

  const VerbLoaded({required this.verb});

  @override
  List<Object> get props => [verb];
}

class VerbError extends VerbState {
  @override
  List<Object> get props => [];
}
