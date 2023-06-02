import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/verbs_list.dart';
import '../../../data/source/remote_data_source.dart';

part 'verb_event.dart';
part 'verb_state.dart';

class VerbBloc extends Bloc<VerbEvent, VerbState> {
  VerbBloc() : super(VerbLoading()) {
    on<VerbEvent>((event, emit) async {
      final result = await fetchVerbs();
      result.fold(
          (l) => emit(VerbError()), (verb) => emit(VerbLoaded(verb: verb)));
    });
  }
}
