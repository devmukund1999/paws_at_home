import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import 'copy.dart';
import 'theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Lang lang = Lang.hi;
  PetKind pet = PetKind.dog;
  final _formAnchor = GlobalKey();

  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _petName = TextEditingController();
  final _from = TextEditingController();
  final _to = TextEditingController();
  final _notes = TextEditingController();

  Copy get copy => copies[lang]!;

  @override
  void initState() {
    super.initState();
    for (final controller in [_name, _phone, _petName, _from, _to, _notes]) {
      controller.addListener(_rebuild);
    }
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    for (final controller in [_name, _phone, _petName, _from, _to, _notes]) {
      controller.dispose();
    }
    super.dispose();
  }

  String get _message => buildPetMessage(
    copy: copy,
    name: _name.text,
    phone: _phone.text,
    pet: copy.petLabel(pet),
    petName: _petName.text,
    from: _from.text,
    to: _to.text,
    notes: _notes.text,
  );

  bool get _ready =>
      _name.text.trim().isNotEmpty &&
      _from.text.trim().isNotEmpty &&
      _to.text.trim().isNotEmpty;

  void _toast(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(text),
          behavior: SnackBarBehavior.floating,
          backgroundColor: PawColors.forestDeep,
        ),
      );
  }

  Future<void> _open(Uri uri) async {
    try {
      final opened = await launchUrl(uri, mode: LaunchMode.platformDefault);
      if (!opened && mounted) _toast(copy.openFailed);
    } catch (_) {
      if (mounted) _toast(copy.openFailed);
    }
  }

  Future<void> _call() => _open(Uri.parse('tel:$pawPhoneTel'));

  Future<void> _send() async {
    if (!_ready) {
      _toast(copy.missing);
      return;
    }
    final uri = Uri.parse(
      'https://wa.me/$pawWhatsApp?text=${Uri.encodeComponent(_message)}',
    );
    await _open(uri);
  }

  Future<void> _copyMessage() async {
    if (!_ready) {
      _toast(copy.missing);
      return;
    }
    await Clipboard.setData(ClipboardData(text: _message));
    if (mounted) _toast(copy.copied);
  }

  void _jumpToForm() {
    final target = _formAnchor.currentContext;
    if (target == null) return;
    Scrollable.ensureVisible(
      target,
      duration: const Duration(milliseconds: 420),
      curve: Curves.easeOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 900;

    return Scaffold(
      backgroundColor: PawColors.cream,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _Nav(
              wide: wide,
              lang: lang,
              copy: copy,
              onLang: (value) => setState(() => lang = value),
              onCall: _call,
              onWhatsApp: _jumpToForm,
            ),
            Expanded(
              child: SelectionArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _frame(
                        child: _Hero(
                          wide: wide,
                          copy: copy,
                          onDetails: _jumpToForm,
                          onCall: _call,
                        ),
                      ),
                      const SizedBox(height: 28),
                      _frame(
                        child: _Steps(wide: wide, copy: copy),
                      ),
                      const SizedBox(height: 18),
                      _frame(
                        child: _Pets(wide: wide, copy: copy),
                      ),
                      const SizedBox(height: 18),
                      _frame(
                        child: _Care(wide: wide, copy: copy),
                      ),
                      const SizedBox(height: 18),
                      _frame(child: _Limit(copy: copy)),
                      const SizedBox(height: 28),
                      _frame(
                        child: _DetailsForm(
                          anchor: _formAnchor,
                          wide: wide,
                          copy: copy,
                          pet: pet,
                          onPet: (value) => setState(() => pet = value),
                          name: _name,
                          phone: _phone,
                          petName: _petName,
                          from: _from,
                          to: _to,
                          notes: _notes,
                          message: _message,
                          onSend: _send,
                          onCopy: _copyMessage,
                        ),
                      ),
                      const SizedBox(height: 28),
                      _frame(child: _Faqs(copy: copy)),
                      const SizedBox(height: 36),
                      _Footer(copy: copy, onCall: _call),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: wide
          ? null
          : _MobileBar(copy: copy, onCall: _call, onWhatsApp: _jumpToForm),
    );
  }
}

Widget _frame({required Widget child}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1080),
        child: child,
      ),
    ),
  );
}

class _Nav extends StatelessWidget {
  const _Nav({
    required this.wide,
    required this.lang,
    required this.copy,
    required this.onLang,
    required this.onCall,
    required this.onWhatsApp,
  });

  final bool wide;
  final Lang lang;
  final Copy copy;
  final ValueChanged<Lang> onLang;
  final VoidCallback onCall;
  final VoidCallback onWhatsApp;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PawColors.forestDeep,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Row(
              children: [
                const _Mark(),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Paws at Home',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: pawDisplay(wide ? 26 : 20, color: PawColors.cream),
                  ),
                ),
                const SizedBox(width: 8),
                _LangSwitch(lang: lang, onChanged: onLang),
                if (wide) ...[
                  const SizedBox(width: 12),
                  _NavButton(
                    label: copy.navCall,
                    filled: false,
                    onPressed: onCall,
                  ),
                  const SizedBox(width: 8),
                  _NavButton(
                    label: copy.navWhatsApp,
                    filled: true,
                    onPressed: onWhatsApp,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Mark extends StatelessWidget {
  const _Mark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        color: PawColors.clay,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.pets, color: Colors.white, size: 20),
    );
  }
}

class _LangSwitch extends StatelessWidget {
  const _LangSwitch({required this.lang, required this.onChanged});

  final Lang lang;
  final ValueChanged<Lang> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final value in Lang.values)
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: _LangChip(
                label: copies[value]!.code,
                selected: value == lang,
                onTap: () => onChanged(value),
              ),
            ),
        ],
      ),
    );
  }
}

class _LangChip extends StatelessWidget {
  const _LangChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? PawColors.cream : Colors.transparent,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: selected ? PawColors.forestDeep : PawColors.cream,
            ),
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.filled,
    required this.onPressed,
  });

  final String label;
  final bool filled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final style = filled
        ? FilledButton.styleFrom(
            backgroundColor: PawColors.clayDeep,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          )
        : OutlinedButton.styleFrom(
            foregroundColor: PawColors.cream,
            side: const BorderSide(color: Color(0x66F3EEE6)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          );
    final button = filled
        ? FilledButton(onPressed: onPressed, style: style, child: Text(label))
        : OutlinedButton(
            onPressed: onPressed,
            style: style,
            child: Text(label),
          );
    return button;
  }
}

class _Hero extends StatelessWidget {
  const _Hero({
    required this.wide,
    required this.copy,
    required this.onDetails,
    required this.onCall,
  });

  final bool wide;
  final Copy copy;
  final VoidCallback onDetails;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    final story = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          copy.kicker.toUpperCase(),
          style: const TextStyle(
            color: PawColors.clayDeep,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 12),
        Text(copy.heroTitle, style: pawDisplay(wide ? 52 : 34)),
        const SizedBox(height: 14),
        Text(
          copy.heroBody,
          style: const TextStyle(fontSize: 16.5, height: 1.5),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            FilledButton.icon(
              onPressed: onDetails,
              icon: const Icon(Icons.edit_outlined, size: 18),
              label: Text(copy.ctaDetails),
              style: FilledButton.styleFrom(
                backgroundColor: PawColors.clayDeep,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: onCall,
              icon: const Icon(Icons.call_outlined, size: 18),
              label: const Text(pawPhoneDisplay),
              style: OutlinedButton.styleFrom(
                foregroundColor: PawColors.forest,
                side: const BorderSide(color: PawColors.forest),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 18),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            for (final item in copy.trust) _TrustPill(item),
          ],
        ),
      ],
    );

    final card = _DayCard(copy: copy);
    return Padding(
      padding: const EdgeInsets.only(top: 36, bottom: 8),
      child: wide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 6, child: story),
                const SizedBox(width: 28),
                Expanded(flex: 5, child: card),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                story,
                const SizedBox(height: 22),
                card,
              ],
            ),
    );
  }
}

class _TrustPill extends StatelessWidget {
  const _TrustPill(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: PawColors.mist,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}

class _DayCard extends StatelessWidget {
  const _DayCard({required this.copy});
  final Copy copy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 8),
      decoration: BoxDecoration(
        color: PawColors.forest,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            copy.dayTitle,
            style: pawDisplay(26, color: PawColors.cream),
          ),
          const SizedBox(height: 8),
          for (final line in copy.dayLines)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.only(top: 7),
                    decoration: const BoxDecoration(
                      color: PawColors.clay,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          line.when,
                          style: const TextStyle(
                            color: Color(0xFFE7C4A8),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          line.detail,
                          style: const TextStyle(
                            color: PawColors.cream,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _Steps extends StatelessWidget {
  const _Steps({required this.wide, required this.copy});
  final bool wide;
  final Copy copy;

  @override
  Widget build(BuildContext context) {
    final cards = [
      for (var i = 0; i < copy.steps.length; i++)
        _StepCard(number: i + 1, step: copy.steps[i]),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Heading(kicker: copy.howKicker, title: copy.howTitle),
        const SizedBox(height: 16),
        if (wide)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var i = 0; i < cards.length; i++) ...[
                  if (i > 0) const SizedBox(width: 14),
                  Expanded(child: cards[i]),
                ],
              ],
            ),
          )
        else
          for (var i = 0; i < cards.length; i++) ...[
            if (i > 0) const SizedBox(height: 12),
            cards[i],
          ],
      ],
    );
  }
}

class _StepCard extends StatelessWidget {
  const _StepCard({required this.number, required this.step});
  final int number;
  final StepCopy step;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PawColors.paper,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: PawColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: PawColors.forest,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: const TextStyle(
                color: PawColors.cream,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(step.title, style: pawDisplay(22)),
          const SizedBox(height: 6),
          Text(step.body, style: const TextStyle(height: 1.45, fontSize: 15)),
        ],
      ),
    );
  }
}

class _Pets extends StatelessWidget {
  const _Pets({required this.wide, required this.copy});
  final bool wide;
  final Copy copy;

  @override
  Widget build(BuildContext context) {
    final dog = _PetCard(
      title: copy.dogTitle,
      body: copy.dogBody,
      tint: PawColors.paper,
    );
    final cat = _PetCard(
      title: copy.catTitle,
      body: copy.catBody,
      tint: PawColors.mist,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Heading(kicker: copy.whoKicker, title: copy.whoTitle),
        const SizedBox(height: 16),
        if (wide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: dog),
              const SizedBox(width: 14),
              Expanded(child: cat),
            ],
          )
        else ...[
          dog,
          const SizedBox(height: 12),
          cat,
        ],
      ],
    );
  }
}

class _PetCard extends StatelessWidget {
  const _PetCard({
    required this.title,
    required this.body,
    required this.tint,
  });

  final String title;
  final String body;
  final Color tint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: tint,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: PawColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.pets, color: PawColors.leaf),
          const SizedBox(height: 10),
          Text(title, style: pawDisplay(28)),
          const SizedBox(height: 6),
          Text(body, style: const TextStyle(height: 1.45, fontSize: 15.5)),
        ],
      ),
    );
  }
}

class _Care extends StatelessWidget {
  const _Care({required this.wide, required this.copy});
  final bool wide;
  final Copy copy;

  @override
  Widget build(BuildContext context) {
    final care = _Panel(
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          for (final item in copy.careItems)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: PawColors.mist,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Text(item, style: const TextStyle(fontSize: 14)),
            ),
        ],
      ),
    );
    final pack = _Panel(
      title: copy.packTitle,
      child: Column(
        children: [
          for (final item in copy.packItems)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Icon(Icons.circle, size: 7, color: PawColors.clay),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(item, style: const TextStyle(height: 1.4)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Heading(kicker: copy.careKicker, title: copy.careTitle),
        const SizedBox(height: 16),
        if (wide)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: care),
              const SizedBox(width: 14),
              Expanded(child: pack),
            ],
          )
        else ...[
          care,
          const SizedBox(height: 12),
          pack,
        ],
      ],
    );
  }
}

class _Panel extends StatelessWidget {
  const _Panel({this.title, required this.child});
  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PawColors.paper,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: PawColors.sand),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) ...[
            Text(title!, style: pawDisplay(24)),
            const SizedBox(height: 12),
          ],
          child,
        ],
      ),
    );
  }
}

class _Limit extends StatelessWidget {
  const _Limit({required this.copy});
  final Copy copy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: PawColors.blush,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: PawColors.blushLine),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.info_outline, color: PawColors.clayDeep),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  copy.limitTitle,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(copy.limitBody, style: const TextStyle(height: 1.45)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsForm extends StatelessWidget {
  const _DetailsForm({
    required this.anchor,
    required this.wide,
    required this.copy,
    required this.pet,
    required this.onPet,
    required this.name,
    required this.phone,
    required this.petName,
    required this.from,
    required this.to,
    required this.notes,
    required this.message,
    required this.onSend,
    required this.onCopy,
  });

  final Key anchor;
  final bool wide;
  final Copy copy;
  final PetKind pet;
  final ValueChanged<PetKind> onPet;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController petName;
  final TextEditingController from;
  final TextEditingController to;
  final TextEditingController notes;
  final String message;
  final VoidCallback onSend;
  final VoidCallback onCopy;

  @override
  Widget build(BuildContext context) {
    final fields = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _field(copy.fName, name),
        const SizedBox(height: 12),
        _field(copy.fPhone, phone, hint: copy.fPhoneHint, phone: true),
        const SizedBox(height: 12),
        Text(
          copy.fPet,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _PetChoice(
              label: copy.petDog,
              selected: pet == PetKind.dog,
              onTap: () => onPet(PetKind.dog),
            ),
            const SizedBox(width: 8),
            _PetChoice(
              label: copy.petCat,
              selected: pet == PetKind.cat,
              onTap: () => onPet(PetKind.cat),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _field(copy.fPetName, petName, hint: copy.fPetNameHint),
        const SizedBox(height: 12),
        if (wide)
          Row(
            children: [
              Expanded(child: _field(copy.fFrom, from, hint: copy.fFromHint)),
              const SizedBox(width: 12),
              Expanded(child: _field(copy.fTo, to, hint: copy.fToHint)),
            ],
          )
        else ...[
          _field(copy.fFrom, from, hint: copy.fFromHint),
          const SizedBox(height: 12),
          _field(copy.fTo, to, hint: copy.fToHint),
        ],
        const SizedBox(height: 12),
        _field(copy.fNotes, notes, hint: copy.fNotesHint, lines: 3),
        const SizedBox(height: 16),
        FilledButton.icon(
          onPressed: onSend,
          icon: const Icon(Icons.chat_outlined),
          label: Text(copy.send),
          style: FilledButton.styleFrom(
            backgroundColor: PawColors.leaf,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.5,
            ),
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: onCopy,
          icon: const Icon(Icons.copy_outlined),
          label: Text(copy.copyMessage),
          style: OutlinedButton.styleFrom(
            foregroundColor: PawColors.forest,
            side: const BorderSide(color: PawColors.forest),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.5,
            ),
          ),
        ),
      ],
    );

    final preview = Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F1E8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            copy.previewLabel,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: PawColors.clayDeep,
            ),
          ),
          const SizedBox(height: 8),
          Text(message, style: const TextStyle(height: 1.45, fontSize: 14)),
        ],
      ),
    );

    return Container(
      key: anchor,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: PawColors.paper,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: PawColors.sand),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 28,
            offset: Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Heading(kicker: copy.formKicker, title: copy.formTitle),
          const SizedBox(height: 8),
          Text(copy.formBody, style: const TextStyle(height: 1.45)),
          const SizedBox(height: 18),
          if (wide)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: fields),
                const SizedBox(width: 22),
                Expanded(child: preview),
              ],
            )
          else ...[
            fields,
            const SizedBox(height: 16),
            preview,
          ],
        ],
      ),
    );
  }

  Widget _field(
    String label,
    TextEditingController controller, {
    String? hint,
    bool phone = false,
    int lines = 1,
  }) {
    return TextField(
      controller: controller,
      keyboardType: phone ? TextInputType.phone : TextInputType.text,
      minLines: lines,
      maxLines: lines,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: PawColors.sand),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: PawColors.sand),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: PawColors.forest, width: 1.4),
        ),
      ),
    );
  }
}

class _PetChoice extends StatelessWidget {
  const _PetChoice({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? PawColors.forest : Colors.white,
      borderRadius: BorderRadius.circular(999),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(999),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: selected ? PawColors.forest : PawColors.sand,
            ),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: selected ? PawColors.cream : PawColors.ink,
            ),
          ),
        ),
      ),
    );
  }
}

class _Faqs extends StatelessWidget {
  const _Faqs({required this.copy});
  final Copy copy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Heading(kicker: copy.faqKicker, title: copy.faqTitle),
        const SizedBox(height: 8),
        for (final faq in copy.faqs)
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: PawColors.paper,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: PawColors.sand),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  faq.q,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(faq.a, style: const TextStyle(height: 1.45)),
              ],
            ),
          ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({required this.copy, required this.onCall});
  final Copy copy;
  final VoidCallback onCall;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: PawColors.forestDeep,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
        child: Align(
          alignment: Alignment.center,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1080),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Paws at Home',
                  style: pawDisplay(28, color: PawColors.cream),
                ),
                const SizedBox(height: 6),
                Text(
                  copy.footerLine,
                  style: const TextStyle(color: PawColors.cream, height: 1.4),
                ),
                const SizedBox(height: 10),
                TextButton.icon(
                  onPressed: onCall,
                  icon: const Icon(Icons.call_outlined, color: PawColors.cream),
                  label: const Text(pawPhoneDisplay),
                  style: TextButton.styleFrom(
                    foregroundColor: PawColors.cream,
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Text(
                  copy.footerNote,
                  style: TextStyle(
                    color: PawColors.cream.withValues(alpha: 0.75),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileBar extends StatelessWidget {
  const _MobileBar({
    required this.copy,
    required this.onCall,
    required this.onWhatsApp,
  });

  final Copy copy;
  final VoidCallback onCall;
  final VoidCallback onWhatsApp;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: PawColors.paper,
      elevation: 8,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          child: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: onCall,
                  icon: const Icon(Icons.call_outlined, size: 18),
                  label: Text(copy.navCall),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: PawColors.forest,
                    side: const BorderSide(color: PawColors.forest),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: FilledButton.icon(
                  onPressed: onWhatsApp,
                  icon: const Icon(Icons.chat_outlined, size: 18),
                  label: Text(copy.navWhatsApp),
                  style: FilledButton.styleFrom(
                    backgroundColor: PawColors.leaf,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Heading extends StatelessWidget {
  const _Heading({required this.kicker, required this.title});
  final String kicker;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kicker.toUpperCase(),
          style: const TextStyle(
            color: PawColors.clayDeep,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.05,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 6),
        Text(title, style: pawDisplay(32)),
      ],
    );
  }
}
