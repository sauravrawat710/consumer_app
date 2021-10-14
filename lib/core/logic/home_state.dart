part of 'home_cubit.dart';

enum HomeStatus { loading, ready }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<Post> posts;
  final int catSelected;

  const HomeState(
      {this.status = HomeStatus.loading,
      this.posts = const [],
      this.catSelected = 0});

  HomeState newState({
    HomeStatus? newStatus,
    List<Post>? newPosts,
    int? newCatSel,
  }) {
    return HomeState(
        status: newStatus ?? this.status,
        posts: newPosts ?? this.posts,
        catSelected: newCatSel ?? this.catSelected);
  }

  @override
  List<Object> get props => [status, catSelected];
}
