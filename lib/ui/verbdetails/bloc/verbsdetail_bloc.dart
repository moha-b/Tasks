import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks/data/models/verb.dart';
import 'package:tasks/data/source/remote_data_source.dart';

part 'verbsdetail_event.dart';
part 'verbsdetail_state.dart';

class VerbsDetailBloc extends Bloc<VerbDetailEvent, VerbDetailState> {
  VerbsDetailBloc() : super(VerbStateLoading()) {
    on<VerbDetailEvent>((event, emit) async {
      final result = await getVerb(id: event.verbId);
      result.fold((l) => emit(VerbStateLoading()),
          (result) => emit(VerbStateLoaded(result: result)));
    });
  }
}
