
class User {
  String? staffid;
  String? username;
  String? firstname;
  String? lastname;
  String? authToken;
  String? email;
  String? phone;
  String? address,roleName;
  List? staffRegions;
  String? roleId;

  User({this.staffid, this.username, this.firstname, this.lastname});

  Map<String, dynamic> toJson() => {
        "staffid": staffid,
        "username": username,
        "firstname": firstname,
        "lastname": lastname,
      };

  static User? fromHashMap(dynamic map) {
    if (map == null) return null;
    User user = User();

    user.staffid = map["staffid"].toString();
    user.username = map["username"];
    user.firstname = map["firstname"];
    user.lastname = map["lastname"];
    user.authToken = map["authToken"];
    user.phone = map["phone"];
    user.email = map["email"];
    user.address = map["address"];
    user.staffRegions = map["staffRegions"];
    if(map["role"] != null){
      user.roleName = map["role"]["rolename"];
    }

    return user;
  }

  static List<User> fromArrayOfHashMap(dynamic jsonArray) {
    List<User> list = [];
    if (jsonArray != null) {
      for (var jsonObject in jsonArray) {
        list.add(fromHashMap(jsonObject)!);
      }
    }
    return list;
  }
}
