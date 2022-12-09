part of 'language_bloc.dart';

@immutable
class LanguageState {
  LanguageState({required this.locale});
  Locale locale;
}

class InitialState extends LanguageState {
  InitialState() : super(locale: Locale('en'));
}
