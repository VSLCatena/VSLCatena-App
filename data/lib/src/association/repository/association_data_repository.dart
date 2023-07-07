import 'package:domain/association.dart';
import 'package:domain/generic.dart';
import 'package:injectable/injectable.dart';

import '../mapper/member_mapper.dart';
import '../mapper/committee_mapper.dart';
import '../store/association_data_store.dart';

@Injectable(as: AssociationRepository)
class AssociationDataRepository implements AssociationRepository {
  final AssociationDataStore _dataStore;
  final CommitteeMapper _committeeMapper;
  final MemberMapper _memberMapper;

  const AssociationDataRepository(
      this._dataStore, this._committeeMapper, this._memberMapper);

  @override
  Future<List<Committee>> getCommittees({bool allowCache = true}) async {
    final rawCommittees =
        (await _dataStore.getCommittees(allowCache: allowCache)).docs;

    final unsortedCommittees = rawCommittees
        .map((e) => _committeeMapper.map(e))
        .whereType<Committee>()
        .toList();

    return unsortedCommittees
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
  }

  @override
  Future<Member> getMember(String id, {bool allowCache = true}) async {
    final dataFuture = _dataStore.getMember(id, allowCache: allowCache);
    final committeesFuture = getCommittees();

    return _memberMapper.map(await dataFuture, await committeesFuture);
  }

  @override
  Future<ItemPage<Member>> getMembers({
    ItemPageSuccess<Member>? previousPage,
  }) async {
    final docs = await _dataStore
        .getMemberPage(previousDocument: previousPage?.nextKey)
        .then((value) => value.docs);

    if (docs.isEmpty) return ItemPageEmpty();
    final committees = await getCommittees();

    return ItemPageSuccess(
        items: docs.map((doc) => _memberMapper.map(doc, committees)).toList(),
        nextKey: docs.last);
  }

  @override
  Future<List<Member>> getCommitteeMembers(String committeeId) async {
    final dataFuture = _dataStore.getCommitteeMembers(committeeId);
    final committees = await getCommittees();

    return (await dataFuture)
        .docs
        .map((value) => _memberMapper.map(value, committees))
        .toList();
  }
}
