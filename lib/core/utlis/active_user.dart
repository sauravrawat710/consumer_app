import 'package:consumer_app/core/datamodel/enduser.dart';
import 'package:consumer_app/core/logic/repositry/database_repo.dart';
import 'package:consumer_app/core/utlis/locator.dart';
import 'package:get_it/get_it.dart';

class ActiveUser {
  EndUser? _user;
  EndUser? get user => _user;
  final DataBaseService _dbService = GetIt.instance.get<DataBaseService>();

  Future populateActiveUser(String uidToFetch) async {
    _user = await _dbService.getUser(uidToFetch);
    print("User popul;ated Succssfully");
  }
}
