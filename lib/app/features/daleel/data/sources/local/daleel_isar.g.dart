// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daleel_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDaleelIsarCollection on Isar {
  IsarCollection<DaleelIsar> get daleelIsars => this.collection();
}

const DaleelIsarSchema = CollectionSchema(
  name: r'DaleelIsar',
  id: 3120732561315657169,
  properties: {
    r'daleelType': PropertySchema(
      id: 0,
      name: r'daleelType',
      type: IsarType.string,
      enumMap: _DaleelIsardaleelTypeEnumValueMap,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'firstAya': PropertySchema(
      id: 2,
      name: r'firstAya',
      type: IsarType.long,
    ),
    r'hadithAuthenticity': PropertySchema(
      id: 3,
      name: r'hadithAuthenticity',
      type: IsarType.string,
      enumMap: _DaleelIsarhadithAuthenticityEnumValueMap,
    ),
    r'hadithExtraction': PropertySchema(
      id: 4,
      name: r'hadithExtraction',
      type: IsarType.string,
    ),
    r'lastAya': PropertySchema(
      id: 5,
      name: r'lastAya',
      type: IsarType.long,
    ),
    r'lastRevisedAt': PropertySchema(
      id: 6,
      name: r'lastRevisedAt',
      type: IsarType.dateTime,
    ),
    r'priority': PropertySchema(
      id: 7,
      name: r'priority',
      type: IsarType.string,
      enumMap: _DaleelIsarpriorityEnumValueMap,
    ),
    r'revisionCount': PropertySchema(
      id: 8,
      name: r'revisionCount',
      type: IsarType.long,
    ),
    r'sayer': PropertySchema(
      id: 9,
      name: r'sayer',
      type: IsarType.string,
    ),
    r'surah': PropertySchema(
      id: 10,
      name: r'surah',
      type: IsarType.string,
    ),
    r'text': PropertySchema(
      id: 11,
      name: r'text',
      type: IsarType.string,
    ),
    r'textWithoutDiacritics': PropertySchema(
      id: 12,
      name: r'textWithoutDiacritics',
      type: IsarType.string,
    )
  },
  estimateSize: _daleelIsarEstimateSize,
  serialize: _daleelIsarSerialize,
  deserialize: _daleelIsarDeserialize,
  deserializeProp: _daleelIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'text': IndexSchema(
      id: 5145922347574273553,
      name: r'text',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'text',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'textWithoutDiacritics': IndexSchema(
      id: 5159495283343060294,
      name: r'textWithoutDiacritics',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'textWithoutDiacritics',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'surah': IndexSchema(
      id: 2384701842067459490,
      name: r'surah',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'surah',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {
    r'tags': LinkSchema(
      id: -1761779107899401057,
      name: r'tags',
      target: r'DaleelTagIsar',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _daleelIsarGetId,
  getLinks: _daleelIsarGetLinks,
  attach: _daleelIsarAttach,
  version: '3.1.0+1',
);

int _daleelIsarEstimateSize(
  DaleelIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.daleelType.name.length * 3;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.hadithAuthenticity;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final value = object.hadithExtraction;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.priority.name.length * 3;
  {
    final value = object.sayer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.surah;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.text.length * 3;
  {
    final value = object.textWithoutDiacritics;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _daleelIsarSerialize(
  DaleelIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.daleelType.name);
  writer.writeString(offsets[1], object.description);
  writer.writeLong(offsets[2], object.firstAya);
  writer.writeString(offsets[3], object.hadithAuthenticity?.name);
  writer.writeString(offsets[4], object.hadithExtraction);
  writer.writeLong(offsets[5], object.lastAya);
  writer.writeDateTime(offsets[6], object.lastRevisedAt);
  writer.writeString(offsets[7], object.priority.name);
  writer.writeLong(offsets[8], object.revisionCount);
  writer.writeString(offsets[9], object.sayer);
  writer.writeString(offsets[10], object.surah);
  writer.writeString(offsets[11], object.text);
  writer.writeString(offsets[12], object.textWithoutDiacritics);
}

DaleelIsar _daleelIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DaleelIsar(
    daleelType:
        _DaleelIsardaleelTypeValueEnumMap[reader.readStringOrNull(offsets[0])] ?? DaleelType.aya,
    description: reader.readStringOrNull(offsets[1]),
    firstAya: reader.readLongOrNull(offsets[2]),
    hadithAuthenticity:
        _DaleelIsarhadithAuthenticityValueEnumMap[reader.readStringOrNull(offsets[3])],
    hadithExtraction: reader.readStringOrNull(offsets[4]),
    id: id,
    lastAya: reader.readLongOrNull(offsets[5]),
    lastRevisedAt: reader.readDateTime(offsets[6]),
    priority:
        _DaleelIsarpriorityValueEnumMap[reader.readStringOrNull(offsets[7])] ?? Priority.normal,
    sayer: reader.readStringOrNull(offsets[9]),
    surah: reader.readStringOrNull(offsets[10]),
    text: reader.readString(offsets[11]),
    textWithoutDiacritics: reader.readStringOrNull(offsets[12]),
  );
  object.revisionCount = reader.readLong(offsets[8]);
  return object;
}

P _daleelIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_DaleelIsardaleelTypeValueEnumMap[reader.readStringOrNull(offset)] ?? DaleelType.aya)
          as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (_DaleelIsarhadithAuthenticityValueEnumMap[reader.readStringOrNull(offset)]) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readLongOrNull(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (_DaleelIsarpriorityValueEnumMap[reader.readStringOrNull(offset)] ?? Priority.normal)
          as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DaleelIsardaleelTypeEnumValueMap = {
  r'aya': r'aya',
  r'hadith': r'hadith',
  r'athar': r'athar',
  r'other': r'other',
};
const _DaleelIsardaleelTypeValueEnumMap = {
  r'aya': DaleelType.aya,
  r'hadith': DaleelType.hadith,
  r'athar': DaleelType.athar,
  r'other': DaleelType.other,
};
const _DaleelIsarhadithAuthenticityEnumValueMap = {
  r'sahih': r'sahih',
  r'hasan': r'hasan',
  r'daif': r'daif',
};
const _DaleelIsarhadithAuthenticityValueEnumMap = {
  r'sahih': HadithAuthenticity.sahih,
  r'hasan': HadithAuthenticity.hasan,
  r'daif': HadithAuthenticity.daif,
};
const _DaleelIsarpriorityEnumValueMap = {
  r'normal': r'normal',
  r'high': r'high',
  r'urgent': r'urgent',
};
const _DaleelIsarpriorityValueEnumMap = {
  r'normal': Priority.normal,
  r'high': Priority.high,
  r'urgent': Priority.urgent,
};

Id _daleelIsarGetId(DaleelIsar object) {
  return object.id ?? Isar.autoIncrement;
}

List<IsarLinkBase<dynamic>> _daleelIsarGetLinks(DaleelIsar object) {
  return [object.tags];
}

void _daleelIsarAttach(IsarCollection<dynamic> col, Id id, DaleelIsar object) {
  object.id = id;
  object.tags.attach(col, col.isar.collection<DaleelTagIsar>(), r'tags', id);
}

extension DaleelIsarQueryWhereSort on QueryBuilder<DaleelIsar, DaleelIsar, QWhere> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhere> anyText() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'text'),
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhere> anyTextWithoutDiacritics() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'textWithoutDiacritics'),
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhere> anySurah() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'surah'),
      );
    });
  }
}

extension DaleelIsarQueryWhere on QueryBuilder<DaleelIsar, DaleelIsar, QWhereClause> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textEqualTo(String text) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'text',
        value: [text],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textNotEqualTo(String text) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'text',
              lower: [],
              upper: [text],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'text',
              lower: [text],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'text',
              lower: [text],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'text',
              lower: [],
              upper: [text],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textGreaterThan(
    String text, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'text',
        lower: [text],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textLessThan(
    String text, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'text',
        lower: [],
        upper: [text],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textBetween(
    String lowerText,
    String upperText, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'text',
        lower: [lowerText],
        includeLower: includeLower,
        upper: [upperText],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textStartsWith(String TextPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'text',
        lower: [TextPrefix],
        upper: ['$TextPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'text',
        value: [''],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'text',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'text',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'text',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'text',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textWithoutDiacritics',
        value: [null],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textWithoutDiacritics',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsEqualTo(
      String? textWithoutDiacritics) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textWithoutDiacritics',
        value: [textWithoutDiacritics],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsNotEqualTo(
      String? textWithoutDiacritics) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textWithoutDiacritics',
              lower: [],
              upper: [textWithoutDiacritics],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textWithoutDiacritics',
              lower: [textWithoutDiacritics],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textWithoutDiacritics',
              lower: [textWithoutDiacritics],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textWithoutDiacritics',
              lower: [],
              upper: [textWithoutDiacritics],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsGreaterThan(
    String? textWithoutDiacritics, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textWithoutDiacritics',
        lower: [textWithoutDiacritics],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsLessThan(
    String? textWithoutDiacritics, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textWithoutDiacritics',
        lower: [],
        upper: [textWithoutDiacritics],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsBetween(
    String? lowerTextWithoutDiacritics,
    String? upperTextWithoutDiacritics, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textWithoutDiacritics',
        lower: [lowerTextWithoutDiacritics],
        includeLower: includeLower,
        upper: [upperTextWithoutDiacritics],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsStartsWith(
      String TextWithoutDiacriticsPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textWithoutDiacritics',
        lower: [TextWithoutDiacriticsPrefix],
        upper: ['$TextWithoutDiacriticsPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textWithoutDiacritics',
        value: [''],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> textWithoutDiacriticsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textWithoutDiacritics',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textWithoutDiacritics',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textWithoutDiacritics',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textWithoutDiacritics',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surah',
        value: [null],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surah',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahEqualTo(String? surah) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surah',
        value: [surah],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahNotEqualTo(String? surah) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surah',
              lower: [],
              upper: [surah],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surah',
              lower: [surah],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surah',
              lower: [surah],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'surah',
              lower: [],
              upper: [surah],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahGreaterThan(
    String? surah, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surah',
        lower: [surah],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahLessThan(
    String? surah, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surah',
        lower: [],
        upper: [surah],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahBetween(
    String? lowerSurah,
    String? upperSurah, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surah',
        lower: [lowerSurah],
        includeLower: includeLower,
        upper: [upperSurah],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahStartsWith(String SurahPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'surah',
        lower: [SurahPrefix],
        upper: ['$SurahPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'surah',
        value: [''],
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> surahIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'surah',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'surah',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'surah',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'surah',
              upper: [''],
            ));
      }
    });
  }
}

extension DaleelIsarQueryFilter on QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeEqualTo(
    DaleelType value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeGreaterThan(
    DaleelType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeLessThan(
    DaleelType value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeBetween(
    DaleelType lower,
    DaleelType upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'daleelType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'daleelType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daleelType',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'daleelType',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionLessThan(
    String? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> firstAyaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'firstAya',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> firstAyaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'firstAya',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> firstAyaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstAya',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> firstAyaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstAya',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> firstAyaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstAya',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> firstAyaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstAya',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hadithAuthenticity',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hadithAuthenticity',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityEqualTo(
    HadithAuthenticity? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityGreaterThan(
    HadithAuthenticity? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityLessThan(
    HadithAuthenticity? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityBetween(
    HadithAuthenticity? lower,
    HadithAuthenticity? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hadithAuthenticity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hadithAuthenticity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithAuthenticity',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithAuthenticityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hadithAuthenticity',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hadithExtraction',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hadithExtraction',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hadithExtraction',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hadithExtraction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithExtraction',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> hadithExtractionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hadithExtraction',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'id',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idEqualTo(Id? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idGreaterThan(
    Id? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idLessThan(
    Id? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idBetween(
    Id? lower,
    Id? upper, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastAyaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastAya',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastAyaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastAya',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastAyaEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastAya',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastAyaGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastAya',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastAyaLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastAya',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastAyaBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastAya',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastRevisedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRevisedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastRevisedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastRevisedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastRevisedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastRevisedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> lastRevisedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastRevisedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityEqualTo(
    Priority value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityGreaterThan(
    Priority value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityLessThan(
    Priority value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityBetween(
    Priority lower,
    Priority upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priority',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priority',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> revisionCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revisionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> revisionCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revisionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> revisionCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revisionCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> revisionCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revisionCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sayer',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sayer',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sayer',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sayer',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sayer',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sayer',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'surah',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'surah',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surah',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surah',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surah',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surah',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surah',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surah',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surah',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surah',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surah',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> surahIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surah',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'textWithoutDiacritics',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'textWithoutDiacritics',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textWithoutDiacritics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textWithoutDiacritics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textWithoutDiacritics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textWithoutDiacritics',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textWithoutDiacritics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textWithoutDiacritics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textWithoutDiacritics',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textWithoutDiacritics',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textWithoutDiacritics',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textWithoutDiacriticsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textWithoutDiacritics',
        value: '',
      ));
    });
  }
}

extension DaleelIsarQueryObject on QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> {}

extension DaleelIsarQueryLinks on QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tags(FilterQuery<DaleelTagIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tags');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', lower, includeLower, upper, includeUpper);
    });
  }
}

extension DaleelIsarQuerySortBy on QueryBuilder<DaleelIsar, DaleelIsar, QSortBy> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByDaleelType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daleelType', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByDaleelTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daleelType', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByFirstAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAya', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByFirstAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAya', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByHadithAuthenticity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByHadithAuthenticityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByHadithExtraction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByHadithExtractionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByLastAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAya', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByLastAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAya', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByLastRevisedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRevisedAt', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByLastRevisedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRevisedAt', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByRevisionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionCount', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByRevisionCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionCount', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortBySayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sayer', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortBySayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sayer', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortBySurah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surah', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortBySurahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surah', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByTextWithoutDiacritics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textWithoutDiacritics', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByTextWithoutDiacriticsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textWithoutDiacritics', Sort.desc);
    });
  }
}

extension DaleelIsarQuerySortThenBy on QueryBuilder<DaleelIsar, DaleelIsar, QSortThenBy> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByDaleelType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daleelType', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByDaleelTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'daleelType', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByFirstAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAya', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByFirstAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstAya', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByHadithAuthenticity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByHadithAuthenticityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByHadithExtraction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByHadithExtractionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByLastAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAya', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByLastAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastAya', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByLastRevisedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRevisedAt', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByLastRevisedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastRevisedAt', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByRevisionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionCount', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByRevisionCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revisionCount', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenBySayer() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sayer', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenBySayerDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sayer', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenBySurah() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surah', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenBySurahDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surah', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByText() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByTextDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'text', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByTextWithoutDiacritics() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textWithoutDiacritics', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByTextWithoutDiacriticsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textWithoutDiacritics', Sort.desc);
    });
  }
}

extension DaleelIsarQueryWhereDistinct on QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> {
  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByDaleelType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'daleelType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByFirstAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstAya');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByHadithAuthenticity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithAuthenticity', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByHadithExtraction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithExtraction', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByLastAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastAya');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByLastRevisedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastRevisedAt');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByPriority({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByRevisionCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revisionCount');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctBySayer({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sayer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctBySurah({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surah', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByText({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByTextWithoutDiacritics(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textWithoutDiacritics', caseSensitive: caseSensitive);
    });
  }
}

extension DaleelIsarQueryProperty on QueryBuilder<DaleelIsar, DaleelIsar, QQueryProperty> {
  QueryBuilder<DaleelIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DaleelIsar, DaleelType, QQueryOperations> daleelTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'daleelType');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DaleelIsar, int?, QQueryOperations> firstAyaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstAya');
    });
  }

  QueryBuilder<DaleelIsar, HadithAuthenticity?, QQueryOperations> hadithAuthenticityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithAuthenticity');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations> hadithExtractionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithExtraction');
    });
  }

  QueryBuilder<DaleelIsar, int?, QQueryOperations> lastAyaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastAya');
    });
  }

  QueryBuilder<DaleelIsar, DateTime, QQueryOperations> lastRevisedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastRevisedAt');
    });
  }

  QueryBuilder<DaleelIsar, Priority, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<DaleelIsar, int, QQueryOperations> revisionCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revisionCount');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations> sayerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sayer');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations> surahProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surah');
    });
  }

  QueryBuilder<DaleelIsar, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations> textWithoutDiacriticsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textWithoutDiacritics');
    });
  }
}
