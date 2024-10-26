import 'package:isar/isar.dart';

part 'spell.g.dart';

@Collection()
class Spell {
  Id id = Isar.autoIncrement;

  @Index()
  late String name; // 法术名

  @Index()
  late String level; // 环阶

  @Index()
  late String school; // 学派

  late bool ritual; // 仪式

  @Index()
  late String castingTime; // 施法时间

  @Index()
  late String range; // 施法距离

  late bool verbal; // V 言语
  late bool somatic; // S 姿势
  late bool material; // M 材料

  late String materialComponents; // 材料内容

  @Index()
  late String duration; // 持续时间

  late String description; // 法术详述

  @Index()
  late String englishName; // 英文名

  @Index(type: IndexType.value)
  late List<String> classes; // 职业列表

  @Index()
  late String source; // 出处
}

// 法术名	环阶	学派	仪式	施法时间	施法距离	V 言语	S 姿势	M 材料	材料内容	持续时间	法术详述	名字	英文名	吟游诗人	牧师	德鲁伊	圣武士	游侠	术士	邪术师	法师	奇械师	时间法师	重力法师	出处
