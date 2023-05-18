import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/colors.dart';
import '../../../data/models/model.dart';

class CategoriesCard extends StatelessWidget {
  final Data data;
  const CategoriesCard({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(size.width * 0.047),
      child: Container(
        color: AppColors.categoriesBlueCard,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(child: Text(data.name)),
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: data.avatar,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
