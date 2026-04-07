import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final String id;
  final String email;
  final String displayName;
  final String? avatarUrl;
  final String timezone;
  final int? dailyScreenLimitMinutes;
  final bool onboardingCompleted;

  const UserModel({
    required this.id,
    required this.email,
    required this.displayName,
    this.avatarUrl,
    required this.timezone,
    this.dailyScreenLimitMinutes,
    required this.onboardingCompleted,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  User toEntity() => User(
        id: id,
        email: email,
        displayName: displayName,
        avatarUrl: avatarUrl,
        timezone: timezone,
        dailyScreenLimitMinutes: dailyScreenLimitMinutes,
        onboardingCompleted: onboardingCompleted,
      );
}
