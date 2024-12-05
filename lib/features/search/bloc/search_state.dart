part of 'search_bloc.dart';

class SearchState {}

final class SearchStateInitial extends SearchState {}

final class SearchStateLoading extends SearchState {}

final class SearchStateLoaded extends SearchState {
  final List<Order>? orders;

  SearchStateLoaded({required this.orders});
}
