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
    r'hadithAuthenticity': PropertySchema(
      id: 2,
      name: r'hadithAuthenticity',
      type: IsarType.string,
      enumMap: _DaleelIsarhadithAuthenticityEnumValueMap,
    ),
    r'hadithExtraction': PropertySchema(
      id: 3,
      name: r'hadithExtraction',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.string,
    ),
    r'lastRevisedAt': PropertySchema(
      id: 5,
      name: r'lastRevisedAt',
      type: IsarType.dateTime,
    ),
    r'priority': PropertySchema(
      id: 6,
      name: r'priority',
      type: IsarType.string,
      enumMap: _DaleelIsarpriorityEnumValueMap,
    ),
    r'sayer': PropertySchema(
      id: 7,
      name: r'sayer',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 8,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'text': PropertySchema(
      id: 9,
      name: r'text',
      type: IsarType.string,
    )
  },
  estimateSize: _daleelIsarEstimateSize,
  serialize: _daleelIsarSerialize,
  deserialize: _daleelIsarDeserialize,
  deserializeProp: _daleelIsarDeserializeProp,
  idName: r'cacheID',
  indexes: {},
  links: {},
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
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.priority.name.length * 3;
  {
    final value = object.sayer;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.text.length * 3;
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
  writer.writeString(offsets[2], object.hadithAuthenticity?.name);
  writer.writeString(offsets[3], object.hadithExtraction);
  writer.writeString(offsets[4], object.id);
  writer.writeDateTime(offsets[5], object.lastRevisedAt);
  writer.writeString(offsets[6], object.priority.name);
  writer.writeString(offsets[7], object.sayer);
  writer.writeStringList(offsets[8], object.tags);
  writer.writeString(offsets[9], object.text);
}

DaleelIsar _daleelIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DaleelIsar(
    daleelType: _DaleelIsardaleelTypeValueEnumMap[
            reader.readStringOrNull(offsets[0])] ??
        DaleelType.hadith,
    description: reader.readStringOrNull(offsets[1]),
    hadithAuthenticity: _DaleelIsarhadithAuthenticityValueEnumMap[
        reader.readStringOrNull(offsets[2])],
    hadithExtraction: reader.readStringOrNull(offsets[3]),
    id: reader.readString(offsets[4]),
    lastRevisedAt: reader.readDateTimeOrNull(offsets[5]),
    priority:
        _DaleelIsarpriorityValueEnumMap[reader.readStringOrNull(offsets[6])] ??
            Priority.urgent,
    sayer: reader.readStringOrNull(offsets[7]),
    tags: reader.readStringList(offsets[8]) ?? [],
    text: reader.readString(offsets[9]),
  );
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
      return (_DaleelIsardaleelTypeValueEnumMap[
              reader.readStringOrNull(offset)] ??
          DaleelType.hadith) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (_DaleelIsarhadithAuthenticityValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (_DaleelIsarpriorityValueEnumMap[
              reader.readStringOrNull(offset)] ??
          Priority.urgent) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DaleelIsardaleelTypeEnumValueMap = {
  r'hadith': r'hadith',
};
const _DaleelIsardaleelTypeValueEnumMap = {
  r'hadith': DaleelType.hadith,
};
const _DaleelIsarhadithAuthenticityEnumValueMap = {
  r'daif': r'daif',
  r'hasan': r'hasan',
  r'sahih': r'sahih',
};
const _DaleelIsarhadithAuthenticityValueEnumMap = {
  r'daif': HadithAuthenticity.daif,
  r'hasan': HadithAuthenticity.hasan,
  r'sahih': HadithAuthenticity.sahih,
};
const _DaleelIsarpriorityEnumValueMap = {
  r'urgent': r'urgent',
  r'high': r'high',
  r'normal': r'normal',
};
const _DaleelIsarpriorityValueEnumMap = {
  r'urgent': Priority.urgent,
  r'high': Priority.high,
  r'normal': Priority.normal,
};

Id _daleelIsarGetId(DaleelIsar object) {
  return object.cacheID;
}

List<IsarLinkBase<dynamic>> _daleelIsarGetLinks(DaleelIsar object) {
  return [];
}

void _daleelIsarAttach(IsarCollection<dynamic> col, Id id, DaleelIsar object) {}

extension DaleelIsarQueryWhereSort
    on QueryBuilder<DaleelIsar, DaleelIsar, QWhere> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhere> anyCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DaleelIsarQueryWhere
    on QueryBuilder<DaleelIsar, DaleelIsar, QWhereClause> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> cacheIDEqualTo(
      Id cacheID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: cacheID,
        upper: cacheID,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> cacheIDNotEqualTo(
      Id cacheID) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: cacheID, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: cacheID, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: cacheID, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: cacheID, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> cacheIDGreaterThan(
      Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: cacheID, includeLower: include),
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> cacheIDLessThan(
      Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: cacheID, includeUpper: include),
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterWhereClause> cacheIDBetween(
    Id lowerCacheID,
    Id upperCacheID, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerCacheID,
        includeLower: includeLower,
        upper: upperCacheID,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DaleelIsarQueryFilter
    on QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> cacheIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheID',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      cacheIDGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cacheID',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> cacheIDLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cacheID',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> cacheIDBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cacheID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeGreaterThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeLessThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeStartsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeEndsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'daleelType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> daleelTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'daleelType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'daleelType',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      daleelTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'daleelType',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionEqualTo(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionGreaterThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionLessThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionBetween(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionStartsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionEndsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hadithAuthenticity',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hadithAuthenticity',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityEqualTo(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityGreaterThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityLessThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityBetween(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityStartsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityEndsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hadithAuthenticity',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hadithAuthenticity',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithAuthenticity',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithAuthenticityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hadithAuthenticity',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hadithExtraction',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hadithExtraction',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionEqualTo(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionGreaterThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionLessThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionBetween(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionStartsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionEndsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hadithExtraction',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hadithExtraction',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithExtraction',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      hadithExtractionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hadithExtraction',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      lastRevisedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastRevisedAt',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      lastRevisedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastRevisedAt',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      lastRevisedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastRevisedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      lastRevisedAtGreaterThan(
    DateTime? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      lastRevisedAtLessThan(
    DateTime? value, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      lastRevisedAtBetween(
    DateTime? lower,
    DateTime? upper, {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      priorityGreaterThan(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      priorityStartsWith(
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priority',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> priorityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priority',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      priorityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      priorityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priority',
        value: '',
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sayer',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> sayerMatches(
      String pattern,
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      sayerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sayer',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterFilterCondition> textMatches(
      String pattern,
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
}

extension DaleelIsarQueryObject
    on QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> {}

extension DaleelIsarQueryLinks
    on QueryBuilder<DaleelIsar, DaleelIsar, QFilterCondition> {}

extension DaleelIsarQuerySortBy
    on QueryBuilder<DaleelIsar, DaleelIsar, QSortBy> {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy>
      sortByHadithAuthenticity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy>
      sortByHadithAuthenticityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByHadithExtraction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy>
      sortByHadithExtractionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
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
}

extension DaleelIsarQuerySortThenBy
    on QueryBuilder<DaleelIsar, DaleelIsar, QSortThenBy> {
  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByCacheIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.desc);
    });
  }

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

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy>
      thenByHadithAuthenticity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy>
      thenByHadithAuthenticityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithAuthenticity', Sort.desc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy> thenByHadithExtraction() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExtraction', Sort.asc);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QAfterSortBy>
      thenByHadithExtractionDesc() {
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
}

extension DaleelIsarQueryWhereDistinct
    on QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> {
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

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByHadithAuthenticity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithAuthenticity',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByHadithExtraction(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithExtraction',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByLastRevisedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastRevisedAt');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByPriority(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctBySayer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sayer', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<DaleelIsar, DaleelIsar, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'text', caseSensitive: caseSensitive);
    });
  }
}

extension DaleelIsarQueryProperty
    on QueryBuilder<DaleelIsar, DaleelIsar, QQueryProperty> {
  QueryBuilder<DaleelIsar, int, QQueryOperations> cacheIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheID');
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

  QueryBuilder<DaleelIsar, HadithAuthenticity?, QQueryOperations>
      hadithAuthenticityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithAuthenticity');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations>
      hadithExtractionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithExtraction');
    });
  }

  QueryBuilder<DaleelIsar, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DaleelIsar, DateTime?, QQueryOperations>
      lastRevisedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastRevisedAt');
    });
  }

  QueryBuilder<DaleelIsar, Priority, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<DaleelIsar, String?, QQueryOperations> sayerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sayer');
    });
  }

  QueryBuilder<DaleelIsar, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<DaleelIsar, String, QQueryOperations> textProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'text');
    });
  }
}
