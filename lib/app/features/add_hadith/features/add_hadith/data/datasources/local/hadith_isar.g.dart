// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hadith_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHadithIsarCollection on Isar {
  IsarCollection<HadithIsar> get hadithIsars => this.collection();
}

const HadithIsarSchema = CollectionSchema(
  name: r'HadithIsar',
  id: 7046050229736401082,
  properties: {
    r'hadithExplain': PropertySchema(
      id: 0,
      name: r'hadithExplain',
      type: IsarType.string,
    ),
    r'hadithType': PropertySchema(
      id: 1,
      name: r'hadithType',
      type: IsarType.byte,
      enumMap: _HadithIsarhadithTypeEnumValueMap,
    ),
    r'id': PropertySchema(
      id: 2,
      name: r'id',
      type: IsarType.string,
    ),
    r'isnadOfHadith': PropertySchema(
      id: 3,
      name: r'isnadOfHadith',
      type: IsarType.string,
    ),
    r'sourceOfHadith': PropertySchema(
      id: 4,
      name: r'sourceOfHadith',
      type: IsarType.string,
    ),
    r'textOfHadith': PropertySchema(
      id: 5,
      name: r'textOfHadith',
      type: IsarType.string,
    )
  },
  estimateSize: _hadithIsarEstimateSize,
  serialize: _hadithIsarSerialize,
  deserialize: _hadithIsarDeserialize,
  deserializeProp: _hadithIsarDeserializeProp,
  idName: r'cacheID',
  indexes: {
    r'textOfHadith': IndexSchema(
      id: -2687871732801950251,
      name: r'textOfHadith',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'textOfHadith',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _hadithIsarGetId,
  getLinks: _hadithIsarGetLinks,
  attach: _hadithIsarAttach,
  version: '3.1.0+1',
);

int _hadithIsarEstimateSize(
  HadithIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.hadithExplain;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.isnadOfHadith;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.sourceOfHadith;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.textOfHadith.length * 3;
  return bytesCount;
}

void _hadithIsarSerialize(
  HadithIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.hadithExplain);
  writer.writeByte(offsets[1], object.hadithType.index);
  writer.writeString(offsets[2], object.id);
  writer.writeString(offsets[3], object.isnadOfHadith);
  writer.writeString(offsets[4], object.sourceOfHadith);
  writer.writeString(offsets[5], object.textOfHadith);
}

HadithIsar _hadithIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HadithIsar(
    hadithExplain: reader.readStringOrNull(offsets[0]),
    hadithType:
        _HadithIsarhadithTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
            HadithAuthenticity.daif,
    id: reader.readString(offsets[2]),
    isnadOfHadith: reader.readStringOrNull(offsets[3]),
    sourceOfHadith: reader.readStringOrNull(offsets[4]),
    textOfHadith: reader.readString(offsets[5]),
  );
  return object;
}

P _hadithIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_HadithIsarhadithTypeValueEnumMap[
              reader.readByteOrNull(offset)] ??
          HadithAuthenticity.daif) as P;
    case 2:
      return (reader.readString(offset)) as P;
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

const _HadithIsarhadithTypeEnumValueMap = {
  'daif': 0,
  'sahih': 1,
};
const _HadithIsarhadithTypeValueEnumMap = {
  0: HadithAuthenticity.daif,
  1: HadithAuthenticity.sahih,
};

Id _hadithIsarGetId(HadithIsar object) {
  return object.cacheID;
}

List<IsarLinkBase<dynamic>> _hadithIsarGetLinks(HadithIsar object) {
  return [];
}

void _hadithIsarAttach(IsarCollection<dynamic> col, Id id, HadithIsar object) {}

extension HadithIsarQueryWhereSort
    on QueryBuilder<HadithIsar, HadithIsar, QWhere> {
  QueryBuilder<HadithIsar, HadithIsar, QAfterWhere> anyCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhere> anyTextOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'textOfHadith'),
      );
    });
  }
}

extension HadithIsarQueryWhere
    on QueryBuilder<HadithIsar, HadithIsar, QWhereClause> {
  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> cacheIDEqualTo(
      Id cacheID) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: cacheID,
        upper: cacheID,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> cacheIDNotEqualTo(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> cacheIDGreaterThan(
      Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: cacheID, includeLower: include),
      );
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> cacheIDLessThan(
      Id cacheID,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: cacheID, includeUpper: include),
      );
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> cacheIDBetween(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> textOfHadithEqualTo(
      String textOfHadith) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textOfHadith',
        value: [textOfHadith],
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause>
      textOfHadithNotEqualTo(String textOfHadith) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfHadith',
              lower: [],
              upper: [textOfHadith],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfHadith',
              lower: [textOfHadith],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfHadith',
              lower: [textOfHadith],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'textOfHadith',
              lower: [],
              upper: [textOfHadith],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause>
      textOfHadithGreaterThan(
    String textOfHadith, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfHadith',
        lower: [textOfHadith],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> textOfHadithLessThan(
    String textOfHadith, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfHadith',
        lower: [],
        upper: [textOfHadith],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause> textOfHadithBetween(
    String lowerTextOfHadith,
    String upperTextOfHadith, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfHadith',
        lower: [lowerTextOfHadith],
        includeLower: includeLower,
        upper: [upperTextOfHadith],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause>
      textOfHadithStartsWith(String TextOfHadithPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'textOfHadith',
        lower: [TextOfHadithPrefix],
        upper: ['$TextOfHadithPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause>
      textOfHadithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'textOfHadith',
        value: [''],
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterWhereClause>
      textOfHadithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textOfHadith',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textOfHadith',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'textOfHadith',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'textOfHadith',
              upper: [''],
            ));
      }
    });
  }
}

extension HadithIsarQueryFilter
    on QueryBuilder<HadithIsar, HadithIsar, QFilterCondition> {
  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> cacheIDEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cacheID',
        value: value,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> cacheIDLessThan(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> cacheIDBetween(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hadithExplain',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hadithExplain',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hadithExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hadithExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hadithExplain',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hadithExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hadithExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hadithExplain',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hadithExplain',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithExplain',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithExplainIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hadithExplain',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> hadithTypeEqualTo(
      HadithAuthenticity value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hadithType',
        value: value,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithTypeGreaterThan(
    HadithAuthenticity value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hadithType',
        value: value,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      hadithTypeLessThan(
    HadithAuthenticity value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hadithType',
        value: value,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> hadithTypeBetween(
    HadithAuthenticity lower,
    HadithAuthenticity upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hadithType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idStartsWith(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idContains(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idMatches(
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

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isnadOfHadith',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isnadOfHadith',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isnadOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isnadOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isnadOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isnadOfHadith',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'isnadOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'isnadOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'isnadOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'isnadOfHadith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isnadOfHadith',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      isnadOfHadithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'isnadOfHadith',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'sourceOfHadith',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'sourceOfHadith',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sourceOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sourceOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sourceOfHadith',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sourceOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sourceOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sourceOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sourceOfHadith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sourceOfHadith',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      sourceOfHadithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sourceOfHadith',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'textOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'textOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'textOfHadith',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'textOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'textOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'textOfHadith',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'textOfHadith',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'textOfHadith',
        value: '',
      ));
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterFilterCondition>
      textOfHadithIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'textOfHadith',
        value: '',
      ));
    });
  }
}

extension HadithIsarQueryObject
    on QueryBuilder<HadithIsar, HadithIsar, QFilterCondition> {}

extension HadithIsarQueryLinks
    on QueryBuilder<HadithIsar, HadithIsar, QFilterCondition> {}

extension HadithIsarQuerySortBy
    on QueryBuilder<HadithIsar, HadithIsar, QSortBy> {
  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByHadithExplain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExplain', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByHadithExplainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExplain', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByHadithType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithType', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByHadithTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithType', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByIsnadOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isnadOfHadith', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByIsnadOfHadithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isnadOfHadith', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortBySourceOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceOfHadith', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy>
      sortBySourceOfHadithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceOfHadith', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByTextOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfHadith', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> sortByTextOfHadithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfHadith', Sort.desc);
    });
  }
}

extension HadithIsarQuerySortThenBy
    on QueryBuilder<HadithIsar, HadithIsar, QSortThenBy> {
  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByCacheID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByCacheIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cacheID', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByHadithExplain() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExplain', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByHadithExplainDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithExplain', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByHadithType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithType', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByHadithTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hadithType', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByIsnadOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isnadOfHadith', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByIsnadOfHadithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isnadOfHadith', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenBySourceOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceOfHadith', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy>
      thenBySourceOfHadithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sourceOfHadith', Sort.desc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByTextOfHadith() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfHadith', Sort.asc);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QAfterSortBy> thenByTextOfHadithDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'textOfHadith', Sort.desc);
    });
  }
}

extension HadithIsarQueryWhereDistinct
    on QueryBuilder<HadithIsar, HadithIsar, QDistinct> {
  QueryBuilder<HadithIsar, HadithIsar, QDistinct> distinctByHadithExplain(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithExplain',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QDistinct> distinctByHadithType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hadithType');
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QDistinct> distinctByIsnadOfHadith(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isnadOfHadith',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QDistinct> distinctBySourceOfHadith(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sourceOfHadith',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HadithIsar, HadithIsar, QDistinct> distinctByTextOfHadith(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'textOfHadith', caseSensitive: caseSensitive);
    });
  }
}

extension HadithIsarQueryProperty
    on QueryBuilder<HadithIsar, HadithIsar, QQueryProperty> {
  QueryBuilder<HadithIsar, int, QQueryOperations> cacheIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cacheID');
    });
  }

  QueryBuilder<HadithIsar, String?, QQueryOperations> hadithExplainProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithExplain');
    });
  }

  QueryBuilder<HadithIsar, HadithAuthenticity, QQueryOperations>
      hadithTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hadithType');
    });
  }

  QueryBuilder<HadithIsar, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HadithIsar, String?, QQueryOperations> isnadOfHadithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isnadOfHadith');
    });
  }

  QueryBuilder<HadithIsar, String?, QQueryOperations> sourceOfHadithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sourceOfHadith');
    });
  }

  QueryBuilder<HadithIsar, String, QQueryOperations> textOfHadithProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'textOfHadith');
    });
  }
}
