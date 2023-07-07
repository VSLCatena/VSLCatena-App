import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/scaffold/app_scaffold.dart';
import 'committee/bloc/committee_list_cubit_factory.dart';
import 'committee/widget/committee_list_widget.dart';
import 'member/bloc/member_list_cubit_factory.dart';
import 'member/widget/member_list_widget.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalizations.of(context)!;
    return DefaultTabController(
        length: 2,
        child: AppScaffold(
            title: AppLocalizations.of(context)!.titleMembers,
            appBarBottom: TabBar(tabs: [
              Tab(
                  text: appLoc.memberTabMembers,
                  icon: const Icon(Icons.person)),
              Tab(
                  text: appLoc.memberTabCommittees,
                  icon: const Icon(Icons.people))
            ]),
            child: TabBarView(children: [
              BlocProvider(
                  create: (context) =>
                      GetIt.I<MemberListCubitFactory>().create(),
                  child: const MemberListWidget()),
              BlocProvider(
                  create: (context) =>
                      GetIt.I<CommitteeListCubitFactory>().create(),
                  child: const CommitteeListWidget())
            ])));
  }
}
