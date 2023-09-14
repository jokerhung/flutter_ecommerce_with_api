part of 'home_bloc.dart';

class HomeState {
  final List<ProductResp> listProduct;
  final List<String> listCategories;
  final bool isLoading;
  final String errorMessage;

  HomeState({required this.listProduct, required this.listCategories, required this.isLoading, required this.errorMessage});

  HomeState copyWith({List<ProductResp>? listProduct, bool? isLoading, List<String>? listCategories, String? errorMessage}) {
    return HomeState(
        listProduct: listProduct ?? this.listProduct,
        isLoading: isLoading ?? this.isLoading,
        listCategories: listCategories ?? this.listCategories,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(listProduct: [], listCategories: [], isLoading: false, errorMessage: "");
}
