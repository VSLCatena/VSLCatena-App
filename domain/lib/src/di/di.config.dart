// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/account.dart' as _i13;
import 'package:domain/announcement.dart' as _i7;
import 'package:domain/association.dart' as _i9;
import 'package:domain/promo.dart' as _i4;
import 'package:domain/src/account/usecase/get_current_user.dart' as _i12;
import 'package:domain/src/account/usecase/login.dart' as _i20;
import 'package:domain/src/account/usecase/logout.dart' as _i21;
import 'package:domain/src/account/usecase/update_profile_picture.dart' as _i24;
import 'package:domain/src/announcement/usecase/get_announcements.dart' as _i6;
import 'package:domain/src/association/usecase/get_committee.dart' as _i8;
import 'package:domain/src/association/usecase/get_committee_members.dart'
    as _i10;
import 'package:domain/src/association/usecase/get_committees.dart' as _i11;
import 'package:domain/src/association/usecase/get_member.dart' as _i16;
import 'package:domain/src/association/usecase/get_members.dart' as _i17;
import 'package:domain/src/promo/usecase/create_promo.dart' as _i3;
import 'package:domain/src/promo/usecase/delete_promo.dart' as _i5;
import 'package:domain/src/promo/usecase/get_promos.dart' as _i18;
import 'package:domain/src/promo/usecase/update_promo.dart' as _i25;
import 'package:domain/src/storage/usecase/get_dark_theme.dart' as _i14;
import 'package:domain/src/storage/usecase/get_use_material_you.dart' as _i19;
import 'package:domain/src/storage/usecase/set_dark_theme.dart' as _i22;
import 'package:domain/src/storage/usecase/set_use_material_you.dart' as _i23;
import 'package:domain/storage.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

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
    gh.factory<_i3.CreatePromo>(
        () => _i3.CreatePromo(gh<_i4.PromoRepository>()));
    gh.factory<_i5.DeletePromo>(
        () => _i5.DeletePromo(gh<_i4.PromoRepository>()));
    gh.factory<_i6.GetAnnouncements>(
        () => _i6.GetAnnouncements(gh<_i7.AnnouncementRepository>()));
    gh.factory<_i8.GetCommittee>(
        () => _i8.GetCommittee(gh<_i9.AssociationRepository>()));
    gh.factory<_i10.GetCommitteeMembers>(
        () => _i10.GetCommitteeMembers(gh<_i9.AssociationRepository>()));
    gh.factory<_i11.GetCommittees>(
        () => _i11.GetCommittees(gh<_i9.AssociationRepository>()));
    gh.factory<_i12.GetCurrentUser>(
        () => _i12.GetCurrentUser(gh<_i13.AccountRepository>()));
    gh.factory<_i14.GetDarkTheme>(
        () => _i14.GetDarkTheme(gh<_i15.StorageRepository>()));
    gh.factory<_i16.GetMember>(
        () => _i16.GetMember(gh<_i9.AssociationRepository>()));
    gh.factory<_i17.GetMembers>(
        () => _i17.GetMembers(gh<_i9.AssociationRepository>()));
    gh.factory<_i18.GetPromos>(() => _i18.GetPromos(gh<_i4.PromoRepository>()));
    gh.factory<_i19.GetUseMaterialYou>(
        () => _i19.GetUseMaterialYou(gh<_i15.StorageRepository>()));
    gh.factory<_i20.Login>(() => _i20.Login(gh<_i13.AccountRepository>()));
    gh.factory<_i21.Logout>(() => _i21.Logout(gh<_i13.AccountRepository>()));
    gh.factory<_i22.SetDarkTheme>(
        () => _i22.SetDarkTheme(gh<_i15.StorageRepository>()));
    gh.factory<_i23.SetUseMaterialYou>(
        () => _i23.SetUseMaterialYou(gh<_i15.StorageRepository>()));
    gh.factory<_i24.UpdateProfilePicture>(
        () => _i24.UpdateProfilePicture(gh<_i13.AccountRepository>()));
    gh.factory<_i25.UpdatePromo>(
        () => _i25.UpdatePromo(gh<_i4.PromoRepository>()));
    return this;
  }
}
