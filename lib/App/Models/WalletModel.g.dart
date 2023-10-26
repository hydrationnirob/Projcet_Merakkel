// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'WalletModel.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWalletModelCollection on Isar {
  IsarCollection<WalletModel> get walletModels => this.collection();
}

const WalletModelSchema = CollectionSchema(
  name: r'WalletModel',
  id: -4870835005747997710,
  properties: {
    r'Amount': PropertySchema(
      id: 0,
      name: r'Amount',
      type: IsarType.string,
    ),
    r'LastPaid': PropertySchema(
      id: 1,
      name: r'LastPaid',
      type: IsarType.dateTime,
    ),
    r'TagetAmount': PropertySchema(
      id: 2,
      name: r'TagetAmount',
      type: IsarType.string,
    ),
    r'Title': PropertySchema(
      id: 3,
      name: r'Title',
      type: IsarType.string,
    ),
    r'TotalAmount': PropertySchema(
      id: 4,
      name: r'TotalAmount',
      type: IsarType.long,
    ),
    r'hashCode': PropertySchema(
      id: 5,
      name: r'hashCode',
      type: IsarType.long,
    )
  },
  estimateSize: _walletModelEstimateSize,
  serialize: _walletModelSerialize,
  deserialize: _walletModelDeserialize,
  deserializeProp: _walletModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _walletModelGetId,
  getLinks: _walletModelGetLinks,
  attach: _walletModelAttach,
  version: '3.1.0+1',
);

int _walletModelEstimateSize(
  WalletModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.Amount.length * 3;
  bytesCount += 3 + object.TagetAmount.length * 3;
  bytesCount += 3 + object.Title.length * 3;
  return bytesCount;
}

void _walletModelSerialize(
  WalletModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.Amount);
  writer.writeDateTime(offsets[1], object.LastPaid);
  writer.writeString(offsets[2], object.TagetAmount);
  writer.writeString(offsets[3], object.Title);
  writer.writeLong(offsets[4], object.TotalAmount);
  writer.writeLong(offsets[5], object.hashCode);
}

WalletModel _walletModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WalletModel(
    Amount: reader.readString(offsets[0]),
    LastPaid: reader.readDateTime(offsets[1]),
    TagetAmount: reader.readString(offsets[2]),
    Title: reader.readString(offsets[3]),
    TotalAmount: reader.readLong(offsets[4]),
    id: id,
  );
  return object;
}

P _walletModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _walletModelGetId(WalletModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _walletModelGetLinks(WalletModel object) {
  return [];
}

void _walletModelAttach(
    IsarCollection<dynamic> col, Id id, WalletModel object) {
  object.id = id;
}

extension WalletModelQueryWhereSort
    on QueryBuilder<WalletModel, WalletModel, QWhere> {
  QueryBuilder<WalletModel, WalletModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WalletModelQueryWhere
    on QueryBuilder<WalletModel, WalletModel, QWhereClause> {
  QueryBuilder<WalletModel, WalletModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<WalletModel, WalletModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterWhereClause> idBetween(
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

extension WalletModelQueryFilter
    on QueryBuilder<WalletModel, WalletModel, QFilterCondition> {
  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> amountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      amountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> amountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> amountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      amountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> amountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> amountContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Amount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> amountMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Amount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      amountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Amount',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      amountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Amount',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> lastPaidEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'LastPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      lastPaidGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'LastPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      lastPaidLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'LastPaid',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> lastPaidBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'LastPaid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'TagetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'TagetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'TagetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'TagetAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'TagetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'TagetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'TagetAmount',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'TagetAmount',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'TagetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      tagetAmountIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'TagetAmount',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'Title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'Title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'Title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'Title',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'Title',
        value: '',
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      totalAmountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'TotalAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      totalAmountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'TotalAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      totalAmountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'TotalAmount',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      totalAmountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'TotalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition>
      hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashCode',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WalletModel, WalletModel, QAfterFilterCondition> idBetween(
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
}

extension WalletModelQueryObject
    on QueryBuilder<WalletModel, WalletModel, QFilterCondition> {}

extension WalletModelQueryLinks
    on QueryBuilder<WalletModel, WalletModel, QFilterCondition> {}

extension WalletModelQuerySortBy
    on QueryBuilder<WalletModel, WalletModel, QSortBy> {
  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Amount', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Amount', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByLastPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'LastPaid', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByLastPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'LastPaid', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByTagetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TagetAmount', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByTagetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TagetAmount', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TotalAmount', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TotalAmount', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> sortByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }
}

extension WalletModelQuerySortThenBy
    on QueryBuilder<WalletModel, WalletModel, QSortThenBy> {
  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Amount', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Amount', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByLastPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'LastPaid', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByLastPaidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'LastPaid', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByTagetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TagetAmount', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByTagetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TagetAmount', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'Title', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TotalAmount', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'TotalAmount', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByHashCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashCode', Sort.desc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension WalletModelQueryWhereDistinct
    on QueryBuilder<WalletModel, WalletModel, QDistinct> {
  QueryBuilder<WalletModel, WalletModel, QDistinct> distinctByAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Amount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QDistinct> distinctByLastPaid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'LastPaid');
    });
  }

  QueryBuilder<WalletModel, WalletModel, QDistinct> distinctByTagetAmount(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'TagetAmount', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'Title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<WalletModel, WalletModel, QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'TotalAmount');
    });
  }

  QueryBuilder<WalletModel, WalletModel, QDistinct> distinctByHashCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashCode');
    });
  }
}

extension WalletModelQueryProperty
    on QueryBuilder<WalletModel, WalletModel, QQueryProperty> {
  QueryBuilder<WalletModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WalletModel, String, QQueryOperations> AmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Amount');
    });
  }

  QueryBuilder<WalletModel, DateTime, QQueryOperations> LastPaidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'LastPaid');
    });
  }

  QueryBuilder<WalletModel, String, QQueryOperations> TagetAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'TagetAmount');
    });
  }

  QueryBuilder<WalletModel, String, QQueryOperations> TitleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'Title');
    });
  }

  QueryBuilder<WalletModel, int, QQueryOperations> TotalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'TotalAmount');
    });
  }

  QueryBuilder<WalletModel, int, QQueryOperations> hashCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashCode');
    });
  }
}
