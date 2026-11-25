import 'package:material_ui/material_ui.dart';

import 'home_page.dart';
import 'theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const PawApp());
}

class PawApp extends StatelessWidget {
  const PawApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paws at Home',
      debugShowCheckedModeBanner: false,
      theme: buildPawTheme(),
      home: const HomePage(),
    );
  }
}
