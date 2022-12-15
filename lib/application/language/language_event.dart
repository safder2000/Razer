part of 'language_bloc.dart';

@immutable
abstract class LanguageEvent {}

class ChangeLang extends LanguageEvent {
  ChangeLang({required this.newLocale});
  Locale newLocale;
}
