import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/data/source/remote_data_source.dart';

import '../../../data/models/model.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesLoading()) {
    on<CategoriesEvent>((event, emit) async {
      final result = await getCategories();
      result.fold((l) => emit(CategoriesError()),
          (categories) => emit(CategoriesLoaded(categories: categories)));
    });
  }
}
