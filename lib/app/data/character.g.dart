// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCharacterCollection on Isar {
  IsarCollection<Character> get characters => this.collection();
}

const CharacterSchema = CollectionSchema(
  name: r'Character',
  id: 4658184409279959047,
  properties: {
    r'alignment': PropertySchema(
      id: 0,
      name: r'alignment',
      type: IsarType.string,
    ),
    r'armorClass': PropertySchema(
      id: 1,
      name: r'armorClass',
      type: IsarType.long,
    ),
    r'attributes': PropertySchema(
      id: 2,
      name: r'attributes',
      type: IsarType.longList,
    ),
    r'avatarUrl': PropertySchema(
      id: 3,
      name: r'avatarUrl',
      type: IsarType.string,
    ),
    r'background': PropertySchema(
      id: 4,
      name: r'background',
      type: IsarType.string,
    ),
    r'backpack': PropertySchema(
      id: 5,
      name: r'backpack',
      type: IsarType.objectList,
      target: r'Item',
    ),
    r'characterClass': PropertySchema(
      id: 6,
      name: r'characterClass',
      type: IsarType.string,
    ),
    r'coin': PropertySchema(
      id: 7,
      name: r'coin',
      type: IsarType.longList,
    ),
    r'currentHitPoints': PropertySchema(
      id: 8,
      name: r'currentHitPoints',
      type: IsarType.long,
    ),
    r'diceBag': PropertySchema(
      id: 9,
      name: r'diceBag',
      type: IsarType.objectList,
      target: r'DiceSet',
    ),
    r'experiencePoints': PropertySchema(
      id: 10,
      name: r'experiencePoints',
      type: IsarType.long,
    ),
    r'initiative': PropertySchema(
      id: 11,
      name: r'initiative',
      type: IsarType.long,
    ),
    r'level': PropertySchema(
      id: 12,
      name: r'level',
      type: IsarType.long,
    ),
    r'maxHitPoints': PropertySchema(
      id: 13,
      name: r'maxHitPoints',
      type: IsarType.long,
    ),
    r'name': PropertySchema(
      id: 14,
      name: r'name',
      type: IsarType.string,
    ),
    r'race': PropertySchema(
      id: 15,
      name: r'race',
      type: IsarType.string,
    ),
    r'speed': PropertySchema(
      id: 16,
      name: r'speed',
      type: IsarType.long,
    )
  },
  estimateSize: _characterEstimateSize,
  serialize: _characterSerialize,
  deserialize: _characterDeserialize,
  deserializeProp: _characterDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'DiceSet': DiceSetSchema, r'Item': ItemSchema},
  getId: _characterGetId,
  getLinks: _characterGetLinks,
  attach: _characterAttach,
  version: '3.1.7',
);

int _characterEstimateSize(
  Character object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.alignment.length * 3;
  bytesCount += 3 + object.attributes.length * 8;
  bytesCount += 3 + object.avatarUrl.length * 3;
  bytesCount += 3 + object.background.length * 3;
  bytesCount += 3 + object.backpack.length * 3;
  {
    final offsets = allOffsets[Item]!;
    for (var i = 0; i < object.backpack.length; i++) {
      final value = object.backpack[i];
      bytesCount += ItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.characterClass.length * 3;
  bytesCount += 3 + object.coin.length * 8;
  bytesCount += 3 + object.diceBag.length * 3;
  {
    final offsets = allOffsets[DiceSet]!;
    for (var i = 0; i < object.diceBag.length; i++) {
      final value = object.diceBag[i];
      bytesCount += DiceSetSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.race.length * 3;
  return bytesCount;
}

void _characterSerialize(
  Character object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.alignment);
  writer.writeLong(offsets[1], object.armorClass);
  writer.writeLongList(offsets[2], object.attributes);
  writer.writeString(offsets[3], object.avatarUrl);
  writer.writeString(offsets[4], object.background);
  writer.writeObjectList<Item>(
    offsets[5],
    allOffsets,
    ItemSchema.serialize,
    object.backpack,
  );
  writer.writeString(offsets[6], object.characterClass);
  writer.writeLongList(offsets[7], object.coin);
  writer.writeLong(offsets[8], object.currentHitPoints);
  writer.writeObjectList<DiceSet>(
    offsets[9],
    allOffsets,
    DiceSetSchema.serialize,
    object.diceBag,
  );
  writer.writeLong(offsets[10], object.experiencePoints);
  writer.writeLong(offsets[11], object.initiative);
  writer.writeLong(offsets[12], object.level);
  writer.writeLong(offsets[13], object.maxHitPoints);
  writer.writeString(offsets[14], object.name);
  writer.writeString(offsets[15], object.race);
  writer.writeLong(offsets[16], object.speed);
}

Character _characterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Character(
    alignment: reader.readString(offsets[0]),
    armorClass: reader.readLong(offsets[1]),
    attributes: reader.readLongList(offsets[2]) ?? [],
    avatarUrl: reader.readStringOrNull(offsets[3]) ?? '',
    background: reader.readString(offsets[4]),
    backpack: reader.readObjectList<Item>(
          offsets[5],
          ItemSchema.deserialize,
          allOffsets,
          Item(),
        ) ??
        const [],
    characterClass: reader.readString(offsets[6]),
    coin: reader.readLongList(offsets[7]) ?? const [0, 0, 0],
    currentHitPoints: reader.readLong(offsets[8]),
    diceBag: reader.readObjectList<DiceSet>(
          offsets[9],
          DiceSetSchema.deserialize,
          allOffsets,
          DiceSet(),
        ) ??
        const [],
    experiencePoints: reader.readLongOrNull(offsets[10]) ?? 0,
    initiative: reader.readLong(offsets[11]),
    level: reader.readLongOrNull(offsets[12]) ?? 1,
    maxHitPoints: reader.readLong(offsets[13]),
    name: reader.readString(offsets[14]),
    race: reader.readString(offsets[15]),
    speed: reader.readLong(offsets[16]),
  );
  object.id = id;
  return object;
}

P _characterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLongList(offset) ?? []) as P;
    case 3:
      return (reader.readStringOrNull(offset) ?? '') as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readObjectList<Item>(
            offset,
            ItemSchema.deserialize,
            allOffsets,
            Item(),
          ) ??
          const []) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readLongList(offset) ?? const [0, 0, 0]) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readObjectList<DiceSet>(
            offset,
            DiceSetSchema.deserialize,
            allOffsets,
            DiceSet(),
          ) ??
          const []) as P;
    case 10:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLongOrNull(offset) ?? 1) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    case 14:
      return (reader.readString(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _characterGetId(Character object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _characterGetLinks(Character object) {
  return [];
}

void _characterAttach(IsarCollection<dynamic> col, Id id, Character object) {
  object.id = id;
}

extension CharacterQueryWhereSort
    on QueryBuilder<Character, Character, QWhere> {
  QueryBuilder<Character, Character, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CharacterQueryWhere
    on QueryBuilder<Character, Character, QWhereClause> {
  QueryBuilder<Character, Character, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Character, Character, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CharacterQueryFilter
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      alignmentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'alignment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'alignment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'alignment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> alignmentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'alignment',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      alignmentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'alignment',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> armorClassEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'armorClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      armorClassGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'armorClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> armorClassLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'armorClass',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> armorClassBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'armorClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'attributes',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'attributes',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'attributes',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'attributes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attributes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attributes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attributes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attributes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attributes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      attributesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'attributes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      avatarUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'avatarUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'avatarUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'avatarUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> avatarUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      avatarUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'avatarUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backgroundEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'background',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backgroundGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'background',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backgroundLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'background',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backgroundBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'background',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backgroundStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'background',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backgroundEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'background',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backgroundContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'background',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backgroundMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'background',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backgroundIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'background',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backgroundIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'background',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backpackLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backpack',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> backpackIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backpack',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backpackIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backpack',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backpackLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backpack',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backpackLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backpack',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      backpackLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'backpack',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characterClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'characterClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'characterClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'characterClass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'characterClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'characterClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'characterClass',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'characterClass',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'characterClass',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      characterClassIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'characterClass',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinElementEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coin',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      coinElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coin',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coin',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coin',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coin',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coin',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coin',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coin',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      coinLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coin',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> coinLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'coin',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      currentHitPointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentHitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      currentHitPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentHitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      currentHitPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentHitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      currentHitPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentHitPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      diceBagLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diceBag',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> diceBagIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diceBag',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      diceBagIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diceBag',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      diceBagLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diceBag',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      diceBagLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diceBag',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      diceBagLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'diceBag',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      experiencePointsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'experiencePoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      experiencePointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'experiencePoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      experiencePointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'experiencePoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      experiencePointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'experiencePoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> initiativeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initiative',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      initiativeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initiative',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> initiativeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initiative',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> initiativeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initiative',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> levelEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> levelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> levelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> levelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> maxHitPointsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'maxHitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      maxHitPointsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'maxHitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition>
      maxHitPointsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'maxHitPoints',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> maxHitPointsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'maxHitPoints',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameContains(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameMatches(
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

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'race',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'race',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'race',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'race',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'race',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'race',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'race',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'race',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'race',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> raceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'race',
        value: '',
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> speedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'speed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> speedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'speed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> speedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'speed',
        value: value,
      ));
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> speedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'speed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CharacterQueryObject
    on QueryBuilder<Character, Character, QFilterCondition> {
  QueryBuilder<Character, Character, QAfterFilterCondition> backpackElement(
      FilterQuery<Item> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'backpack');
    });
  }

  QueryBuilder<Character, Character, QAfterFilterCondition> diceBagElement(
      FilterQuery<DiceSet> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'diceBag');
    });
  }
}

extension CharacterQueryLinks
    on QueryBuilder<Character, Character, QFilterCondition> {}

extension CharacterQuerySortBy on QueryBuilder<Character, Character, QSortBy> {
  QueryBuilder<Character, Character, QAfterSortBy> sortByAlignment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByAlignmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByArmorClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByArmorClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByBackground() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'background', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByBackgroundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'background', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByCharacterClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterClass', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByCharacterClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterClass', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByCurrentHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHitPoints', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy>
      sortByCurrentHitPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHitPoints', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByExperiencePoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experiencePoints', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy>
      sortByExperiencePointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experiencePoints', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByInitiativeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMaxHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHitPoints', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByMaxHitPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHitPoints', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByRace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortByRaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortBySpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speed', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> sortBySpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speed', Sort.desc);
    });
  }
}

extension CharacterQuerySortThenBy
    on QueryBuilder<Character, Character, QSortThenBy> {
  QueryBuilder<Character, Character, QAfterSortBy> thenByAlignment() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByAlignmentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'alignment', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByArmorClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByArmorClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'armorClass', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByAvatarUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByAvatarUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'avatarUrl', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByBackground() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'background', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByBackgroundDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'background', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByCharacterClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterClass', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByCharacterClassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'characterClass', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByCurrentHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHitPoints', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy>
      thenByCurrentHitPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentHitPoints', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByExperiencePoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experiencePoints', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy>
      thenByExperiencePointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'experiencePoints', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByInitiativeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiative', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMaxHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHitPoints', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByMaxHitPointsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'maxHitPoints', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByRace() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenByRaceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'race', Sort.desc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenBySpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speed', Sort.asc);
    });
  }

  QueryBuilder<Character, Character, QAfterSortBy> thenBySpeedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'speed', Sort.desc);
    });
  }
}

extension CharacterQueryWhereDistinct
    on QueryBuilder<Character, Character, QDistinct> {
  QueryBuilder<Character, Character, QDistinct> distinctByAlignment(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'alignment', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByArmorClass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'armorClass');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByAttributes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'attributes');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByAvatarUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'avatarUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByBackground(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'background', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByCharacterClass(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'characterClass',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByCoin() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coin');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByCurrentHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentHitPoints');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByExperiencePoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'experiencePoints');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByInitiative() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initiative');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByMaxHitPoints() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'maxHitPoints');
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctByRace(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'race', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Character, Character, QDistinct> distinctBySpeed() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'speed');
    });
  }
}

extension CharacterQueryProperty
    on QueryBuilder<Character, Character, QQueryProperty> {
  QueryBuilder<Character, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> alignmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'alignment');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> armorClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'armorClass');
    });
  }

  QueryBuilder<Character, List<int>, QQueryOperations> attributesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'attributes');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> avatarUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'avatarUrl');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> backgroundProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'background');
    });
  }

  QueryBuilder<Character, List<Item>, QQueryOperations> backpackProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'backpack');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> characterClassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'characterClass');
    });
  }

  QueryBuilder<Character, List<int>, QQueryOperations> coinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coin');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> currentHitPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentHitPoints');
    });
  }

  QueryBuilder<Character, List<DiceSet>, QQueryOperations> diceBagProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diceBag');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> experiencePointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'experiencePoints');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> initiativeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initiative');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> maxHitPointsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'maxHitPoints');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Character, String, QQueryOperations> raceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'race');
    });
  }

  QueryBuilder<Character, int, QQueryOperations> speedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'speed');
    });
  }
}
