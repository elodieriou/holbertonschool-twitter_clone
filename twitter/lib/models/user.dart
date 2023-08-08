import 'package:uuid/uuid.dart';
import 'dart:math';

class User {
  String key;
  String userID;
  String email;
  String userName;
  String displayName;
  String imageUrl;
  String bio;
  String coverImgUrl;
  int followers;
  int following;
  List<String> followersList;
  List<String> followingList;

  // Class constructor
  User({
    String? key,
    String? userID,
    String? email,
    String? userName,
    String? displayName,
    String? imageUrl,
    String? bio,
    String? coverImgUrl,
    int? followers,
    int? following,
    List<String>? followersList,
    List<String>? followingList,
  }) : key = key ?? const Uuid().v4(),
        userID = userID ?? '',
        email = email ?? '',
        userName = userName ?? _generateRandomString(8),
        displayName = displayName ?? '',
        imageUrl = imageUrl ?? 'placeholder_image_url',
        bio = bio ?? 'No bio available',
        coverImgUrl = coverImgUrl ?? 'placeholder_cover_image_url',
        followers = followers ?? 0,
        following = following ?? 0,
        followersList = followersList ?? [],
        followingList = followingList ?? [];

  static String _generateRandomString(int length) {
    const String _chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final Random _rnd = Random();
    return String.fromCharCodes(Iterable.generate(
        length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
  }

  // Named constructor to create User object from a Map
  User.fromJson(Map<String, dynamic> map)
      : key = map['key'],
        userID = map['userID'],
        email = map['email'],
        userName = map['userName'],
        displayName = map['displayName'],
        imageUrl = map['imageUrl'],
        bio = map['bio'],
        coverImgUrl = map['coverImgUrl'],
        followers = map['followers'],
        following = map['following'],
        followersList = List<String>.from(map['followersList']),
        followingList = List<String>.from(map['followingList']);

  // Instance method to convert User object to a Map
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'userID': userID,
      'email': email,
      'userName': userName,
      'displayName': displayName,
      'imageUrl': imageUrl,
      'bio': bio,
      'coverImgUrl': coverImgUrl,
      'followers': followers,
      'following': following,
      'followersList': followersList,
      'followingList': followingList,
    };
  }
}
