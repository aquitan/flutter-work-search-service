part of 'search_bloc.dart';

class SearchEvent {}

class GetSearchedPublications extends SearchEvent {
  final String take;
  final String skip;

  GetSearchedPublications({required this.take, required this.skip});
}
