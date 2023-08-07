// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../application/downloadsbloc/downloads_bloc.dart' as _i10;
import '../../../application/fastLaugh/fast_laugh_bloc.dart' as _i11;
import '../../../application/HotnNewBloc/hotn_new_bloc.dart' as _i5;
import '../../../application/search/search_bloc.dart' as _i12;
import '../../../infrstructure/Download/downloadRepository.dart' as _i7;
import '../../../infrstructure/HotAndNew/HotnNewImplimentation.dart' as _i4;
import '../../../infrstructure/search/searchRepository.dart' as _i9;
import '../../download/repo/IDownloadRepo.dart' as _i6;
import '../../HotANdNew/hotAndService/HotAndNewService.dart' as _i3;
import '../../search/search_services.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.HotAndNewServices>(() => _i4.HotnNewImplimentation());
  gh.factory<_i5.HotnNewBloc>(
      () => _i5.HotnNewBloc(get<_i3.HotAndNewServices>()));
  gh.lazySingleton<_i6.IdownloadRepo>(() => _i7.DownloadRepository());
  gh.lazySingleton<_i8.SearchServices>(() => _i9.SearchRepository());
  gh.factory<_i10.DownloadsBloc>(
      () => _i10.DownloadsBloc(get<_i6.IdownloadRepo>()));
  gh.factory<_i11.FastLaughBloc>(
      () => _i11.FastLaughBloc(get<_i6.IdownloadRepo>()));
  gh.factory<_i12.SearchBloc>(() => _i12.SearchBloc(
        get<_i6.IdownloadRepo>(),
        get<_i8.SearchServices>(),
      ));
  return get;
}
