// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'glucose.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGlucoseCollection on Isar {
  IsarCollection<Glucose> get glucoses => this.collection();
}

const GlucoseSchema = CollectionSchema(
  name: r'Glucose',
  id: 343712322527678881,
  properties: {
    r'a1c': PropertySchema(
      id: 0,
      name: r'a1c',
      type: IsarType.double,
    ),
    r'measureAt': PropertySchema(
      id: 1,
      name: r'measureAt',
      type: IsarType.byte,
      enumMap: _GlucosemeasureAtEnumValueMap,
    ),
    r'status': PropertySchema(
      id: 2,
      name: r'status',
      type: IsarType.byte,
      enumMap: _GlucosestatusEnumValueMap,
    ),
    r'timestamp': PropertySchema(
      id: 3,
      name: r'timestamp',
      type: IsarType.dateTime,
    ),
    r'unit': PropertySchema(
      id: 4,
      name: r'unit',
      type: IsarType.long,
    )
  },
  estimateSize: _glucoseEstimateSize,
  serialize: _glucoseSerialize,
  deserialize: _glucoseDeserialize,
  deserializeProp: _glucoseDeserializeProp,
  idName: r'id',
  indexes: {
    r'timestamp': IndexSchema(
      id: 1852253767416892198,
      name: r'timestamp',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'timestamp',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _glucoseGetId,
  getLinks: _glucoseGetLinks,
  attach: _glucoseAttach,
  version: '3.1.0+1',
);

int _glucoseEstimateSize(
  Glucose object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _glucoseSerialize(
  Glucose object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.a1c);
  writer.writeByte(offsets[1], object.measureAt.index);
  writer.writeByte(offsets[2], object.status.index);
  writer.writeDateTime(offsets[3], object.timestamp);
  writer.writeLong(offsets[4], object.unit);
}

Glucose _glucoseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Glucose();
  object.a1c = reader.readDouble(offsets[0]);
  object.id = id;
  object.measureAt =
      _GlucosemeasureAtValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          MeasureAt.fasting;
  object.status =
      _GlucosestatusValueEnumMap[reader.readByteOrNull(offsets[2])] ??
          GlucoseStatus.normal;
  object.timestamp = reader.readDateTime(offsets[3]);
  object.unit = reader.readLong(offsets[4]);
  return object;
}

P _glucoseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDouble(offset)) as P;
    case 1:
      return (_GlucosemeasureAtValueEnumMap[reader.readByteOrNull(offset)] ??
          MeasureAt.fasting) as P;
    case 2:
      return (_GlucosestatusValueEnumMap[reader.readByteOrNull(offset)] ??
          GlucoseStatus.normal) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _GlucosemeasureAtEnumValueMap = {
  'fasting': 0,
  'afterEating': 1,
  'afterEating23hr': 2,
};
const _GlucosemeasureAtValueEnumMap = {
  0: MeasureAt.fasting,
  1: MeasureAt.afterEating,
  2: MeasureAt.afterEating23hr,
};
const _GlucosestatusEnumValueMap = {
  'normal': 0,
  'impaired': 1,
  'diabetic': 2,
  'unknow': 3,
};
const _GlucosestatusValueEnumMap = {
  0: GlucoseStatus.normal,
  1: GlucoseStatus.impaired,
  2: GlucoseStatus.diabetic,
  3: GlucoseStatus.unknow,
};

Id _glucoseGetId(Glucose object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _glucoseGetLinks(Glucose object) {
  return [];
}

void _glucoseAttach(IsarCollection<dynamic> col, Id id, Glucose object) {
  object.id = id;
}

extension GlucoseQueryWhereSort on QueryBuilder<Glucose, Glucose, QWhere> {
  QueryBuilder<Glucose, Glucose, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhere> anyTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'timestamp'),
      );
    });
  }
}

extension GlucoseQueryWhere on QueryBuilder<Glucose, Glucose, QWhereClause> {
  QueryBuilder<Glucose, Glucose, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> idBetween(
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

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> timestampEqualTo(
      DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'timestamp',
        value: [timestamp],
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> timestampNotEqualTo(
      DateTime timestamp) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [timestamp],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'timestamp',
              lower: [],
              upper: [timestamp],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> timestampGreaterThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [timestamp],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> timestampLessThan(
    DateTime timestamp, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [],
        upper: [timestamp],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterWhereClause> timestampBetween(
    DateTime lowerTimestamp,
    DateTime upperTimestamp, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'timestamp',
        lower: [lowerTimestamp],
        includeLower: includeLower,
        upper: [upperTimestamp],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GlucoseQueryFilter
    on QueryBuilder<Glucose, Glucose, QFilterCondition> {
  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> a1cEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'a1c',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> a1cGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'a1c',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> a1cLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'a1c',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> a1cBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'a1c',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> measureAtEqualTo(
      MeasureAt value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'measureAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> measureAtGreaterThan(
    MeasureAt value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'measureAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> measureAtLessThan(
    MeasureAt value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'measureAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> measureAtBetween(
    MeasureAt lower,
    MeasureAt upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'measureAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> statusEqualTo(
      GlucoseStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> statusGreaterThan(
    GlucoseStatus value, {
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

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> statusLessThan(
    GlucoseStatus value, {
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

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> statusBetween(
    GlucoseStatus lower,
    GlucoseStatus upper, {
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

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> unitEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unit',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> unitGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unit',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> unitLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unit',
        value: value,
      ));
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterFilterCondition> unitBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension GlucoseQueryObject
    on QueryBuilder<Glucose, Glucose, QFilterCondition> {}

extension GlucoseQueryLinks
    on QueryBuilder<Glucose, Glucose, QFilterCondition> {}

extension GlucoseQuerySortBy on QueryBuilder<Glucose, Glucose, QSortBy> {
  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByA1c() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a1c', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByA1cDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a1c', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByMeasureAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureAt', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByMeasureAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureAt', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> sortByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension GlucoseQuerySortThenBy
    on QueryBuilder<Glucose, Glucose, QSortThenBy> {
  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByA1c() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a1c', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByA1cDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'a1c', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByMeasureAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureAt', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByMeasureAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'measureAt', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.asc);
    });
  }

  QueryBuilder<Glucose, Glucose, QAfterSortBy> thenByUnitDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unit', Sort.desc);
    });
  }
}

extension GlucoseQueryWhereDistinct
    on QueryBuilder<Glucose, Glucose, QDistinct> {
  QueryBuilder<Glucose, Glucose, QDistinct> distinctByA1c() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'a1c');
    });
  }

  QueryBuilder<Glucose, Glucose, QDistinct> distinctByMeasureAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'measureAt');
    });
  }

  QueryBuilder<Glucose, Glucose, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Glucose, Glucose, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }

  QueryBuilder<Glucose, Glucose, QDistinct> distinctByUnit() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unit');
    });
  }
}

extension GlucoseQueryProperty
    on QueryBuilder<Glucose, Glucose, QQueryProperty> {
  QueryBuilder<Glucose, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Glucose, double, QQueryOperations> a1cProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'a1c');
    });
  }

  QueryBuilder<Glucose, MeasureAt, QQueryOperations> measureAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'measureAt');
    });
  }

  QueryBuilder<Glucose, GlucoseStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Glucose, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }

  QueryBuilder<Glucose, int, QQueryOperations> unitProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unit');
    });
  }
}
