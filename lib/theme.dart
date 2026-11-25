import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class PawColors {
  static const ink = Color(0xFF1C2822);
  static const forest = Color(0xFF1B4332);
  static const forestDeep = Color(0xFF10281E);
  static const leaf = Color(0xFF2F6A4A);
  static const clay = Color(0xFFC4622D);
  static const clayDeep = Color(0xFF8E4218);
  static const cream = Color(0xFFF3EEE6);
  static const paper = Color(0xFFFFFBF6);
  static const sand = Color(0xFFE4D8C8);
  static const mist = Color(0xFFE5EFE8);
  static const blush = Color(0xFFF8E7D8);
  static const blushLine = Color(0xFFE7C4A8);
}

TextStyle pawDisplay(double size, {Color color = PawColors.ink}) {
  return GoogleFonts.fraunces(
    fontSize: size,
    fontWeight: FontWeight.w600,
    height: 1.12,
    letterSpacing: -0.4,
    color: color,
  ).copyWith(
    fontFamilyFallback: [
      GoogleFonts.notoSerifDevanagari().fontFamily ?? 'serif',
      GoogleFonts.notoSansGurmukhi().fontFamily ?? 'sans-serif',
    ],
  );
}

ThemeData buildPawTheme() {
  final base = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: PawColors.cream,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PawColors.forest,
      primary: PawColors.forest,
      onPrimary: PawColors.cream,
      secondary: PawColors.clayDeep,
      onSecondary: Colors.white,
      surface: PawColors.paper,
      onSurface: PawColors.ink,
    ),
  );

  final text = GoogleFonts.outfitTextTheme(base.textTheme).apply(
    bodyColor: PawColors.ink,
    displayColor: PawColors.ink,
    fontFamilyFallback: [
      GoogleFonts.notoSansDevanagari().fontFamily ?? 'sans-serif',
      GoogleFonts.notoSansGurmukhi().fontFamily ?? 'sans-serif',
    ],
  );

  return base.copyWith(
    textTheme: text,
    splashFactory: InkRipple.splashFactory,
  );
}
