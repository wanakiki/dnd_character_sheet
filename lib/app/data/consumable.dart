import 'package:isar/isar.dart';

part 'consumable.g.dart';

@embedded
class Consumable {
  String name;
  int currentCount;
  int maxCount;
  int shortRestRecovery;
  int longRestRecovery;

  Consumable({
    this.name = '生命骰',
    this.currentCount = 1,
    this.maxCount = 3,
    this.shortRestRecovery = 0,
    this.longRestRecovery = 0,
  });

  void increase() {
    if (currentCount < maxCount) {
      currentCount++;
    }
  }

  void decrease() {
    if (currentCount > 0) {
      currentCount--;
    }
  }

  void recoverShortRest() {
    currentCount = (currentCount + shortRestRecovery).clamp(0, maxCount);
  }

  void recoverLongRest() {
    currentCount = (currentCount + longRestRecovery).clamp(0, maxCount);
  }

  @override
  String toString() {
    return '$name: $currentCount/$maxCount';
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'currentCount': currentCount,
      'maxCount': maxCount,
      'shortRestRecovery': shortRestRecovery,
      'longRestRecovery': longRestRecovery,
    };
  }

  factory Consumable.fromJson(Map<String, dynamic> json) {
    return Consumable(
      name: json['name'],
      currentCount: json['currentCount'],
      maxCount: json['maxCount'],
      shortRestRecovery: json['shortRestRecovery'],
      longRestRecovery: json['longRestRecovery'],
    );
  }
}
