// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/account.dart' as _i6;
import 'package:domain/announcement.dart' as _i25;
import 'package:domain/association.dart' as _i16;
import 'package:domain/promo.dart' as _i22;
import 'package:domain/storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:presentation/src/ui/app/bloc/main_cubit_factory.dart' as _i5;
import 'package:presentation/src/ui/pages/announcement/datasource/announcement_data_source_factory.dart'
    as _i24;
import 'package:presentation/src/ui/pages/announcement/mapper/announcement_mapper.dart'
    as _i13;
import 'package:presentation/src/ui/pages/committee_profile/bloc/committee_profile_cubit_factory.dart'
    as _i26;
import 'package:presentation/src/ui/pages/committee_profile/mapper/committee_profile_mapper.dart'
    as _i17;
import 'package:presentation/src/ui/pages/member/committee/bloc/committee_list_cubit_factory.dart'
    as _i15;
import 'package:presentation/src/ui/pages/member/member/bloc/member_list_cubit_factory.dart'
    as _i19;
import 'package:presentation/src/ui/pages/member/member/datasource/member_data_source_factory.dart'
    as _i18;
import 'package:presentation/src/ui/pages/onboarding/bloc/onboarding_bloc_factory.dart'
    as _i9;
import 'package:presentation/src/ui/pages/profile/bloc/profile_cubit_factory.dart'
    as _i20;
import 'package:presentation/src/ui/pages/profile/mapper/profile_mapper.dart'
    as _i10;
import 'package:presentation/src/ui/pages/promo/bloc/promo_list_cubit_factory.dart'
    as _i23;
import 'package:presentation/src/ui/pages/promo/datasource/promo_data_source_factory.dart'
    as _i21;
import 'package:presentation/src/ui/pages/promo/mapper/promo_mapper.dart'
    as _i11;
import 'package:presentation/src/ui/pages/settings/bloc/settings_bloc_factory.dart'
    as _i12;
import 'package:presentation/src/ui/utils/mapper/date_time_mapper.dart' as _i4;
import 'package:presentation/src/ui/widget/committee/mapper/committee_mapper.dart'
    as _i3;
import 'package:presentation/src/ui/widget/member/mapper/member_mapper.dart'
    as _i8;
import 'package:presentation/src/ui/widget/scaffold/drawer/bloc/app_drawer_cubit_factory.dart'
    as _i14;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initModuleGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.CommitteeMapper>(() => _i3.CommitteeMapper());
    gh.factory<_i4.DateTimeMapper>(() => _i4.DateTimeMapper());
    gh.factory<_i5.MainCubitFactory>(() => _i5.MainCubitFactory(
          gh<_i6.GetCurrentUser>(),
          gh<_i7.GetDarkTheme>(),
          gh<_i7.GetUseMaterialYou>(),
        ));
    gh.factory<_i8.MemberMapper>(() => _i8.MemberMapper());
    gh.factory<_i9.OnboardingBlocFactory>(() => _i9.OnboardingBlocFactory(
          gh<_i6.Login>(),
          gh<_i6.GetCurrentUser>(),
        ));
    gh.factory<_i10.ProfileMapper>(
        () => _i10.ProfileMapper(gh<_i3.CommitteeMapper>()));
    gh.factory<_i11.PromoMapper>(() => _i11.PromoMapper(
          gh<_i8.MemberMapper>(),
          gh<_i4.DateTimeMapper>(),
        ));
    gh.factory<_i12.SettingsBlocFactory>(() => _i12.SettingsBlocFactory(
          gh<_i7.GetDarkTheme>(),
          gh<_i7.SetDarkTheme>(),
          gh<_i7.GetUseMaterialYou>(),
          gh<_i7.SetUseMaterialYou>(),
        ));
    gh.factory<_i13.AnnouncementMapper>(() => _i13.AnnouncementMapper(
          gh<_i8.MemberMapper>(),
          gh<_i4.DateTimeMapper>(),
        ));
    gh.factory<_i14.AppDrawerCubitFactory>(() => _i14.AppDrawerCubitFactory(
          gh<_i6.GetCurrentUser>(),
          gh<_i8.MemberMapper>(),
        ));
    gh.factory<_i15.CommitteeListCubitFactory>(
        () => _i15.CommitteeListCubitFactory(
              gh<_i16.GetCommittees>(),
              gh<_i3.CommitteeMapper>(),
            ));
    gh.factory<_i17.CommitteeProfileMapper>(
        () => _i17.CommitteeProfileMapper(gh<_i8.MemberMapper>()));
    gh.factory<_i18.MemberDataSourceFactory>(() => _i18.MemberDataSourceFactory(
          gh<_i16.GetMembers>(),
          gh<_i8.MemberMapper>(),
        ));
    gh.factory<_i19.MemberListCubitFactory>(
        () => _i19.MemberListCubitFactory(gh<_i18.MemberDataSourceFactory>()));
    gh.factory<_i20.ProfileCubitFactory>(() => _i20.ProfileCubitFactory(
          gh<_i16.GetMember>(),
          gh<_i10.ProfileMapper>(),
        ));
    gh.factory<_i21.PromoDataSourceFactory>(() => _i21.PromoDataSourceFactory(
          gh<_i22.GetPromos>(),
          gh<_i11.PromoMapper>(),
        ));
    gh.factory<_i23.PromoListCubitFactory>(
        () => _i23.PromoListCubitFactory(gh<_i21.PromoDataSourceFactory>()));
    gh.factory<_i24.AnnouncementDataSourceFactory>(
        () => _i24.AnnouncementDataSourceFactory(
              gh<_i25.GetAnnouncements>(),
              gh<_i13.AnnouncementMapper>(),
            ));
    gh.factory<_i26.CommitteeProfileCubitFactory>(
        () => _i26.CommitteeProfileCubitFactory(
              gh<_i16.GetCommittee>(),
              gh<_i16.GetCommitteeMembers>(),
              gh<_i17.CommitteeProfileMapper>(),
            ));
    return this;
  }
}
