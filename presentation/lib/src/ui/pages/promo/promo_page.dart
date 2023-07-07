import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../widget/scaffold/app_scaffold.dart';
import 'bloc/promo_list_cubit_factory.dart';
import 'widget/promo_list_widget.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: AppLocalizations.of(context)!.titlePromo,
      child: Container(
        alignment: Alignment.topRight,
        child: BlocProvider(
          create: (context) => GetIt.I<PromoListCubitFactory>().create(context),
          child: _page(context),
        ),
      ),
    );
  }

  Widget _page(BuildContext context) {
    return const PromoListWidget();
  }
}
