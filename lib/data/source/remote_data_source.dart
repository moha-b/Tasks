import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks/data/models/model.dart';

Future<Either<String, Categories>> getCategories() async {
  try {
    Response response = await Dio()
        .get("https://backend.maharttafl.net/api/v2/programs?type=categories");

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = response.data;
      Categories categories = Categories.fromJson(jsonMap);
      print(categories.data.map((e) => e.id));
      return Right(categories);
    } else {
      return Left('Status Error: ${response.statusCode}');
    }
  } catch (e) {
    return Left('Catch an Error: $e');
  }
}
