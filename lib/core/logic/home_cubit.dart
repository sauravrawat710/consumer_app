import 'package:bloc/bloc.dart';
import 'package:consumer_app/core/datamodel/post.dart';
import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'package:consumer_app/core/utlis/global.dart';
import 'package:get_it/get_it.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Post> allPostsList;
  final DataBaseService _dbService = GetIt.instance.get<DataBaseService>();

  HomeCubit()
      : this.allPostsList = [],
        super(const HomeState()) {
    initializeCubit();
  }

  void initializeCubit() async {
    allPostsList = await _dbService.getAllPosts();
    emit(state.newState(newPosts: allPostsList, newStatus: HomeStatus.ready));
  }

  void changeSelectedCat(int Catindex) {
    emit(state.newState(newStatus: HomeStatus.loading));
    List<Post> tempPostList;
    if (Catindex == 0) {
      tempPostList = allPostsList;
    } else {
      tempPostList = allPostsList
          .where((post) => post.cat == postCat.values[Catindex])
          .toList();
    }
    emit(state.newState(
        newStatus: HomeStatus.ready,
        newPosts: tempPostList,
        newCatSel: Catindex));
  }
}
