import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/data/models/model.dart';
import 'package:tasks/ui/home/bloc/categories_bloc.dart';

import '../../../core/resources/colors.dart';

class Sections extends StatelessWidget {
  const Sections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CategoriesBloc()..add(const CategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesLoading) {
                print(state.toString());
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is CategoriesLoaded) {
                print(state.toString());
                return buildCategories(
                    size: size, categories: state.categories);
              } else {
                print(state.toString());
                return Text("Something won't wrong");
              }
            },
          ),
        ),
      ),
    );
  }

  GridView buildCategories(
      {required Size size, required Categories categories}) {
    return GridView.builder(
        itemCount: categories.data.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            crossAxisCount: 4,
            childAspectRatio: 1.3),
        itemBuilder: (context, index) {
          int reversedIndex = categories.data.length - 1 - index;
          return buildCategoryCard(
              size: size, categories: categories, index: reversedIndex);
        });
  }

  ClipRRect buildCategoryCard(
      {required Size size,
      required Categories categories,
      required int index}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.047),
      child: Container(
        color: AppColors.categoriesBlueCard,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: categories.data[index].avatar,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(child: Text(categories.data[index].name)),
          ],
        ),
      ),
    );
  }
}
