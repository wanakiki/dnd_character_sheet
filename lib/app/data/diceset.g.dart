// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diceset.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const DiceSetSchema = Schema(
  name: r'DiceSet',
  id: 6580022704361986438,
  properties: {
    r'dices': PropertySchema(
      id: 0,
      name: r'dices',
      type: IsarType.longList,
    ),
    r'modifier': PropertySchema(
      id: 1,
      name: r'modifier',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 2,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _diceSetEstimateSize,
  serialize: _diceSetSerialize,
  deserialize: _diceSetDeserialize,
  deserializeProp: _diceSetDeserializeProp,
);

int _diceSetEstimateSize(
  DiceSet object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.dices.length * 8;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _diceSetSerialize(
  DiceSet object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.dices);
  writer.writeLong(offsets[1], object.modifier);
  writer.writeString(offsets[2], object.name);
}

DiceSet _diceSetDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiceSet(
    dices: reader.readLongList(offsets[0]) ?? const [0, 0, 0, 0, 0, 1],
    modifier: reader.readLongOrNull(offsets[1]) ?? 0,
    name: reader.readStringOrNull(offsets[2]) ?? 'D20',
  );
  return object;
}

P _diceSetDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? const [0, 0, 0, 0, 0, 1]) as P;
    case 1:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 2:
      return (reader.readStringOrNull(offset) ?? 'D20') as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DiceSetQueryFilter
    on QueryBuilder<DiceSet, DiceSet, QFilterCondition> {
  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dices',
        value: value,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dices',
        value: value,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dices',
        value: value,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dices',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dices',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dices',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dices',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dices',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dices',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> dicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'dices',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> modifierEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'modifier',
        value: value,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> modifierGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'modifier',
        value: value,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> modifierLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'modifier',
        value: value,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> modifierBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'modifier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameContains(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<DiceSet, DiceSet, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DiceSetQueryObject
    on QueryBuilder<DiceSet, DiceSet, QFilterCondition> {}
