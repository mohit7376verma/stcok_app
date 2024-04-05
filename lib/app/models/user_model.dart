class UserModel {
  final String firstName;
  final String lastName;
  final String phone;
  final String profileUrl;
  final String email;
  final String dob;
  final String? id;

  const UserModel(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.profileUrl,
      required this.email,
      required this.dob,
      this.id});
}
