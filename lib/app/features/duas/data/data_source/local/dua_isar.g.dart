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
    r'explanation': PropertySchema(
      id: 0,
      name: r'explanation',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'numOfRepeat': PropertySchema(
      id: 2,
      name: r'numOfRepeat',
      type: IsarType.string,
    ),
    r'priority': PropertySchema(
      id: 3,
      name: r'priority',
      type: IsarType.string,
    ),
    r'reward': PropertySchema(
      id: 4,
      name: r'reward',
      type: IsarType.string,
    ),
    r'textOfDua': PropertySchema(
      id: 5,
      name: r'textOfDua',
      type: IsarType.string,
    )
  },
  estimateSize: _duaIsarEstimateSize,
  serialize: _duaIsarSerialize,
  deserialize: _duaIsarDeserialize,
  deserializeProp: _duaIsarDeserializeProp,
  idName: r'cacheID',
  indexes: {
    r'textOfDua': IndexSchema(
      id: -4377764223268392704,
      name: r'textOfDua',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'textOfDua',
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
    final value = object.explanation;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.numOfRepeat;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.priority;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.reward;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.textOfDua.length * 3;
  return bytesCount;
}

void _duaIsarSerialize(
  DuaIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.explanation);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.numOfRepeat);
  writer.writeString(offsets[3], object.priority);
  writer.writeString(offsets[4], object.reward);
  writer.writeString(offsets[5], object.textOfDua);
}

DuaIsar _duaIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DuaIsar(
    explanation: reader.readStringOrNull(offsets[0]),
    id: reader.readString(offsets[1]),
    numOfRepeat: reader.readStringOrNull(offsets[2]),
    priority: reader.readStringOrNull(offsets[3]),
    reward: reader.readStringOrNull(offsets[4]),
    textOfDua: reader.readString(offsets[5]),
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
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

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

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhere> anyTextOfDua() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'textOfDua'),
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaEqualTo(
      String textOfDua) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textOfDua',
        value: [textOfDua],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaNotEqualTo(
      String textOfDua) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfDua',
              lower: [],
              upper: [textOfDua],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfDua',
              lower: [textOfDua],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfDua',
              lower: [textOfDua],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfDua',
              lower: [],
              upper: [textOfDua],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaGreaterThan(
    String textOfDua, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfDua',
        lower: [textOfDua],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaLessThan(
    String textOfDua, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfDua',
        lower: [],
        upper: [textOfDua],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaBetween(
    String lowerTextOfDua,
    String upperTextOfDua, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfDua',
        lower: [lowerTextOfDua],
        includeLower: includeLower,
        upper: [upperTextOfDua],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaStartsWith(
      String TextOfDuaPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfDua',
        lower: [TextOfDuaPrefix],
        upper: ['$TextOfDuaPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textOfDua',
        value: [''],
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterWhereClause> textOfDuaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textOfDua',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textOfDua',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textOfDua',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textOfDua',
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'explanation',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'explanation',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'explanation',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'explanation',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'explanation',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> explanationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'explanation',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition>
      explanationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'explanation',
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numOfRepeat',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numOfRepeat',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numOfRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numOfRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numOfRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numOfRepeat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numOfRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numOfRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numOfRepeat',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numOfRepeat',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> numOfRepeatIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numOfRepeat',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition>
      numOfRepeatIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numOfRepeat',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'priority',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'priority',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> priorityEqualTo(
    String? value, {
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
    String? value, {
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
    String? value, {
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
    String? lower,
    String? upper, {
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textOfDua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textOfDua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textOfDua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textOfDua',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textOfDua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textOfDua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textOfDua',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textOfDua',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textOfDua',
        value: '',
      ));
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterFilterCondition> textOfDuaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textOfDua',
        value: '',
      ));
    });
  }
}

extension DuaIsarQueryObject
    on QueryBuilder<DuaIsar, DuaIsar, QFilterCondition> {}

extension DuaIsarQueryLinks
    on QueryBuilder<DuaIsar, DuaIsar, QFilterCondition> {}

extension DuaIsarQuerySortBy on QueryBuilder<DuaIsar, DuaIsar, QSortBy> {
  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByNumOfRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfRepeat', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByNumOfRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfRepeat', Sort.desc);
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByTextOfDua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfDua', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> sortByTextOfDuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfDua', Sort.desc);
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByExplanation() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByExplanationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'explanation', Sort.desc);
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByNumOfRepeat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfRepeat', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByNumOfRepeatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numOfRepeat', Sort.desc);
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

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByTextOfDua() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfDua', Sort.asc);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QAfterSortBy> thenByTextOfDuaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfDua', Sort.desc);
    });
  }
}

extension DuaIsarQueryWhereDistinct
    on QueryBuilder<DuaIsar, DuaIsar, QDistinct> {
  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByExplanation(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'explanation', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByNumOfRepeat(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numOfRepeat', caseSensitive: caseSensitive);
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

  QueryBuilder<DuaIsar, DuaIsar, QDistinct> distinctByTextOfDua(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textOfDua', caseSensitive: caseSensitive);
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

  QueryBuilder<DuaIsar, String?, QQueryOperations> explanationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'explanation');
    });
  }

  QueryBuilder<DuaIsar, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DuaIsar, String?, QQueryOperations> numOfRepeatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numOfRepeat');
    });
  }

  QueryBuilder<DuaIsar, String?, QQueryOperations> priorityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priority');
    });
  }

  QueryBuilder<DuaIsar, String?, QQueryOperations> rewardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reward');
    });
  }

  QueryBuilder<DuaIsar, String, QQueryOperations> textOfDuaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textOfDua');
    });
  }
}
