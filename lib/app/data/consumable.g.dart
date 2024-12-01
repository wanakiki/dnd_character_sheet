// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumable.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const ConsumableSchema = Schema(
  name: r'Consumable',
  id: -4373283478240955020,
  properties: {
    r'currentCount': PropertySchema(
      id: 0,
      name: r'currentCount',
      type: IsarType.long,
    ),
    r'longRestRecovery': PropertySchema(
      id: 1,
      name: r'longRestRecovery',
      type: IsarType.long,
    ),
    r'maxCount': PropertySchema(
      id: 2,
      name: r'maxCount',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 3,
      name: r'name',
      type: IsarType.string,
    ),
    r'shortRestRecovery': PropertySchema(
      id: 4,
      name: r'shortRestRecovery',
      type: IsarType.long,
    )
  },
  estimateSize: _consumableEstimateSize,
  serialize: _consumableSerialize,
  deserialize: _consumableDeserialize,
  deserializeProp: _consumableDeserializeProp,
);

int _consumableEstimateSize(
  Consumable object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _consumableSerialize(
  Consumable object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.currentCount);
  writer.writeLong(offsets[1], object.longRestRecovery);
  writer.writeLong(offsets[2], object.maxCount);
  writer.writeString(offsets[3], object.name);
  writer.writeLong(offsets[4], object.shortRestRecovery);
}

Consumable _consumableDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Consumable(
    currentCount: reader.readLongOrNull(offsets[0]) ?? 1,
    longRestRecovery: reader.readLongOrNull(offsets[1]) ?? 0,
    maxCount: reader.readLongOrNull(offsets[2]) ?? 3,
    name: reader.readStringOrNull(offsets[3]) ?? '生命骰',
    shortRestRecovery: reader.readLongOrNull(offsets[4]) ?? 0,
  );
  return object;
}

P _consumableDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readLongOrNull(offset) ?? 3) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '生命骰') as P;
    case 4:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension ConsumableQueryFilter
    on QueryBuilder<Consumable, Consumable, QFilterCondition> {
  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      currentCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      currentCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      currentCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      currentCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      longRestRecoveryEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longRestRecovery',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      longRestRecoveryGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longRestRecovery',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      longRestRecoveryLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longRestRecovery',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      longRestRecoveryBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longRestRecovery',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> maxCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      maxCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> maxCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> maxCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      shortRestRecoveryEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'shortRestRecovery',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      shortRestRecoveryGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'shortRestRecovery',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      shortRestRecoveryLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'shortRestRecovery',
        value: value,
      ));
    });
  }

  QueryBuilder<Consumable, Consumable, QAfterFilterCondition>
      shortRestRecoveryBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'shortRestRecovery',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ConsumableQueryObject
    on QueryBuilder<Consumable, Consumable, QFilterCondition> {}
