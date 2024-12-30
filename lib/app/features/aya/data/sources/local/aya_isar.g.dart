// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aya_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAyaIsarCollection on Isar {
  IsarCollection<AyaIsar> get ayaIsars => this.collection();
}

const AyaIsarSchema = CollectionSchema(
  name: r'AyaIsar',
  id: 6921568389467913482,
  properties: {
    r'ayaExplain': PropertySchema(
      id: 0,
      name: r'ayaExplain',
      type: IsarType.string,
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.string,
    ),
    r'nomOfAya': PropertySchema(
      id: 2,
      name: r'nomOfAya',
      type: IsarType.string,
    ),
    r'surahOfAya': PropertySchema(
      id: 3,
      name: r'surahOfAya',
      type: IsarType.string,
    ),
    r'textOfAya': PropertySchema(
      id: 4,
      name: r'textOfAya',
      type: IsarType.string,
    )
  },
  estimateSize: _ayaIsarEstimateSize,
  serialize: _ayaIsarSerialize,
  deserialize: _ayaIsarDeserialize,
  deserializeProp: _ayaIsarDeserializeProp,
  idName: r'cacheID',
  indexes: {
    r'textOfAya': IndexSchema(
      id: 9151667967945642159,
      name: r'textOfAya',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'textOfAya',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _ayaIsarGetId,
  getLinks: _ayaIsarGetLinks,
  attach: _ayaIsarAttach,
  version: '3.1.0+1',
);

int _ayaIsarEstimateSize(
  AyaIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.ayaExplain;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.nomOfAya.length * 3;
  bytesCount += 3 + object.surahOfAya.length * 3;
  bytesCount += 3 + object.textOfAya.length * 3;
  return bytesCount;
}

void _ayaIsarSerialize(
  AyaIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.ayaExplain);
  writer.writeString(offsets[1], object.id);
  writer.writeString(offsets[2], object.nomOfAya);
  writer.writeString(offsets[3], object.surahOfAya);
  writer.writeString(offsets[4], object.textOfAya);
}

AyaIsar _ayaIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AyaIsar(
    ayaExplain: reader.readStringOrNull(offsets[0]),
    id: reader.readString(offsets[1]),
    nomOfAya: reader.readString(offsets[2]),
    surahOfAya: reader.readString(offsets[3]),
    textOfAya: reader.readString(offsets[4]),
  );
  return object;
}

P _ayaIsarDeserializeProp<P>(
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
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _ayaIsarGetId(AyaIsar object) {
  return object.cacheID;
}

List<IsarLinkBase<dynamic>> _ayaIsarGetLinks(AyaIsar object) {
  return [];
}

void _ayaIsarAttach(IsarCollection<dynamic> col, Id id, AyaIsar object) {}

extension AyaIsarQueryWhereSort on QueryBuilder<AyaIsar, AyaIsar, QWhere> {
  QueryBuilder<AyaIsar, AyaIsar, QAfterWhere> anyCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhere> anyTextOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'textOfAya'),
      );
    });
  }
}

extension AyaIsarQueryWhere on QueryBuilder<AyaIsar, AyaIsar, QWhereClause> {
  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> cacheIDEqualTo(Id cacheID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: cacheID,
        upper: cacheID,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> cacheIDNotEqualTo(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> cacheIDGreaterThan(
      Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: cacheID, includeLower: include),
      );
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> cacheIDLessThan(Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: cacheID, includeUpper: include),
      );
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> cacheIDBetween(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaEqualTo(
      String textOfAya) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textOfAya',
        value: [textOfAya],
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaNotEqualTo(
      String textOfAya) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfAya',
              lower: [],
              upper: [textOfAya],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfAya',
              lower: [textOfAya],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfAya',
              lower: [textOfAya],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfAya',
              lower: [],
              upper: [textOfAya],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaGreaterThan(
    String textOfAya, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfAya',
        lower: [textOfAya],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaLessThan(
    String textOfAya, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfAya',
        lower: [],
        upper: [textOfAya],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaBetween(
    String lowerTextOfAya,
    String upperTextOfAya, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfAya',
        lower: [lowerTextOfAya],
        includeLower: includeLower,
        upper: [upperTextOfAya],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaStartsWith(
      String TextOfAyaPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfAya',
        lower: [TextOfAyaPrefix],
        upper: ['$TextOfAyaPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textOfAya',
        value: [''],
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterWhereClause> textOfAyaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textOfAya',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textOfAya',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textOfAya',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textOfAya',
              upper: [''],
            ));
      }
    });
  }
}

extension AyaIsarQueryFilter
    on QueryBuilder<AyaIsar, AyaIsar, QFilterCondition> {
  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ayaExplain',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ayaExplain',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayaExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ayaExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ayaExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ayaExplain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ayaExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ayaExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ayaExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ayaExplain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ayaExplain',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> ayaExplainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ayaExplain',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> cacheIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheID',
        value: value,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> cacheIDGreaterThan(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> cacheIDLessThan(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> cacheIDBetween(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idMatches(
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

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nomOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nomOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nomOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nomOfAya',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nomOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nomOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nomOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nomOfAya',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nomOfAya',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> nomOfAyaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nomOfAya',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'surahOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'surahOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'surahOfAya',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'surahOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'surahOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'surahOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'surahOfAya',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'surahOfAya',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> surahOfAyaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'surahOfAya',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textOfAya',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textOfAya',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textOfAya',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textOfAya',
        value: '',
      ));
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterFilterCondition> textOfAyaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textOfAya',
        value: '',
      ));
    });
  }
}

extension AyaIsarQueryObject
    on QueryBuilder<AyaIsar, AyaIsar, QFilterCondition> {}

extension AyaIsarQueryLinks
    on QueryBuilder<AyaIsar, AyaIsar, QFilterCondition> {}

extension AyaIsarQuerySortBy on QueryBuilder<AyaIsar, AyaIsar, QSortBy> {
  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByAyaExplain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayaExplain', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByAyaExplainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayaExplain', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByNomOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomOfAya', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByNomOfAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomOfAya', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortBySurahOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahOfAya', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortBySurahOfAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahOfAya', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByTextOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfAya', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> sortByTextOfAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfAya', Sort.desc);
    });
  }
}

extension AyaIsarQuerySortThenBy
    on QueryBuilder<AyaIsar, AyaIsar, QSortThenBy> {
  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByAyaExplain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayaExplain', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByAyaExplainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ayaExplain', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByCacheIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByNomOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomOfAya', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByNomOfAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nomOfAya', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenBySurahOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahOfAya', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenBySurahOfAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'surahOfAya', Sort.desc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByTextOfAya() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfAya', Sort.asc);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QAfterSortBy> thenByTextOfAyaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfAya', Sort.desc);
    });
  }
}

extension AyaIsarQueryWhereDistinct
    on QueryBuilder<AyaIsar, AyaIsar, QDistinct> {
  QueryBuilder<AyaIsar, AyaIsar, QDistinct> distinctByAyaExplain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ayaExplain', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QDistinct> distinctByNomOfAya(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nomOfAya', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QDistinct> distinctBySurahOfAya(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'surahOfAya', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AyaIsar, AyaIsar, QDistinct> distinctByTextOfAya(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textOfAya', caseSensitive: caseSensitive);
    });
  }
}

extension AyaIsarQueryProperty
    on QueryBuilder<AyaIsar, AyaIsar, QQueryProperty> {
  QueryBuilder<AyaIsar, int, QQueryOperations> cacheIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheID');
    });
  }

  QueryBuilder<AyaIsar, String?, QQueryOperations> ayaExplainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ayaExplain');
    });
  }

  QueryBuilder<AyaIsar, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AyaIsar, String, QQueryOperations> nomOfAyaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nomOfAya');
    });
  }

  QueryBuilder<AyaIsar, String, QQueryOperations> surahOfAyaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'surahOfAya');
    });
  }

  QueryBuilder<AyaIsar, String, QQueryOperations> textOfAyaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textOfAya');
    });
  }
}
