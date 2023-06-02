import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tasks/data/models/model.dart';
import 'package:tasks/data/models/verb.dart';

import '../models/verbs_list.dart';

Future<Either<String, Categories>> getCategories() async {
  try {
    Response response = await Dio()
        .get("https://backend.maharttafl.net/api/v2/programs?type=categories");

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonMap = response.data;
      Categories categories = Categories.fromJson(jsonMap);
      return Right(categories);
    } else {
      return Left('Status Error: ${response.statusCode}');
    }
  } catch (e) {
    return Left('Catch an Error: $e');
  }
}

Future<Either<String, List<VerbsList>>> fetchVerbs() async {
  try {
    Response response = await Dio().get(
      "https://backend.maharttafl.net/api/v2/programs/verbs/show/define",
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonVerbs = response.data['data'];
      List<VerbsList> verbs =
          jsonVerbs.map((jsonVerb) => VerbsList.fromJson(jsonVerb)).toList();
      return right(verbs);
    } else {
      return Left('Status Error: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Catch an Error: $e');
  }
}

Future<Either<String, ApiResponse>> getVerb({required int id}) async {
  try {
    Response response = await Dio()
        .get("https://backend.maharttafl.net/api/v2/programs/verbs/define/$id");

    if (response.statusCode == 200) {
      ApiResponse apiResponse = ApiResponse.fromJson(response.data);
      return Right(apiResponse);
    } else {
      return Left('Status Error: ${response.statusCode}');
    }
  } catch (e) {
    return Left('Catch an Error: $e');
  }
}
