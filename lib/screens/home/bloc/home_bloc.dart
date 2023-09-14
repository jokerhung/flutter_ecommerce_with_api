import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/data/models/product_resp.dart';
import 'package:shop_app/data/repositories/category_api.dart';
import 'package:shop_app/data/repositories/product_api.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.productApi, this.categoryApi) : super(HomeInitial()) {
    on<LoadDataEvent>(_loadDataEvent);
  }

  final ProductApi productApi;
  final CategoryApi categoryApi;

  Future<void> _loadDataEvent(
      LoadDataEvent event, Emitter<HomeState> emit) async {
    print("LOG_HomeBloc_loadDataEvent(): start");
    try {
      // change loading state
      emit(state.copyWith(isLoading: true, errorMessage: ""));
      // call api
      final respList = await Future.wait([
        productApi.getAll(),
        categoryApi.getAll()
      ]);
      emit(state.copyWith(listProduct: respList[0] as List<ProductResp>, listCategories: respList[1] as List<String>, isLoading: false));
    } catch (e) {
      print("LOG_HomeBloc_loadDataEvent(): exception = " + e.toString());
      emit(state.copyWith(listProduct: [], listCategories: [], isLoading: false, errorMessage: e.toString()));
    }
  }
}
