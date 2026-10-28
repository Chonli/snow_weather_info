# snow_weather_info

Flutter app ("Info Neige") displaying French snow weather beacon (BRA/nivose) info: avalanche bulletins, ski stations, webcam, map, live station data. UI strings are French, hardcoded (no ARB/l10n system).

## Commands

```bash
# Run codegen after creating/editing @riverpod providers or @MappableClass models
# (generates *.g.dart and *.mapper.dart; app won't compile without this):
dart run build_runner build --delete-conflicting-outputs

# Analyze (custom_lint + riverpod_lint + very_good_analysis via analysis_options.yaml)
dart analyze

# Run tests
flutter test
flutter test test/api/station_test.dart          # single file
flutter test --plain-name "récuperation"          # single test by name

# Bump version in pubspec.yaml (name.major.minor.patch + build = git commit count)
./update_version.sh patch|minor|major
```

## Architecture (`lib/`)

Layered, all wired through Riverpod providers:
- `data/sources/api/` — HTTP/asset fetchers per upstream (Météo-France, nivose CSV/PDF, Piemonte API, skieur webcams). `ApiClient` provider wraps a shared `http.Client`.
- `data/sources/data/` — sembast persistence; subclasses of `LocalDataContainer` (`core/local_database.dart`) keyed by name/serializer.
- `data/repositories/` — combine api + local cache sources.
- `provider/` — app-state providers; `modules/` — one folder per feature (home, map, avalanche, bera, nivose, station, webcam, settings); `router/` — go_router config.
- `model/` — immutable models with `dart_mappable` (`.mapper.dart` part files), NOT freezed/json_serializable.

Providers use code-generation style: `@riverpod` / `@Riverpod(keepAlive: true)` annotations on functions (Riverpod 3, `hooks_riverpod` + `flutter_hooks` for widget-local state). Sembast DB and SharedPreferences are injected via `override`s in `main()`.

## Quirks & gotchas

- `test/api/*_test.dart` hit **real external APIs** (e.g. asserts exact station count) — they fail without network and break when upstream data changes. For new tests, mock `http.Client` with `mocktail` (see `test/common/mock.dart`).
- `dart analyze` excludes generated `*.g.dart`/`*.mapper.dart`; analyzer errors `invalid_annotation_target` and several doc/line-length rules are intentionally disabled in `analysis_options.yaml`.
- Static data lives in `assets/postesNivo.json` and `assets/webcams.json`, parsed via `rootBundle.loadString` (needs `WidgetsFlutterBinding.ensureInitialized()` in tests).
- Webcams are refreshed by `scripts/extract_all_webcam.sh`, which requires `lynx` installed.
- `dart_rss` comes from a **git dependency** (`github.com/Chonli/webfeed`, branch `feature/geo-rss-2`) — not pub.dev.
- Git remotes: `origin` (GitHub) and `codeberg`; main branch is `main`.

## Code style rules

Tout code Dart/Flutter ajouté ou modifié doit respecter ces règles.

### État & architecture
- État applicatif via Riverpod uniquement (providers `@riverpod`, style code-gen) — pas d'autre solution de state management.
- État éphémère local : `flutter_hooks` (`HookConsumerWidget` / `useState` / etc.), ne pas le faire passer dans un provider.
- Modèles immuables (`const` constructors, `final` fields) avec `dart_mappable`. Widgets immuables, `StatelessWidget` par défaut.
- Composition : petits widgets réutilisables et composition de providers plutôt que grosses classes.
- SOLID : séparer les couches api / local data / repository / provider (voir Architecture).

### Langage Dart
- Dart moderne et concis : sealed class, if-case, records, pattern matching, switch expressions, dot shorthand — dès que ça simplifie.
- Null-safety stricte : éviter `!` sauf garantie non-null absolue.
- Extensions sur types pour simplifier le code (voir `lib/extensions/`).
- Noms clairs et explicites ; constantes pour les valeurs répétues ; commentaires uniquement quand le pourquoi n'est pas évident.
- Le formateur/analiseur fait autorité : `very_good_analysis` + `custom_lint` + `riverpod_lint` (`dart analyze`).

### Tests & dépendances
- Tests unitaires avec `mocktail` pour mocker (cf. `test/common/mock.dart`) ; préférer mocker `http.Client` plutôt que d'appeler les vraies API.
- Nouvelle dépendance pub.dev uniquement avec une justification écrite de son bénéfice.
