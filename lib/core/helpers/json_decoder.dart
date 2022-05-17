import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'failure.dart';

Either<dynamic, Failure> getResponseData(Response? response) {
  List<int> successStatusCode = [200, 201, 202];
  //if no response
  if (response == null) {
    return Right(Failure(message: "Network error."));
  } else {
    //if success status code
    if (successStatusCode.contains(response.statusCode)) {
      final jsonResponse = getJson(response);
      return jsonResponse.fold((l) => Left(l), (r) => Left({}));
    } else {
      //if failure statuscode, implementing try catch to check if json is obtained as response
      final jsonResponse = getJson(response);
      return jsonResponse.fold((l) => Right(Failure(message: "Fetch Failed")),
          (r) => Right(Failure(message: r.message)));
    }
  }
}

//json decoding
Either<dynamic, Failure> getJson(Response response) {
  try {
    return Left(response.body);
  } catch (e) {
    return Right(Failure(message: "Parsing Error"));
  }
}
