part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
final class ProductsLoading extends ProductsState {}
final class ProductsSuccess extends ProductsState {}
final class ProductsError extends ProductsState {}
final class BannersLoading extends ProductsState {}
final class BannersSuccess extends ProductsState {}
final class BannersError extends ProductsState {}
