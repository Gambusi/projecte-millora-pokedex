///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsCa = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.ca,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ca>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ca: 'Traduccions · Slang'
	String get appBarTitle => 'Traduccions · Slang';

	/// ca: 'Benvingut/da al curs de Flutter!'
	String get welcome => 'Benvingut/da al curs de Flutter!';

	/// ca: 'Hola, ${name}!'
	String greeting({required Object name}) => 'Hola, ${name}!';

	/// ca: '(zero) {No hi ha elements} (one) {Hi ha 1 element} (other) {Hi ha ${n} elements}'
	String itemsCount({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n,
		zero: 'No hi ha elements',
		one: 'Hi ha 1 element',
		other: 'Hi ha ${n} elements',
	);
}

/// The flat map containing all translations for locale <ca>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'appBarTitle' => 'Traduccions · Slang',
			'welcome' => 'Benvingut/da al curs de Flutter!',
			'greeting' => ({required Object name}) => 'Hola, ${name}!',
			'itemsCount' => ({required num n}) => (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ca'))(n, zero: 'No hi ha elements', one: 'Hi ha 1 element', other: 'Hi ha ${n} elements', ), 
			_ => null,
		};
	}
}
