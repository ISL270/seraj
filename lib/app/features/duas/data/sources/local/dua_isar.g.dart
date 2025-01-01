// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dua_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDuaIsarCollection on Isar {
  IsarCollection<DuaIsar> get duaIsars => this.collection();
}

const DuaIsarSchema = CollectionSchema(
  name: r'DuaIsar',
  id: 4882758208056914724,
  properties: {
    r'description': PropertySchema(
      id: 0,
      name: r'description',
      type: IsarType.string,
    ),
    r'dua': PropertySchema(
      id: 1,
      name: r'dua',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 3,
      name: r'priority',
      type: IsarType.string,
      enumMap: _DuaIsarpriorityEnumValueMap,
    ),
    r'reward': PropertySchema(
      id: 4,
      name: r'reward',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 5,
      name: r'tags',
      type: IsarType.stringList,
    )
  },
  estimateSize: _duaIsarEstimateSize,
  serialize: _duaIsarSerialize,
  deserialize: _duaIsarDeserialize,
  deserializeProp: _duaIsarDeserializeProp,
  idName: r'cacheID',
  indexes: {
    r'dua': IndexSchema(
      id: -7304514917685321235,
      name: r'dua',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'dua',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _duaIsarGetId,
  getLinks: _duaIsarGetLinks,
  attach: _duaIsarAttach,
  version: '3.1.0+1',
);

int _duaIsarEstimateSize(
  DuaIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.dua.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.priority.name.length * 3;
  {
    final value = object.reward;
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
  return bytesCount;
}

void _duaIsarSerialize(
  DuaIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.description);
  writer.writeString(offsets[1], object.dua);
  writer.writeString(offsets[2], object.id);
  writer.writeString(offsets[3], object.priority.name);
  writer.writeString(offsets[4], object.reward);
  writer.writeStringList(offsets[5], object.tags);
}

DuaIsar _duaIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DuaIsar(
    description: reader.readStringOrNull(offsets[0]),
    dua: reader.readString(offsets[1]),
    id: reader.readString(offsets[2]),
    priority:
        _DuaIsarpriorityValueEnumMap[reader.readStringOrNull(offsets[3])] ??
            Priority.urgent,
    reward: reader.readStringOrNull(offsets[4]),
    tags: reader.readStringList(offsets[5]) ?? [],
  );
  return object;
}

P _duaIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (_DuaIsarpriorityValueEnumMap[reader.readStringOrNull(offset)] ??
          Priority.urgent) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _DuaIsarpriorityEnumValueMap = {
  r'urgent': r'urgent',
  r'high': r'high',
  r'normal': r'normal',
};
const _DuaIsarpriorityValueEnumMap = {
  r'urgent': Priority.urgent,
  r'high': Priority.high,
  r'normal': Priority.normal,
};

Id _duaIsarGetId(DuaIsar object) {
  return object.cacheID;
}

List<IsarLinkBase<dynamic>> _duaIsarGetLinks(DuaIsar object) {
  return [];
}

void _duaIsarAttach(IsarCollection<dynamic> col, Id id, DuaIsar object) {}

extension DuaIsarQueryWhereSort on QueryBuilder<DuaIsar, DuaIsar, QWhere> {
  QueryBuilder<DuaIsar, DuaIsar, QAfterWhere> anyCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhere> anyDua() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dua'),
      );
    });
  }
}

extension DuaIsarQueryWhere on QueryBuilder<DuaIsar, DuaIsar, QWhereClause> {
  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> cacheIDEqualTo(Id cacheID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: cacheID,
        upper: cacheID,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> cacheIDNotEqualTo(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> cacheIDGreaterThan(
      Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: cacheID, includeLower: include),
      );
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> cacheIDLessThan(Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: cacheID, includeUpper: include),
      );
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> cacheIDBetween(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaEqualTo(String dua) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dua',
        value: [dua],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaNotEqualTo(String dua) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dua',
              lower: [],
              upper: [dua],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dua',
              lower: [dua],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dua',
              lower: [dua],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dua',
              lower: [],
              upper: [dua],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaGreaterThan(
    String dua, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dua',
        lower: [dua],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaLessThan(
    String dua, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dua',
        lower: [],
        upper: [dua],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaBetween(
    String lowerDua,
    String upperDua, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dua',
        lower: [lowerDua],
        includeLower: includeLower,
        upper: [upperDua],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaStartsWith(
      String DuaPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dua',
        lower: [DuaPrefix],
        upper: ['$DuaPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dua',
        value: [''],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> duaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'dua',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'dua',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'dua',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'dua',
              upper: [''],
            ));
      }
    });
  }
}

extension DuaIsarQueryFilter
    on QueryBuilder<DuaIsar, DuaIsar, QFilterCondition> {
  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> cacheIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheID',
        value: value,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> cacheIDGreaterThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> cacheIDLessThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> cacheIDBetween(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'description',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionEqualTo(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionGreaterThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionLessThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionBetween(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionStartsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionEndsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionContains(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionMatches(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dua',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'dua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'dua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'dua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'dua',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dua',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> duaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'dua',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idMatches(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityEqualTo(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityGreaterThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityLessThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityBetween(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityStartsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityEndsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityContains(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityMatches(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priority',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'reward',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'reward',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reward',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'reward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'reward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'reward',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'reward',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reward',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> rewardIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'reward',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementEqualTo(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementGreaterThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementLessThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementBetween(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementStartsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementEndsWith(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsLengthEqualTo(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsIsEmpty() {
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsIsNotEmpty() {
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsLengthLessThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsLengthGreaterThan(
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> tagsLengthBetween(
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
}

extension DuaIsarQueryObject
    on QueryBuilder<DuaIsar, DuaIsar, QFilterCondition> {}

extension DuaIsarQueryLinks
    on QueryBuilder<DuaIsar, DuaIsar, QFilterCondition> {}

extension DuaIsarQuerySortBy on QueryBuilder<DuaIsar, DuaIsar, QSortBy> {
  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByDua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dua', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByDuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dua', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reward', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reward', Sort.desc);
    });
  }
}

extension DuaIsarQuerySortThenBy
    on QueryBuilder<DuaIsar, DuaIsar, QSortThenBy> {
  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByCacheIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByDua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dua', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByDuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dua', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByPriority() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByPriorityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'priority', Sort.desc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reward', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reward', Sort.desc);
    });
  }
}

extension DuaIsarQueryWhereDistinct
    on QueryBuilder<DuaIsar, DuaIsar, QDistinct> {
  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByDua(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dua', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByPriority(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priority', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByReward(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reward', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }
}

extension DuaIsarQueryProperty
    on QueryBuilder<DuaIsar, DuaIsar, QQueryProperty> {
  QueryBuilder<DuaIsar, int, QQueryOperations> cacheIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheID');
    });
  }

  QueryBuilder<DuaIsar, String?, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DuaIsar, String, QQueryOperations> duaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dua');
    });
  }

  QueryBuilder<DuaIsar, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DuaIsar, Priority, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<DuaIsar, String?, QQueryOperations> rewardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reward');
    });
  }

  QueryBuilder<DuaIsar, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }
}
