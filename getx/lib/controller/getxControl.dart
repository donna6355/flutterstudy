// ignore_for_file: file_names, unused_import, avoid_print

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  int num = 0;
  double aniWidth = 100;
  double aniHeight = 100;
  bool overlayLoading = false;
  String inputText = '';

  final ScrollController scrollctrl = ScrollController();
  List<String> items = [];
  bool loading = false;
  bool allLoaded = false;

  void updateInputText(String text) {
    inputText = text;
    update();
  }

  void addScrollListner() {
    scrollctrl.addListener(() {
      if (scrollctrl.position.pixels >= scrollctrl.position.maxScrollExtent &&
          !loading) mockfecth();
    });
  }

  Future<void> updateOverlayLoader() async {
    overlayLoading = true;
    update();
    await Future.delayed(
      const Duration(seconds: 5),
    );

    overlayLoading = false;
    update();
  }

  Future<void> mockfecth() async {
    if (allLoaded) return;

    loading = true;

    await Future.delayed(const Duration(seconds: 2));
    List<String> newData = items.length >= 60
        ? []
        : List.generate(20, (index) => 'List Item ${index + items.length}');
    if (newData.isNotEmpty) items.addAll(newData);

    loading = false;
    allLoaded = newData.isEmpty;
  }

  increment() {
    num++;
    update();
  }

  activateAni() {
    aniWidth == 300 ? aniWidth = 100 : aniWidth = 300;
    aniHeight == 300 ? aniHeight = 100 : aniHeight = 300;
    update();
  }
}

class User {
  int id = 0;
  String name = 'Annonymous';

  User({required this.id, required this.name});
}

class ReactiveCont extends GetxController {
  // observable takes more memory
  RxInt count1 = 0.obs;
  var count2 = 0.obs;
  var mode = 'original'.obs;
  var user = User(id: 1, name: 'Isaac').obs;
  var sample = [2, 4, 5, 3, 57, 5, 8, 3, 9, 1, 0].obs;

  @override
  void onInit() {
    super.onInit();
    //every time
    ever(count1, (_) {
      print('ever ever');
    });

    //one time only
    once(count1, (_) {
      print('once');
    });

    //delayed
    debounce(
      count1,
      (_) {
        print('debounce');
      },
      time: const Duration(
        seconds: 10,
      ),
    );
  }

  get reverse => sample.reversed.toList();
  get double => sample.map((element) => element * 2).toList();

  // get shuffle => sample.shuffle();
  get even => sample.where((i) => i % 2 == 0).toList();
  get sum => count1.value + count2.value;

  sort() {
    sample.sort();
  }

  sortDescend() {
    sample.sort((b, a) => a.compareTo(b));
    //return 1,0,-1 according to comparison;
    //ascending (a,b) descending (b,a)
  }

  shuffle() {
    sample.shuffle();
  }

  change({required int id, required String name}) {
    //to change custom class obs
    user.update((val) {
      val?.name = name;
      val?.id = id;
    });
  }
}

class CityModel {
  CityModel({
    required this.abbreviation,
    required this.name,
  });

  String abbreviation;
  String name;

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
        abbreviation: json["sigla"],
        name: json["nome"],
      );

  static List<CityModel> listFromJson(list) =>
      List<CityModel>.from(list.map((x) => CityModel.fromJson(x)));
}

class CityController extends GetxController with StateMixin<List<CityModel>> {
  final CityProvider cityProvider;
  CityController({required this.cityProvider});

  @override
  void onInit() {
    findAllCities();
    super.onInit();
  }

  void findAllCities() {
    cityProvider.getCity().then((result) {
      List<CityModel> data = result.body!;
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void insertCity() {
    const body = {'nome': 'joao', 'idade': 47};

    cityProvider.postCity(body).then((result) {
      print(result.body!.abbreviation);
      print(result.body!.name);
    });
  }
}

class CityProvider extends GetConnect {
  @override
  void onInit() {
    // All request will pass to jsonEncode so CasesModel.fromJson()
    httpClient.defaultDecoder = CityModel.listFromJson;
    httpClient.addRequestModifier<Object?>((request) {
      request.headers['Authorization'] = 'Bearer sdfsdfgsdfsdsdf12345678';
      return request;
    });
  }

  Future<Response<List<CityModel>>> getCity() => get<List<CityModel>>(
      'https://servicodados.ibge.gov.br/api/v1/localidades/estados');

  Future<Response<CityModel>> postCity(body) =>
      post<CityModel>('http://192.168.0.101:3000/items', body,
          decoder: (obj) => CityModel.fromJson(obj));
}
