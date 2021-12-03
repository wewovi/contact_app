class Contact {
  String name = "";
  String number = "";
  String id = " ";
  String email = " ";
  String profileImage = "";

  Contact(
      {this.name = "",
      required this.number,
      this.email = "",
      this.profileImage = "",
      required this.id});
}
