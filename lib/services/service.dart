import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:base_flutter_framework/utils/shared.dart';
import 'package:dio/dio.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:no_context_navigation/no_context_navigation.dart';
import 'package:share/share.dart';
// import 'check_version.dart';

class ServiceCommon {
  static ServiceCommon? instance;
  final String severUrl = "http://150.95.113.87:3002/api/v1";

  final String modeLoginGoogle = "/players/loginFacebookGoogle";
  final String modeCreateMatch = "/matches/insertMatch";
  final String modeGetChanelMatch = "/matches/getDetailMatch";
  final String modeGetInvitations = "/invitations/getInvitations";

  // final String modeArticle

  static ServiceCommon? getInstance() {
    if (instance == null) instance = new ServiceCommon();
    return instance;
  }

  Future<Response?> getHttp(
      {Map<String, dynamic>? param,
      required String api,
      required String host,
      bool? cancelRequest}) async {
    Dio dio = getApiClient();
    // await Dio(options)?.clear();
    jsonEncode(param);
    Response response = await dio.get(
      host + api,
      queryParameters: param,
    );
    return response;
  }

  Future<Response?> postHttp({
    Map<String, dynamic>? param,
    required String api,
    required String host,
  }) async {
    jsonEncode(param);
    Dio dio = getApiClient();
    Response response = await dio.post(host + api, data: param);
    return response;
  }

  Future<Response?> put({
    Map<String, dynamic>? param,
    required String api,
    required String host,
  }) async {
    Dio dio = getApiClient();
    jsonEncode(param);
    Response response = await dio.put(host + api, data: param);

    return response;
  }

  Future<Response?> patch({
    Map<String, dynamic>? param,
    required String api,
    required String host,
  }) async {
    Dio dio = getApiClient();
    Response response = await dio.patch(host + api, data: param);
    print(response);
    return response;
  }

  Future<Response?> deleteHttp(
      {Map<String, dynamic>? param,
      required String host,
      required String api}) async {
    Dio dio = getApiClient();
    Response response = await dio.delete(host + api, data: param);
    return response;
  }

  Future<Response?> patchHttp(
      {required Map<String, dynamic> param,
      required String host,
      required String api}) async {
    Dio dio = getApiClient();
    Response response = await dio.patch(host + api, data: param);
    return response;
  }

  Future<Response?> upLoadImageFile({
    required Map<String, dynamic>? param,
    required File file,
    required String fileName,
  }) async {
    ImageProperties properties =
        await FlutterNativeImage.getImageProperties(file.path);
    File compressedFile = await FlutterNativeImage.compressImage(file.path,
        quality: 90,
        targetWidth: 1200,
        targetHeight: (properties.height! * 1200 / properties.width!).round());

    FormData data = FormData.fromMap({
      "file":
          await MultipartFile.fromFile(compressedFile.path, filename: fileName),
    });

    Dio dio = getApiClient();
    Response response =
        await dio.post("url_upload_image", queryParameters: param, data: data);

    return response;
  }

  BaseOptions _baseOptionsFromToken() {
    return BaseOptions(
        receiveDataWhenStatusError: true,
        connectTimeout: 600000, // 60 seconds
        receiveTimeout: 600000, // 60 seconds

        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': "Bearer " +
              (Shared.getInstance().userModel != null
                  ? Shared.getInstance().userModel!.token ?? ""
                  : "")
        });
  }

  Dio getApiClient() {
    Dio().clear();
    Dio().close();
    Dio dio = new Dio(_baseOptionsFromToken());
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) {
          request.headers['Accept'] = "application/json";
          request.headers['Content-type'] = "application/json";
          request.headers['x-access-token'] =
              Shared.getInstance().userModel != null
                  ? Shared.getInstance().userModel!.token
                  : "";
          return handler.next(request);
        },
        onError: (e, handler) async {
          if (e.response?.statusCode == 409) {
            final opts = new Options(
                method: e.requestOptions.method,
                headers: e.requestOptions.headers);
            await dio
                .post("request_token_api", options: opts)
                .then((value) async {
              if (value.statusCode == 200 || value.statusCode == 201) {
                //get new tokens ...

                Shared.getInstance().userModel!.token = value.data["token"];
                await Shared.getInstance()
                    .saveUser(user: Shared.getInstance().userModel!);
                //set bearer

                final cloneReq = await dio.request(e.requestOptions.path,
                    options: opts,
                    data: e.requestOptions.data,
                    queryParameters: e.requestOptions.queryParameters);

                return handler.resolve(cloneReq);
              }
            });
          } else if (e.response?.statusCode == 401) {
            await Shared.getInstance().deleteUser();

            navService.pushNamed("/");
          }
        },
      ),
    );

    return dio;
  }
}
