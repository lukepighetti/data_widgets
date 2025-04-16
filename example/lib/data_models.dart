import 'package:dart_mappable/dart_mappable.dart';

part 'data_models.mapper.dart';

@MappableClass()
class Group with GroupMappable {
  final String title;
  final List<GroupItem> items;

  Group({required this.title, required this.items});
}

@MappableClass()
class GroupItem with GroupItemMappable {
  final String title;

  GroupItem({required this.title});
}
