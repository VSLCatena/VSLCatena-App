import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/src/ui/utils/extension/context_extensions.dart';

import '../../../l10n/generated/app_localizations.dart';
import '../../app/routes.dart';
import 'bloc/onboarding_bloc.dart';
import 'bloc/onboarding_bloc_factory.dart';
import 'model/onboarding_event.dart';
import 'model/onboarding_state.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(AppLocalizations.of(context)!.appTitle)),
      ),
      body: BlocProvider(
        create: (context) => GetIt.I<OnboardingBlocFactory>().create(),
        child: BlocConsumer<OnboardingBloc, OnboardingState>(
          builder: _page,
          listener: (context, state) {
            if (state is OnboardingStateLoggedIn) {
              context.topNavigateTo(Destinations.home);
            } else if (state is OnboardingStateError) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ),
    );
  }

  Widget _page(BuildContext context, OnboardingState state) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Image.asset('assets/logo.png', package: 'presentation'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: OutlinedButton(
              onPressed: () =>
                  context.read<OnboardingBloc>().add(OnboardingLoginPressed()),
              child: Text(AppLocalizations.of(context)!.onboardingLogin),
            ),
          ),
        )
      ],
    );
  }
}
