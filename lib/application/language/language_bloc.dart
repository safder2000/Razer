import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:razer/presentation/account/account_settings/select_language/locale_provider.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(InitialState()) {
    on<LanguageEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<ChangeLang>((event, emit) {
      emit(LanguageState(locale: event.newLocale));
      // TODO: implement event handler
    });
  }
}
