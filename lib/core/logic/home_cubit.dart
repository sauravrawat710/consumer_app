import 'package:bloc/bloc.dart';
import 'package:consumer_app/core/datamodel/enduser.dart';
import 'package:consumer_app/core/datamodel/post.dart';
import 'package:consumer_app/core/datamodel/profile.dart';
import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'package:consumer_app/core/logic/repositry/storage_repo.dart';
import 'package:consumer_app/core/utlis/active_user.dart';
import 'package:consumer_app/core/utlis/failure.dart';
import 'package:consumer_app/core/utlis/global.dart';
import 'package:consumer_app/core/utlis/navigation_service.dart';
import 'package:consumer_app/profile/presentation/profile_screen.dart';
import 'package:cross_file/cross_file.dart';
import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Post> allPostsList;
  final DataBaseService _dbService = GetIt.instance.get<DataBaseService>();
  final NavigationService _nav = GetIt.instance.get<NavigationService>();
  ActiveUser? uu = GetIt.instance.get<ActiveUser>();
  final CloudStorageRepositry _csRepo =
      GetIt.instance.get<CloudStorageRepositry>();

  HomeCubit()
      : this.allPostsList = [],
        super(const HomeState()) {
    initializeCubit();
  }

  void initializeCubit() async {
    Either<Failure, List<Post>> temp = await _dbService.getAllPosts();
    temp.fold((Failure failure) => print("failure"), (List<Post> postss) async {
      allPostsList = postss;
      await Future.delayed(const Duration(seconds: 5));
      emit(state.copyWith(newPosts: allPostsList, newStatus: HomeStatus.ready));
    });
    print(_csRepo.storage
        .ref()
        .child("userDP/test_manual_upload.jpg")
        .getDownloadURL());
  }

  void changeSelectedCat(int Catindex) {
    emit(state.copyWith(newStatus: HomeStatus.loading));
    List<Post> tempPostList;
    if (Catindex == 0) {
      tempPostList = allPostsList;
    } else {
      tempPostList = allPostsList
          .where((post) => post.cat == postCat.values[Catindex - 1])
          .toList();
    }
    emit(state.copyWith(
        newStatus: HomeStatus.ready,
        newPosts: tempPostList,
        newCatSel: Catindex));
  }

  Future<void> FAB() async {
    //XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // await _dbService.addProfile(Profile(
    //   profileID:
    // ));
    print("success");
  }

  void openProfile(String profileID) {
    _nav.navigateTo(ProfileScreen.routeName, arguments: profileID);
  }
}
