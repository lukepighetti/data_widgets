// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'data_models.dart';

class GroupMapper extends ClassMapperBase<Group> {
  GroupMapper._();

  static GroupMapper? _instance;
  static GroupMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GroupMapper._());
      GroupItemMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Group';

  static String _$title(Group v) => v.title;
  static const Field<Group, String> _f$title = Field('title', _$title);
  static List<GroupItem> _$items(Group v) => v.items;
  static const Field<Group, List<GroupItem>> _f$items = Field('items', _$items);

  @override
  final MappableFields<Group> fields = const {
    #title: _f$title,
    #items: _f$items,
  };

  static Group _instantiate(DecodingData data) {
    return Group(title: data.dec(_f$title), items: data.dec(_f$items));
  }

  @override
  final Function instantiate = _instantiate;

  static Group fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Group>(map);
  }

  static Group fromJson(String json) {
    return ensureInitialized().decodeJson<Group>(json);
  }
}

mixin GroupMappable {
  String toJson() {
    return GroupMapper.ensureInitialized().encodeJson<Group>(this as Group);
  }

  Map<String, dynamic> toMap() {
    return GroupMapper.ensureInitialized().encodeMap<Group>(this as Group);
  }

  GroupCopyWith<Group, Group, Group> get copyWith =>
      _GroupCopyWithImpl<Group, Group>(this as Group, $identity, $identity);
  @override
  String toString() {
    return GroupMapper.ensureInitialized().stringifyValue(this as Group);
  }

  @override
  bool operator ==(Object other) {
    return GroupMapper.ensureInitialized().equalsValue(this as Group, other);
  }

  @override
  int get hashCode {
    return GroupMapper.ensureInitialized().hashValue(this as Group);
  }
}

extension GroupValueCopy<$R, $Out> on ObjectCopyWith<$R, Group, $Out> {
  GroupCopyWith<$R, Group, $Out> get $asGroup =>
      $base.as((v, t, t2) => _GroupCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GroupCopyWith<$R, $In extends Group, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, GroupItem, GroupItemCopyWith<$R, GroupItem, GroupItem>>
      get items;
  $R call({String? title, List<GroupItem>? items});
  GroupCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GroupCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Group, $Out>
    implements GroupCopyWith<$R, Group, $Out> {
  _GroupCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Group> $mapper = GroupMapper.ensureInitialized();
  @override
  ListCopyWith<$R, GroupItem, GroupItemCopyWith<$R, GroupItem, GroupItem>>
      get items => ListCopyWith(
          $value.items, (v, t) => v.copyWith.$chain(t), (v) => call(items: v));
  @override
  $R call({String? title, List<GroupItem>? items}) => $apply(FieldCopyWithData(
      {if (title != null) #title: title, if (items != null) #items: items}));
  @override
  Group $make(CopyWithData data) => Group(
      title: data.get(#title, or: $value.title),
      items: data.get(#items, or: $value.items));

  @override
  GroupCopyWith<$R2, Group, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GroupCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GroupItemMapper extends ClassMapperBase<GroupItem> {
  GroupItemMapper._();

  static GroupItemMapper? _instance;
  static GroupItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GroupItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GroupItem';

  static String _$title(GroupItem v) => v.title;
  static const Field<GroupItem, String> _f$title = Field('title', _$title);

  @override
  final MappableFields<GroupItem> fields = const {
    #title: _f$title,
  };

  static GroupItem _instantiate(DecodingData data) {
    return GroupItem(title: data.dec(_f$title));
  }

  @override
  final Function instantiate = _instantiate;

  static GroupItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GroupItem>(map);
  }

  static GroupItem fromJson(String json) {
    return ensureInitialized().decodeJson<GroupItem>(json);
  }
}

mixin GroupItemMappable {
  String toJson() {
    return GroupItemMapper.ensureInitialized()
        .encodeJson<GroupItem>(this as GroupItem);
  }

  Map<String, dynamic> toMap() {
    return GroupItemMapper.ensureInitialized()
        .encodeMap<GroupItem>(this as GroupItem);
  }

  GroupItemCopyWith<GroupItem, GroupItem, GroupItem> get copyWith =>
      _GroupItemCopyWithImpl<GroupItem, GroupItem>(
          this as GroupItem, $identity, $identity);
  @override
  String toString() {
    return GroupItemMapper.ensureInitialized()
        .stringifyValue(this as GroupItem);
  }

  @override
  bool operator ==(Object other) {
    return GroupItemMapper.ensureInitialized()
        .equalsValue(this as GroupItem, other);
  }

  @override
  int get hashCode {
    return GroupItemMapper.ensureInitialized().hashValue(this as GroupItem);
  }
}

extension GroupItemValueCopy<$R, $Out> on ObjectCopyWith<$R, GroupItem, $Out> {
  GroupItemCopyWith<$R, GroupItem, $Out> get $asGroupItem =>
      $base.as((v, t, t2) => _GroupItemCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GroupItemCopyWith<$R, $In extends GroupItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title});
  GroupItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GroupItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GroupItem, $Out>
    implements GroupItemCopyWith<$R, GroupItem, $Out> {
  _GroupItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GroupItem> $mapper =
      GroupItemMapper.ensureInitialized();
  @override
  $R call({String? title}) =>
      $apply(FieldCopyWithData({if (title != null) #title: title}));
  @override
  GroupItem $make(CopyWithData data) =>
      GroupItem(title: data.get(#title, or: $value.title));

  @override
  GroupItemCopyWith<$R2, GroupItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GroupItemCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
