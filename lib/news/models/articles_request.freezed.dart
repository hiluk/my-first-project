// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'articles_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ArticlesRequest _$ArticlesRequestFromJson(Map<String, dynamic> json) {
  return _ArticlesRequest.fromJson(json);
}

/// @nodoc
mixin _$ArticlesRequest {
  @JsonKey(name: 'news_site')
  String get newsSite => throw _privateConstructorUsedError;
  @JsonKey(name: 'title_contains')
  String get titleContains => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArticlesRequestCopyWith<ArticlesRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticlesRequestCopyWith<$Res> {
  factory $ArticlesRequestCopyWith(
          ArticlesRequest value, $Res Function(ArticlesRequest) then) =
      _$ArticlesRequestCopyWithImpl<$Res, ArticlesRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: 'news_site') String newsSite,
      @JsonKey(name: 'title_contains') String titleContains,
      int limit,
      int offset});
}

/// @nodoc
class _$ArticlesRequestCopyWithImpl<$Res, $Val extends ArticlesRequest>
    implements $ArticlesRequestCopyWith<$Res> {
  _$ArticlesRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsSite = null,
    Object? titleContains = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      newsSite: null == newsSite
          ? _value.newsSite
          : newsSite // ignore: cast_nullable_to_non_nullable
              as String,
      titleContains: null == titleContains
          ? _value.titleContains
          : titleContains // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticlesRequestImplCopyWith<$Res>
    implements $ArticlesRequestCopyWith<$Res> {
  factory _$$ArticlesRequestImplCopyWith(_$ArticlesRequestImpl value,
          $Res Function(_$ArticlesRequestImpl) then) =
      __$$ArticlesRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'news_site') String newsSite,
      @JsonKey(name: 'title_contains') String titleContains,
      int limit,
      int offset});
}

/// @nodoc
class __$$ArticlesRequestImplCopyWithImpl<$Res>
    extends _$ArticlesRequestCopyWithImpl<$Res, _$ArticlesRequestImpl>
    implements _$$ArticlesRequestImplCopyWith<$Res> {
  __$$ArticlesRequestImplCopyWithImpl(
      _$ArticlesRequestImpl _value, $Res Function(_$ArticlesRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newsSite = null,
    Object? titleContains = null,
    Object? limit = null,
    Object? offset = null,
  }) {
    return _then(_$ArticlesRequestImpl(
      newsSite: null == newsSite
          ? _value.newsSite
          : newsSite // ignore: cast_nullable_to_non_nullable
              as String,
      titleContains: null == titleContains
          ? _value.titleContains
          : titleContains // ignore: cast_nullable_to_non_nullable
              as String,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlesRequestImpl implements _ArticlesRequest {
  _$ArticlesRequestImpl(
      {@JsonKey(name: 'news_site') this.newsSite = '',
      @JsonKey(name: 'title_contains') this.titleContains = '',
      this.limit = 20,
      this.offset = 0});

  factory _$ArticlesRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlesRequestImplFromJson(json);

  @override
  @JsonKey(name: 'news_site')
  final String newsSite;
  @override
  @JsonKey(name: 'title_contains')
  final String titleContains;
  @override
  @JsonKey()
  final int limit;
  @override
  @JsonKey()
  final int offset;

  @override
  String toString() {
    return 'ArticlesRequest(newsSite: $newsSite, titleContains: $titleContains, limit: $limit, offset: $offset)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlesRequestImpl &&
            (identical(other.newsSite, newsSite) ||
                other.newsSite == newsSite) &&
            (identical(other.titleContains, titleContains) ||
                other.titleContains == titleContains) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, newsSite, titleContains, limit, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlesRequestImplCopyWith<_$ArticlesRequestImpl> get copyWith =>
      __$$ArticlesRequestImplCopyWithImpl<_$ArticlesRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlesRequestImplToJson(
      this,
    );
  }
}

abstract class _ArticlesRequest implements ArticlesRequest {
  factory _ArticlesRequest(
      {@JsonKey(name: 'news_site') final String newsSite,
      @JsonKey(name: 'title_contains') final String titleContains,
      final int limit,
      final int offset}) = _$ArticlesRequestImpl;

  factory _ArticlesRequest.fromJson(Map<String, dynamic> json) =
      _$ArticlesRequestImpl.fromJson;

  @override
  @JsonKey(name: 'news_site')
  String get newsSite;
  @override
  @JsonKey(name: 'title_contains')
  String get titleContains;
  @override
  int get limit;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$ArticlesRequestImplCopyWith<_$ArticlesRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
