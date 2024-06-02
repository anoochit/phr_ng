// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pressure.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBloodPressureCollection on Isar {
  IsarCollection<BloodPressure> get bloodPressures => this.collection();
}

const BloodPressureSchema = CollectionSchema(
  name: r'BloodPressure',
  id: 3877720761352349416,
  properties: {
    r'diastolic': PropertySchema(
      id: 0,
      name: r'diastolic',
      type: IsarType.long,
    ),
    r'pulse': PropertySchema(
      id: 1,
      name: r'pulse',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BloodPressurestatusEnumValueMap,
    ),
    r'systolic': PropertySchema(
      id: 3,
      name: r'systolic',
      type: IsarType.long,
    ),
    r'timpstamp': PropertySchema(
      id: 4,
      name: r'timpstamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _bloodPressureEstimateSize,
  serialize: _bloodPressureSerialize,
  deserialize: _bloodPressureDeserialize,
  deserializeProp: _bloodPressureDeserializeProp,
  idName: r'id',
  indexes: {
    r'timpstamp': IndexSchema(
      id: 7357102950955934196,
      name: r'timpstamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timpstamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bloodPressureGetId,
  getLinks: _bloodPressureGetLinks,
  attach: _bloodPressureAttach,
  version: '3.1.0+1',
);

int _bloodPressureEstimateSize(
  BloodPressure object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _bloodPressureSerialize(
  BloodPressure object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.diastolic);
  writer.writeLong(offsets[1], object.pulse);
  writer.writeByte(offsets[2], object.status.index);
  writer.writeLong(offsets[3], object.systolic);
  writer.writeDateTime(offsets[4], object.timpstamp);
}

BloodPressure _bloodPressureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BloodPressure();
  object.diastolic = reader.readLong(offsets[0]);
  object.id = id;
  object.pulse = reader.readLong(offsets[1]);
  object.status =
      _BloodPressurestatusValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          BloodPresureStatus.hypo;
  object.systolic = reader.readLong(offsets[3]);
  object.timpstamp = reader.readDateTime(offsets[4]);
  return object;
}

P _bloodPressureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (_BloodPressurestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BloodPresureStatus.hypo) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BloodPressurestatusEnumValueMap = {
  'hypo': 0,
  'normal': 1,
  'preHyper': 2,
  'hyperState1': 3,
  'hyperState2': 4,
};
const _BloodPressurestatusValueEnumMap = {
  0: BloodPresureStatus.hypo,
  1: BloodPresureStatus.normal,
  2: BloodPresureStatus.preHyper,
  3: BloodPresureStatus.hyperState1,
  4: BloodPresureStatus.hyperState2,
};

Id _bloodPressureGetId(BloodPressure object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bloodPressureGetLinks(BloodPressure object) {
  return [];
}

void _bloodPressureAttach(
    IsarCollection<dynamic> col, Id id, BloodPressure object) {
  object.id = id;
}

extension BloodPressureQueryWhereSort
    on QueryBuilder<BloodPressure, BloodPressure, QWhere> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhere> anyTimpstamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timpstamp'),
      );
    });
  }
}

extension BloodPressureQueryWhere
    on QueryBuilder<BloodPressure, BloodPressure, QWhereClause> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause> idBetween(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause>
      timpstampEqualTo(DateTime timpstamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timpstamp',
        value: [timpstamp],
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause>
      timpstampNotEqualTo(DateTime timpstamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timpstamp',
              lower: [],
              upper: [timpstamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timpstamp',
              lower: [timpstamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timpstamp',
              lower: [timpstamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timpstamp',
              lower: [],
              upper: [timpstamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause>
      timpstampGreaterThan(
    DateTime timpstamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timpstamp',
        lower: [timpstamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause>
      timpstampLessThan(
    DateTime timpstamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timpstamp',
        lower: [],
        upper: [timpstamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterWhereClause>
      timpstampBetween(
    DateTime lowerTimpstamp,
    DateTime upperTimpstamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timpstamp',
        lower: [lowerTimpstamp],
        includeLower: includeLower,
        upper: [upperTimpstamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BloodPressureQueryFilter
    on QueryBuilder<BloodPressure, BloodPressure, QFilterCondition> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'diastolic',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'diastolic',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'diastolic',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      diastolicBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'diastolic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition> idBetween(
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

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pulse',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pulse',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pulse',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      pulseBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pulse',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      statusEqualTo(BloodPresureStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      statusGreaterThan(
    BloodPresureStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      statusLessThan(
    BloodPresureStatus value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      statusBetween(
    BloodPresureStatus lower,
    BloodPresureStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'systolic',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'systolic',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'systolic',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      systolicBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'systolic',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      timpstampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timpstamp',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      timpstampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timpstamp',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      timpstampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timpstamp',
        value: value,
      ));
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterFilterCondition>
      timpstampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timpstamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BloodPressureQueryObject
    on QueryBuilder<BloodPressure, BloodPressure, QFilterCondition> {}

extension BloodPressureQueryLinks
    on QueryBuilder<BloodPressure, BloodPressure, QFilterCondition> {}

extension BloodPressureQuerySortBy
    on QueryBuilder<BloodPressure, BloodPressure, QSortBy> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByDiastolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortByDiastolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByPulse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByPulseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortBySystolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortBySystolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> sortByTimpstamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timpstamp', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      sortByTimpstampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timpstamp', Sort.desc);
    });
  }
}

extension BloodPressureQuerySortThenBy
    on QueryBuilder<BloodPressure, BloodPressure, QSortThenBy> {
  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByDiastolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenByDiastolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'diastolic', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByPulse() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByPulseDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pulse', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenBySystolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenBySystolicDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'systolic', Sort.desc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy> thenByTimpstamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timpstamp', Sort.asc);
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QAfterSortBy>
      thenByTimpstampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timpstamp', Sort.desc);
    });
  }
}

extension BloodPressureQueryWhereDistinct
    on QueryBuilder<BloodPressure, BloodPressure, QDistinct> {
  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByDiastolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'diastolic');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByPulse() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pulse');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctBySystolic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'systolic');
    });
  }

  QueryBuilder<BloodPressure, BloodPressure, QDistinct> distinctByTimpstamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timpstamp');
    });
  }
}

extension BloodPressureQueryProperty
    on QueryBuilder<BloodPressure, BloodPressure, QQueryProperty> {
  QueryBuilder<BloodPressure, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BloodPressure, int, QQueryOperations> diastolicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'diastolic');
    });
  }

  QueryBuilder<BloodPressure, int, QQueryOperations> pulseProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pulse');
    });
  }

  QueryBuilder<BloodPressure, BloodPresureStatus, QQueryOperations>
      statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<BloodPressure, int, QQueryOperations> systolicProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'systolic');
    });
  }

  QueryBuilder<BloodPressure, DateTime, QQueryOperations> timpstampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timpstamp');
    });
  }
}
