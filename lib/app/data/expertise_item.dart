import 'package:isar/isar.dart';
part 'expertise_item.g.dart';

@embedded
class ExpertiseItem {
  String name; // 专长名称
  String description; // 专长描述

  ExpertiseItem({
    this.name = 'Default Expertise', // 默认名称
    this.description = 'Default description of the expertise.', // 默认描述
  });

  // 从JSON创建ExpertiseItem对象
  factory ExpertiseItem.fromJson(Map<String, dynamic> json) {
    return ExpertiseItem(
      name: json['name'],
      description: json['description'],
    );
  }

  // 将ExpertiseItem对象转换为JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
    };
  }

  @override
  String toString() {
    return '名称: $name, 描述: $description';
  }
}
