// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:data/src/account/repository/account_data_repository.dart'
    as _i21;
import 'package:data/src/account/store/account_store.dart' as _i3;
import 'package:data/src/announcement/mapper/announcement_mapper.dart' as _i5;
import 'package:data/src/announcement/repository/announcement_data_repository.dart'
    as _i8;
import 'package:data/src/announcement/store/announcement_data_store.dart'
    as _i4;
import 'package:data/src/association/mapper/committee_mapper.dart' as _i11;
import 'package:data/src/association/mapper/member_mapper.dart' as _i14;
import 'package:data/src/association/repository/association_data_repository.dart'
    as _i22;
import 'package:data/src/association/store/association_data_store.dart' as _i9;
import 'package:data/src/generic/image/async_image_creator.dart' as _i10;
import 'package:data/src/generic/mapper/date_time_mapper.dart' as _i13;
import 'package:data/src/promo/mapper/create_promo_request_mapper.dart' as _i12;
import 'package:data/src/promo/mapper/promo_response_mapper.dart' as _i16;
import 'package:data/src/promo/repository/promo_data_repository.dart' as _i24;
import 'package:data/src/promo/store/promo_data_store.dart' as _i15;
import 'package:data/src/storage/repository/storage_data_repository.dart'
    as _i19;
import 'package:data/src/storage/store/storage_data_store.dart' as _i17;
import 'package:domain/account.dart' as _i20;
import 'package:domain/announcement.dart' as _i7;
import 'package:domain/association.dart' as _i6;
import 'package:domain/promo.dart' as _i23;
import 'package:domain/storage.dart' as _i18;
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
    gh.lazySingleton<_i3.AccountStore>(() => _i3.AccountStore());
    gh.factory<_i4.AnnouncementDataStore>(() => _i4.AnnouncementDataStore());
    gh.factory<_i5.AnnouncementMapper>(
        () => _i5.AnnouncementMapper(gh<_i6.GetMember>()));
    gh.factory<_i7.AnnouncementRepository>(() => _i8.AnnouncementDataRepository(
          gh<_i4.AnnouncementDataStore>(),
          gh<_i5.AnnouncementMapper>(),
        ));
    gh.factory<_i9.AssociationDataStore>(() => _i9.AssociationDataStore());
    gh.lazySingleton<_i10.AsyncImageCreator>(() => _i10.AsyncImageCreator());
    gh.factory<_i11.CommitteeMapper>(() => _i11.CommitteeMapper());
    gh.factory<_i12.CreatePromoRequestMapper>(
        () => _i12.CreatePromoRequestMapper());
    gh.factory<_i13.DateTimeMapper>(() => _i13.DateTimeMapper());
    gh.factory<_i14.MemberMapper>(() => _i14.MemberMapper(
          gh<_i13.DateTimeMapper>(),
          gh<_i10.AsyncImageCreator>(),
        ));
    gh.factory<_i15.PromoDataStore>(() => _i15.PromoDataStore());
    gh.factory<_i16.PromoResponseMapper>(
        () => _i16.PromoResponseMapper(gh<_i6.GetMember>()));
    gh.lazySingleton<_i17.StorageDataStore>(() => _i17.StorageDataStore());
    gh.factory<_i18.StorageRepository>(
        () => _i19.StorageDataRepository(gh<_i17.StorageDataStore>()));
    gh.factory<_i20.AccountRepository>(() => _i21.AccountDataRepository(
          gh<_i3.AccountStore>(),
          gh<_i6.GetCommittees>(),
          gh<_i14.MemberMapper>(),
        ));
    gh.factory<_i6.AssociationRepository>(() => _i22.AssociationDataRepository(
          gh<_i9.AssociationDataStore>(),
          gh<_i11.CommitteeMapper>(),
          gh<_i14.MemberMapper>(),
        ));
    gh.factory<_i23.PromoRepository>(() => _i24.PromoDataRepository(
          gh<_i15.PromoDataStore>(),
          gh<_i16.PromoResponseMapper>(),
        ));
    return this;
  }
}
