// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spell.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSpellCollection on Isar {
  IsarCollection<Spell> get spells => this.collection();
}

const SpellSchema = CollectionSchema(
  name: r'Spell',
  id: -4165926397591645046,
  properties: {
    r'castingTime': PropertySchema(
      id: 0,
      name: r'castingTime',
      type: IsarType.string,
    ),
    r'classes': PropertySchema(
      id: 1,
      name: r'classes',
      type: IsarType.stringList,
    ),
    r'description': PropertySchema(
      id: 2,
      name: r'description',
      type: IsarType.string,
    ),
    r'duration': PropertySchema(
      id: 3,
      name: r'duration',
      type: IsarType.string,
    ),
    r'englishName': PropertySchema(
      id: 4,
      name: r'englishName',
      type: IsarType.string,
    ),
    r'level': PropertySchema(
      id: 5,
      name: r'level',
      type: IsarType.string,
    ),
    r'material': PropertySchema(
      id: 6,
      name: r'material',
      type: IsarType.bool,
    ),
    r'materialComponents': PropertySchema(
      id: 7,
      name: r'materialComponents',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 8,
      name: r'name',
      type: IsarType.string,
    ),
    r'range': PropertySchema(
      id: 9,
      name: r'range',
      type: IsarType.string,
    ),
    r'ritual': PropertySchema(
      id: 10,
      name: r'ritual',
      type: IsarType.bool,
    ),
    r'school': PropertySchema(
      id: 11,
      name: r'school',
      type: IsarType.string,
    ),
    r'somatic': PropertySchema(
      id: 12,
      name: r'somatic',
      type: IsarType.bool,
    ),
    r'source': PropertySchema(
      id: 13,
      name: r'source',
      type: IsarType.string,
    ),
    r'verbal': PropertySchema(
      id: 14,
      name: r'verbal',
      type: IsarType.bool,
    )
  },
  estimateSize: _spellEstimateSize,
  serialize: _spellSerialize,
  deserialize: _spellDeserialize,
  deserializeProp: _spellDeserializeProp,
  idName: r'id',
  indexes: {
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'level': IndexSchema(
      id: -730704511986726349,
      name: r'level',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'level',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'school': IndexSchema(
      id: -3031284701188377254,
      name: r'school',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'school',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'castingTime': IndexSchema(
      id: -4070823411345877171,
      name: r'castingTime',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'castingTime',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'range': IndexSchema(
      id: -1771892735026105399,
      name: r'range',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'range',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'duration': IndexSchema(
      id: 8840853660219221640,
      name: r'duration',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'duration',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'englishName': IndexSchema(
      id: -3282696578784958066,
      name: r'englishName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'englishName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'classes': IndexSchema(
      id: -1332243946490119243,
      name: r'classes',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'classes',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'source': IndexSchema(
      id: -836881197531269605,
      name: r'source',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'source',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _spellGetId,
  getLinks: _spellGetLinks,
  attach: _spellAttach,
  version: '3.1.7',
);

int _spellEstimateSize(
  Spell object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.castingTime.length * 3;
  bytesCount += 3 + object.classes.length * 3;
  {
    for (var i = 0; i < object.classes.length; i++) {
      final value = object.classes[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.duration.length * 3;
  bytesCount += 3 + object.englishName.length * 3;
  bytesCount += 3 + object.level.length * 3;
  bytesCount += 3 + object.materialComponents.length * 3;
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.range.length * 3;
  bytesCount += 3 + object.school.length * 3;
  bytesCount += 3 + object.source.length * 3;
  return bytesCount;
}

void _spellSerialize(
  Spell object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.castingTime);
  writer.writeStringList(offsets[1], object.classes);
  writer.writeString(offsets[2], object.description);
  writer.writeString(offsets[3], object.duration);
  writer.writeString(offsets[4], object.englishName);
  writer.writeString(offsets[5], object.level);
  writer.writeBool(offsets[6], object.material);
  writer.writeString(offsets[7], object.materialComponents);
  writer.writeString(offsets[8], object.name);
  writer.writeString(offsets[9], object.range);
  writer.writeBool(offsets[10], object.ritual);
  writer.writeString(offsets[11], object.school);
  writer.writeBool(offsets[12], object.somatic);
  writer.writeString(offsets[13], object.source);
  writer.writeBool(offsets[14], object.verbal);
}

Spell _spellDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Spell();
  object.castingTime = reader.readString(offsets[0]);
  object.classes = reader.readStringList(offsets[1]) ?? [];
  object.description = reader.readString(offsets[2]);
  object.duration = reader.readString(offsets[3]);
  object.englishName = reader.readString(offsets[4]);
  object.id = id;
  object.level = reader.readString(offsets[5]);
  object.material = reader.readBool(offsets[6]);
  object.materialComponents = reader.readString(offsets[7]);
  object.name = reader.readString(offsets[8]);
  object.range = reader.readString(offsets[9]);
  object.ritual = reader.readBool(offsets[10]);
  object.school = reader.readString(offsets[11]);
  object.somatic = reader.readBool(offsets[12]);
  object.source = reader.readString(offsets[13]);
  object.verbal = reader.readBool(offsets[14]);
  return object;
}

P _spellDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    case 14:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _spellGetId(Spell object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _spellGetLinks(Spell object) {
  return [];
}

void _spellAttach(IsarCollection<dynamic> col, Id id, Spell object) {
  object.id = id;
}

extension SpellQueryWhereSort on QueryBuilder<Spell, Spell, QWhere> {
  QueryBuilder<Spell, Spell, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhere> anyClassesElement() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'classes'),
      );
    });
  }
}

extension SpellQueryWhere on QueryBuilder<Spell, Spell, QWhereClause> {
  QueryBuilder<Spell, Spell, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Spell, Spell, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> idBetween(
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

  QueryBuilder<Spell, Spell, QAfterWhereClause> nameEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> nameNotEqualTo(String name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> levelEqualTo(String level) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'level',
        value: [level],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> levelNotEqualTo(String level) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'level',
              lower: [],
              upper: [level],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'level',
              lower: [level],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'level',
              lower: [level],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'level',
              lower: [],
              upper: [level],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> schoolEqualTo(String school) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'school',
        value: [school],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> schoolNotEqualTo(
      String school) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'school',
              lower: [],
              upper: [school],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'school',
              lower: [school],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'school',
              lower: [school],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'school',
              lower: [],
              upper: [school],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> castingTimeEqualTo(
      String castingTime) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'castingTime',
        value: [castingTime],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> castingTimeNotEqualTo(
      String castingTime) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'castingTime',
              lower: [],
              upper: [castingTime],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'castingTime',
              lower: [castingTime],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'castingTime',
              lower: [castingTime],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'castingTime',
              lower: [],
              upper: [castingTime],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> rangeEqualTo(String range) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'range',
        value: [range],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> rangeNotEqualTo(String range) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'range',
              lower: [],
              upper: [range],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'range',
              lower: [range],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'range',
              lower: [range],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'range',
              lower: [],
              upper: [range],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> durationEqualTo(
      String duration) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'duration',
        value: [duration],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> durationNotEqualTo(
      String duration) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'duration',
              lower: [],
              upper: [duration],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'duration',
              lower: [duration],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'duration',
              lower: [duration],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'duration',
              lower: [],
              upper: [duration],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> englishNameEqualTo(
      String englishName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'englishName',
        value: [englishName],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> englishNameNotEqualTo(
      String englishName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'englishName',
              lower: [],
              upper: [englishName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'englishName',
              lower: [englishName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'englishName',
              lower: [englishName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'englishName',
              lower: [],
              upper: [englishName],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementEqualTo(
      String classesElement) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'classes',
        value: [classesElement],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementNotEqualTo(
      String classesElement) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classes',
              lower: [],
              upper: [classesElement],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classes',
              lower: [classesElement],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classes',
              lower: [classesElement],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'classes',
              lower: [],
              upper: [classesElement],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementGreaterThan(
    String classesElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'classes',
        lower: [classesElement],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementLessThan(
    String classesElement, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'classes',
        lower: [],
        upper: [classesElement],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementBetween(
    String lowerClassesElement,
    String upperClassesElement, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'classes',
        lower: [lowerClassesElement],
        includeLower: includeLower,
        upper: [upperClassesElement],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementStartsWith(
      String ClassesElementPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'classes',
        lower: [ClassesElementPrefix],
        upper: ['$ClassesElementPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'classes',
        value: [''],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> classesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'classes',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'classes',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'classes',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'classes',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> sourceEqualTo(String source) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'source',
        value: [source],
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterWhereClause> sourceNotEqualTo(
      String source) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'source',
              lower: [],
              upper: [source],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'source',
              lower: [source],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'source',
              lower: [source],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'source',
              lower: [],
              upper: [source],
              includeUpper: false,
            ));
      }
    });
  }
}

extension SpellQueryFilter on QueryBuilder<Spell, Spell, QFilterCondition> {
  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'castingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'castingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'castingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'castingTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'castingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'castingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'castingTime',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'castingTime',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'castingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> castingTimeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'castingTime',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'classes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'classes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'classes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'classes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'classes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'classes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'classes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'classes',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'classes',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> classesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'classes',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'duration',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'duration',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'duration',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> durationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'duration',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'englishName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'englishName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'englishName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'englishName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'englishName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'englishName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'englishName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'englishName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'englishName',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> englishNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'englishName',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'level',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'level',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'level',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> levelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'level',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'material',
        value: value,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialComponentsEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialComponents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition>
      materialComponentsGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'materialComponents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialComponentsLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'materialComponents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialComponentsBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'materialComponents',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition>
      materialComponentsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'materialComponents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialComponentsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'materialComponents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialComponentsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'materialComponents',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> materialComponentsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'materialComponents',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition>
      materialComponentsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'materialComponents',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition>
      materialComponentsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'materialComponents',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameEqualTo(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameGreaterThan(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameLessThan(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameBetween(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameStartsWith(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameEndsWith(
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

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'range',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'range',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'range',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'range',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'range',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'range',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'range',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'range',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'range',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> rangeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'range',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> ritualEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ritual',
        value: value,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'school',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'school',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'school',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'school',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'school',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'school',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'school',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'school',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'school',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> schoolIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'school',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> somaticEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'somatic',
        value: value,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'source',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'source',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'source',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> sourceIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'source',
        value: '',
      ));
    });
  }

  QueryBuilder<Spell, Spell, QAfterFilterCondition> verbalEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'verbal',
        value: value,
      ));
    });
  }
}

extension SpellQueryObject on QueryBuilder<Spell, Spell, QFilterCondition> {}

extension SpellQueryLinks on QueryBuilder<Spell, Spell, QFilterCondition> {}

extension SpellQuerySortBy on QueryBuilder<Spell, Spell, QSortBy> {
  QueryBuilder<Spell, Spell, QAfterSortBy> sortByCastingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'castingTime', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByCastingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'castingTime', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByEnglishName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishName', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByEnglishNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishName', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByMaterialComponents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialComponents', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByMaterialComponentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialComponents', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'range', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'range', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByRitual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ritual', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByRitualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ritual', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortBySchool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'school', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortBySchoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'school', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortBySomatic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'somatic', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortBySomaticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'somatic', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByVerbal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbal', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> sortByVerbalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbal', Sort.desc);
    });
  }
}

extension SpellQuerySortThenBy on QueryBuilder<Spell, Spell, QSortThenBy> {
  QueryBuilder<Spell, Spell, QAfterSortBy> thenByCastingTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'castingTime', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByCastingTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'castingTime', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByDuration() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByDurationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'duration', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByEnglishName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishName', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByEnglishNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'englishName', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'level', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByMaterialDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'material', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByMaterialComponents() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialComponents', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByMaterialComponentsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'materialComponents', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByRange() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'range', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByRangeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'range', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByRitual() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ritual', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByRitualDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ritual', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenBySchool() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'school', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenBySchoolDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'school', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenBySomatic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'somatic', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenBySomaticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'somatic', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenBySource() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenBySourceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'source', Sort.desc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByVerbal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbal', Sort.asc);
    });
  }

  QueryBuilder<Spell, Spell, QAfterSortBy> thenByVerbalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'verbal', Sort.desc);
    });
  }
}

extension SpellQueryWhereDistinct on QueryBuilder<Spell, Spell, QDistinct> {
  QueryBuilder<Spell, Spell, QDistinct> distinctByCastingTime(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'castingTime', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByClasses() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'classes');
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByDuration(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'duration', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByEnglishName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'englishName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByLevel(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'level', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByMaterial() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'material');
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByMaterialComponents(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'materialComponents',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByRange(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'range', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByRitual() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ritual');
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctBySchool(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'school', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctBySomatic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'somatic');
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctBySource(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'source', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Spell, Spell, QDistinct> distinctByVerbal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'verbal');
    });
  }
}

extension SpellQueryProperty on QueryBuilder<Spell, Spell, QQueryProperty> {
  QueryBuilder<Spell, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> castingTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'castingTime');
    });
  }

  QueryBuilder<Spell, List<String>, QQueryOperations> classesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'classes');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> durationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'duration');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> englishNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'englishName');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> levelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'level');
    });
  }

  QueryBuilder<Spell, bool, QQueryOperations> materialProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'material');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> materialComponentsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'materialComponents');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> rangeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'range');
    });
  }

  QueryBuilder<Spell, bool, QQueryOperations> ritualProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ritual');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> schoolProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'school');
    });
  }

  QueryBuilder<Spell, bool, QQueryOperations> somaticProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'somatic');
    });
  }

  QueryBuilder<Spell, String, QQueryOperations> sourceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'source');
    });
  }

  QueryBuilder<Spell, bool, QQueryOperations> verbalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'verbal');
    });
  }
}
