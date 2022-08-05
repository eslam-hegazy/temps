import 'branches.dart';

class Store {
  final String name;
  final String desc;
  final String imagePath;
  final List<Branch> branches;

  Store(
      {required this.name,
      required this.desc,
      required this.imagePath,
      required this.branches});
}
