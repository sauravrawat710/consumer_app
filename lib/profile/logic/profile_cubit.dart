import 'package:bloc/bloc.dart';
import 'package:consumer_app/core/datamodel/profile.dart';
import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'package:consumer_app/core/utlis/failure.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final DataBaseService _db = GetIt.instance.get<DataBaseService>();

  ProfileCubit() : super(const ProfileState.loading());

  void getProfileDetails(String profileID) async {
    emit(ProfileState.loading());
    print("ok");
    await Future.delayed(Duration(seconds: 2));
    print("ok here");
    Either<Failure, Profile> result = await _db.getProfile(profileID);
    result.fold((left) {
      emit(ProfileState.error(failure: left));
    }, (right) {
      print("ok got in");
      emit(ProfileState.ready(profile: right));
    });
  }
}
