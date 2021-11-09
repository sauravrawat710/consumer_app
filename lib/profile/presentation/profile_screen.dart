import 'package:carousel_slider/carousel_slider.dart';
import 'package:consumer_app/core/datamodel/profile.dart';
import 'package:consumer_app/core/utlis/failure.dart';
import 'package:consumer_app/profile/logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ProfileDetailCard extends StatelessWidget {
  Widget child;

  ProfileDetailCard({Widget? childC}) : child = childC ?? Container();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xffe6e6e6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  static const routeName = "profile";
  final String profileID;

  final ProfileCubit profileCubit = GetIt.instance.get<ProfileCubit>();

  ProfileScreen({Key? key, required this.profileID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfileDetails(profileID);
    return BlocBuilder<ProfileCubit, ProfileState>(
        bloc: context.read<ProfileCubit>(),
        builder: (context, state) {
          return Scaffold(
            body: Column(
              children: [
                Center(
                  child: state.when(
                    loading: () => CircularProgressIndicator(),
                    ready: (Profile profile) => Text(profile.profileDesc!),
                    error: (Failure failure) =>
                        Failure.handleError(context, failure),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
