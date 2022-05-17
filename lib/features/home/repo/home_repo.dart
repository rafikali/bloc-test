import 'dart:convert';

import 'package:bloctest/core/constants/api_endpoints.dart';
import 'package:bloctest/core/helpers/json_decoder.dart';
import 'package:bloctest/core/network/base_client.dart';
import 'package:bloctest/features/home/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../core/helpers/failure.dart';

class HomeRepo {
  final BlocBaseClient _client;
  HomeRepo(this._client);

  Future<Either<List<UserModel>, Failure>> fetchUsers() async {
    http.Response? res = await _client.getRequest(
        path: ApiEndpoints.fetchUsers, shouldCache: true);
    final decodedResponse = getResponseData(res);
    return decodedResponse.fold((l) {
      List<UserModel> users = List.empty(growable: true);
      var f = jsonDecode(l);
      f.forEach((element) {
        users.add(UserModel.fromJson(element));
      });
      return Left(users);
    }, (r) => Right(r));
  }
}
