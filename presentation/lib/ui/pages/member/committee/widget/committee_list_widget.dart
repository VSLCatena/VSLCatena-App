import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/ui/widget/committee/committee_item_widget.dart';

import '../bloc/committee_list_cubit.dart';
import '../model/committee_list_state.dart';

class CommitteeListWidget extends StatelessWidget {
  const CommitteeListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommitteeListCubit, CommitteeListState>(
        builder: (context, state) {
      return RefreshIndicator(
          onRefresh: () async => {context.read<CommitteeListCubit>().refresh()},
          child: _handleState(context, state));
    });
  }

  Widget _handleState(BuildContext context, CommitteeListState state) {
    switch (state) {
      case CommitteeListLoading():
        return const Center(child: CircularProgressIndicator());
      case CommitteeListSuccess():
        return ListView.builder(
          itemCount: state.committees.length,
          itemBuilder: (BuildContext context, int index) =>
              CommitteeItemWidget(state.committees[index]),
        );
      default:
        return const Text('Error');
    }
  }
}
