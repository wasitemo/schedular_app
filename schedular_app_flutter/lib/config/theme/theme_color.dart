import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff616219),
      surfaceTint: Color(0xff616219),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe7e790),
      onPrimaryContainer: Color(0xff494900),
      secondary: Color(0xff606043),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe6e4bf),
      onSecondaryContainer: Color(0xff48482d),
      tertiary: Color(0xff3d6657),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffbfecd9),
      onTertiaryContainer: Color(0xff254e40),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffdf9ec),
      onSurface: Color(0xff1c1c14),
      onSurfaceVariant: Color(0xff48473a),
      outline: Color(0xff797869),
      outlineVariant: Color(0xffc9c7b6),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffcbcb77),
      primaryFixed: Color(0xffe7e790),
      onPrimaryFixed: Color(0xff1c1d00),
      primaryFixedDim: Color(0xffcbcb77),
      onPrimaryFixedVariant: Color(0xff494900),
      secondaryFixed: Color(0xffe6e4bf),
      onSecondaryFixed: Color(0xff1c1d06),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff48482d),
      tertiaryFixed: Color(0xffbfecd9),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff254e40),
      surfaceDim: Color(0xffdddacd),
      surfaceBright: Color(0xfffdf9ec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f4e6),
      surfaceContainer: Color(0xfff1eee1),
      surfaceContainerHigh: Color(0xffebe8db),
      surfaceContainerHighest: Color(0xffe6e3d5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff383800),
      surfaceTint: Color(0xff616219),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff707027),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff37371e),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff6f6f50),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff123d30),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff4c7565),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf9ec),
      onSurface: Color(0xff12120a),
      onSurfaceVariant: Color(0xff37372a),
      outline: Color(0xff545346),
      outlineVariant: Color(0xff6f6e5f),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffcbcb77),
      primaryFixed: Color(0xff707027),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff57580e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff6f6f50),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff56563a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff4c7565),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff335d4e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9c7ba),
      surfaceBright: Color(0xfffdf9ec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f4e6),
      surfaceContainer: Color(0xffebe8db),
      surfaceContainerHigh: Color(0xffe0ddd0),
      surfaceContainerHighest: Color(0xffd5d2c5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2d2e00),
      surfaceTint: Color(0xff616219),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4b4c02),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2d2d15),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff4b4b2f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff053326),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff275142),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf9ec),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2d2d21),
      outlineVariant: Color(0xff4a4a3d),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313128),
      inversePrimary: Color(0xffcbcb77),
      primaryFixed: Color(0xff4b4c02),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff343500),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff4b4b2f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff34341b),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff275142),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff0e3a2c),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffbbb9ad),
      surfaceBright: Color(0xfffdf9ec),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff4f1e3),
      surfaceContainer: Color(0xffe6e3d5),
      surfaceContainerHigh: Color(0xffd7d5c8),
      surfaceContainerHighest: Color(0xffc9c7ba),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcbcb77),
      surfaceTint: Color(0xffcbcb77),
      onPrimary: Color(0xff323200),
      primaryContainer: Color(0xff494900),
      onPrimaryContainer: Color(0xffe7e790),
      secondary: Color(0xffcac8a5),
      onSecondary: Color(0xff323218),
      secondaryContainer: Color(0xff48482d),
      onSecondaryContainer: Color(0xffe6e4bf),
      tertiary: Color(0xffa4d0bd),
      onTertiary: Color(0xff0a372a),
      tertiaryContainer: Color(0xff254e40),
      onTertiaryContainer: Color(0xffbfecd9),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff14140c),
      onSurface: Color(0xffe6e3d5),
      onSurfaceVariant: Color(0xffc9c7b6),
      outline: Color(0xff939182),
      outlineVariant: Color(0xff48473a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e3d5),
      inversePrimary: Color(0xff616219),
      primaryFixed: Color(0xffe7e790),
      onPrimaryFixed: Color(0xff1c1d00),
      primaryFixedDim: Color(0xffcbcb77),
      onPrimaryFixedVariant: Color(0xff494900),
      secondaryFixed: Color(0xffe6e4bf),
      onSecondaryFixed: Color(0xff1c1d06),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff48482d),
      tertiaryFixed: Color(0xffbfecd9),
      onTertiaryFixed: Color(0xff002117),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff254e40),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff3a3a30),
      surfaceContainerLowest: Color(0xff0f0f07),
      surfaceContainerLow: Color(0xff1c1c14),
      surfaceContainer: Color(0xff202018),
      surfaceContainerHigh: Color(0xff2b2a22),
      surfaceContainerHighest: Color(0xff36352c),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe1e18a),
      surfaceTint: Color(0xffcbcb77),
      onPrimary: Color(0xff272700),
      primaryContainer: Color(0xff949547),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0deb9),
      onSecondary: Color(0xff27270f),
      secondaryContainer: Color(0xff939272),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffb9e6d3),
      onTertiary: Color(0xff002c20),
      tertiaryContainer: Color(0xff6f9a88),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff14140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe0ddcb),
      outline: Color(0xffb5b2a2),
      outlineVariant: Color(0xff939181),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e3d5),
      inversePrimary: Color(0xff4a4b00),
      primaryFixed: Color(0xffe7e790),
      onPrimaryFixed: Color(0xff121200),
      primaryFixedDim: Color(0xffcbcb77),
      onPrimaryFixedVariant: Color(0xff383800),
      secondaryFixed: Color(0xffe6e4bf),
      onSecondaryFixed: Color(0xff121201),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff37371e),
      tertiaryFixed: Color(0xffbfecd9),
      onTertiaryFixed: Color(0xff00150e),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff123d30),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff46453b),
      surfaceContainerLowest: Color(0xff080803),
      surfaceContainerLow: Color(0xff1e1e16),
      surfaceContainer: Color(0xff292820),
      surfaceContainerHigh: Color(0xff33332a),
      surfaceContainerHighest: Color(0xff3f3e35),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfff5f59c),
      surfaceTint: Color(0xffcbcb77),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffc7c773),
      onPrimaryContainer: Color(0xff0c0c00),
      secondary: Color(0xfff4f2cc),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffc6c4a1),
      onSecondaryContainer: Color(0xff0c0c00),
      tertiary: Color(0xffccfae6),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffa0ccb9),
      onTertiaryContainer: Color(0xff000e08),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff14140c),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff4f0de),
      outlineVariant: Color(0xffc5c3b2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe6e3d5),
      inversePrimary: Color(0xff4a4b00),
      primaryFixed: Color(0xffe7e790),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffcbcb77),
      onPrimaryFixedVariant: Color(0xff121200),
      secondaryFixed: Color(0xffe6e4bf),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffcac8a5),
      onSecondaryFixedVariant: Color(0xff121201),
      tertiaryFixed: Color(0xffbfecd9),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffa4d0bd),
      onTertiaryFixedVariant: Color(0xff00150e),
      surfaceDim: Color(0xff14140c),
      surfaceBright: Color(0xff515047),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff202018),
      surfaceContainer: Color(0xff313128),
      surfaceContainerHigh: Color(0xff3c3c33),
      surfaceContainerHighest: Color(0xff48473e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
