import 'package:go_router/go_router.dart';
import 'package:presentation/ui/pages/announcement/announcement_page.dart';
import 'package:presentation/ui/pages/committee_profile/committee_profile_page.dart';
import 'package:presentation/ui/pages/home/home_page.dart';
import 'package:presentation/ui/pages/onboarding/onboarding_page.dart';
import 'package:presentation/ui/pages/promo/promo_page.dart';

import '../pages/about/about_page.dart';
import '../pages/member/member_page.dart';
import '../pages/profile/profile_page.dart';
import '../pages/settings/settings_page.dart';

class Destinations {
  static const login = '/login';
  static const home = '/';
  static const news = '/news';
  static const promo = '/promo';
  static const settings = '/settings';
  static const members = '/members';
  static const memberProfile = '/members/:memberId';
  static const committees = '/committees';
  static const committeeProfile = '/committees/:committeeId';
  static const about = '/about';
}

List<GoRoute> appRoutes = [
  GoRoute(
      path: Destinations.login,
      builder: (context, state) => const OnboardingPage()),
  GoRoute(
      path: Destinations.home, builder: (context, state) => const HomePage()),
  GoRoute(
      path: Destinations.news,
      builder: (context, state) => const AnnouncementPage()),
  GoRoute(
      path: Destinations.promo, builder: (context, state) => const PromoPage()),
  GoRoute(
      path: Destinations.settings,
      builder: (context, state) => const SettingsPage()),
  GoRoute(
      path: Destinations.members,
      builder: (context, state) => const MembersPage()),
  GoRoute(
      path: Destinations.about, builder: (context, state) => const AboutPage()),
  GoRoute(
      path: Destinations.memberProfile,
      builder: (context, state) =>
          ProfilePage(state.pathParameters['memberId']!)),
  GoRoute(
      path: Destinations.committees,
      builder: (context, state) =>
          const MembersPage() /* TODO make sure it redirects to the correct tab */),
  GoRoute(
      path: Destinations.committeeProfile,
      builder: (context, state) =>
          CommitteeProfilePage(state.pathParameters['committeeId']!)),
];
