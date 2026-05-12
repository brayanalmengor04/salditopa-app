// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'SalditoPA';

  @override
  String get subtitle => 'Un buen plato comienza con buenos ingredientes 🥦';

  @override
  String get emailHint => 'Correo electrónico';

  @override
  String get passwordHint => 'Contraseña';

  @override
  String get loginButton => 'Iniciar sesión';

  @override
  String get noAccountText => '¿No tienes cuenta? Registrate aqui';

  @override
  String get orDivider => 'O';
}
