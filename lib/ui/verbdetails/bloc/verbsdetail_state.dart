part of 'verbsdetail_bloc.dart';

abstract class VerbDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class VerbStateLoading extends VerbDetailState {
  VerbStateLoading();
}

class VerbStateLoaded extends VerbDetailState {
  final ApiResponse verb;

  VerbStateLoaded({
    required this.verb,
  });
}
