class Branch {
  String name;
  List<String> details;

  Branch({
    required this.name,
    required this.details,
  });
}


class SubBranchDetails {
  String subBranchName;
  String whatsappNumber;
  String instgramAccount;
  String phoneNumber;
  String location;
  String? imgurl;
  SubBranchDetails({
    required this.subBranchName,
    required this.whatsappNumber,
    required this.instgramAccount,
    required this.phoneNumber,
    required this.imgurl,
    required this.location,
  });
}
