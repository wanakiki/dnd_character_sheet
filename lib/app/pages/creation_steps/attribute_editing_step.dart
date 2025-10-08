
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AttributeEditingStep extends StatefulWidget {
  final String? selectedRace;
  final Function(Map<String, int>) onAttributesChanged;

  const AttributeEditingStep({
    super.key,
    required this.selectedRace,
    required this.onAttributesChanged,
  });

  @override
  State<AttributeEditingStep> createState() => _AttributeEditingStepState();
}

class _AttributeEditingStepState extends State<AttributeEditingStep> {
  final Map<String, _AttributeControllers> _controllers = {
    '力量': _AttributeControllers(),
    '敏捷': _AttributeControllers(),
    '体质': _AttributeControllers(),
    '智力': _AttributeControllers(),
    '感知': _AttributeControllers(),
    '魅力': _AttributeControllers(),
  };

  String _racialBonusHint = '正在加载种族加成...';

  // Data parsed from markdown files
  final Map<String, String> racialBonuses = {
    '人类': '你的全部属性值加1。',
    '侏儒': '你的智力加2。',
    '侏儒-岩侏儒': '你的体质加1。',
    '侏儒-森林侏儒': '你的敏捷加1。',
    '半兽人': '你的力量加2，你的体质加1。',
    '半精灵': '你的魅力加2。再选择其他两项属性值各加1。',
    '半身人': '你的敏捷加2。',
    '提夫林': '你的智力加1，你的魅力加2。',
    '矮人': '你的体质加2。',
    '矮人-丘陵矮人': '你的感知值加1。',
    '矮人-山地矮人': '你的力量值加2。',
    '精灵': '你的敏捷加2。',
    '龙裔': '你力量加2，魅力加1。',
  };

  @override
  void initState() {
    super.initState();
    _updateRacialBonusHintAndApply();
    for (var controllers in _controllers.values) {
      controllers.baseController.addListener(_onChanged);
      controllers.bonusController.addListener(_onChanged);
    }
  }

  @override
  void didUpdateWidget(covariant AttributeEditingStep oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedRace != oldWidget.selectedRace) {
      _updateRacialBonusHintAndApply();
    }
  }

  @override
  void dispose() {
    for (var controllers in _controllers.values) {
      controllers.dispose();
    }
    super.dispose();
  }

  void _onChanged() {
    final Map<String, int> totals = {};
    _controllers.forEach((key, value) {
      totals[key] = value.total;
    });
    widget.onAttributesChanged(totals);
    setState(() {
      // Re-render the totals
    });
  }

  void _updateRacialBonusHintAndApply() {
    if (widget.selectedRace == null) {
      setState(() {
        _racialBonusHint = '请先选择一个种族。';
      });
      _clearBonuses();
      return;
    }

    // Handle combined race-subrace names
    String raceKey = widget.selectedRace!;
    String? subraceKey;
    if (raceKey.contains('-')) {
        var parts = raceKey.split('-');
        raceKey = parts[0];
        subraceKey = widget.selectedRace;
    }

    String hint = '找不到您的种族加成信息。';
    String bonusStringToParse = '';

    if (racialBonuses.containsKey(raceKey)) {
        bonusStringToParse += racialBonuses[raceKey]!;
        hint = '因为您选择了 ${widget.selectedRace}，所以您的属性加成为：${racialBonuses[raceKey]!}';
    }
    if (subraceKey != null && racialBonuses.containsKey(subraceKey)) {
        bonusStringToParse += ' ' + racialBonuses[subraceKey]!;
        hint += ' ${racialBonuses[subraceKey]!}';
    }
    
    setState(() {
      _racialBonusHint = hint;
    });

    _applyRacialBonuses(bonusStringToParse);
  }

  void _clearBonuses() {
    for (var controller in _controllers.values) {
      controller.bonusController.text = '0';
    }
  }

  void _applyRacialBonuses(String bonusString) {
    _clearBonuses();

    if (bonusString.isEmpty) return;

    // Handle Human special case
    if (bonusString.contains('全部属性值加1')) {
      for (var controller in _controllers.values) {
        controller.bonusController.text = '1';
      }
      return;
    }
    
    // Handle Half-Elf special case
    if (bonusString.contains('再选择其他两项属性值各加1')) {
        setState(() {
            _racialBonusHint += ' (请手动选择两项+1)';
        });
    }

    final Map<String, String> attributeNameMap = {
      '力量': '力量',
      '敏捷': '敏捷',
      '体质': '体质',
      '智力': '智力',
      '感知': '感知',
      '魅力': '魅力',
    };

    for (var entry in attributeNameMap.entries) {
        final regex = RegExp('${entry.key}[值加各]*([0-9]+)');
        final match = regex.firstMatch(bonusString);
        if (match != null) {
            final value = match.group(1) ?? '0';
            _controllers[entry.value]?.bonusController.text = value;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('输入你的属性点:', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text(_racialBonusHint, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.blue.shade800)),
          const SizedBox(height: 16),
          _buildHeader(),
          const Divider(),
          ..._controllers.entries.map((entry) {
            return _buildAttributeRow(entry.key, entry.value);
          }),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const Row(
      children: [
        Expanded(flex: 2, child: Text('属性', style: TextStyle(fontWeight: FontWeight.bold))),
        Expanded(flex: 1, child: Center(child: Text('基础值', style: TextStyle(fontWeight: FontWeight.bold)))),
        Expanded(flex: 1, child: Center(child: Text('+', style: TextStyle(fontWeight: FontWeight.bold)))),
        Expanded(flex: 1, child: Center(child: Text('种族加成', style: TextStyle(fontWeight: FontWeight.bold)))),
        Expanded(flex: 1, child: Center(child: Text('=', style: TextStyle(fontWeight: FontWeight.bold)))),
        Expanded(flex: 1, child: Center(child: Text('总值', style: TextStyle(fontWeight: FontWeight.bold)))),
      ],
    );
  }

  Widget _buildAttributeRow(String name, _AttributeControllers controllers) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(name)),
          Expanded(flex: 1, child: _buildTextField(controllers.baseController)),
          const Expanded(flex: 1, child: Center(child: Text('+'))),
          Expanded(flex: 1, child: _buildTextField(controllers.bonusController, readOnly: true)),
          const Expanded(flex: 1, child: Center(child: Text('='))),
          Expanded(flex: 1, child: Center(child: Text(controllers.total.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, {bool readOnly = false}) {
    return SizedBox(
      height: 35,
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          contentPadding: EdgeInsets.zero,
          fillColor: readOnly ? Colors.grey.shade200 : null,
          filled: readOnly,
        ),
      ),
    );
  }
}

class _AttributeControllers {
  final TextEditingController baseController = TextEditingController(text: '10');
  final TextEditingController bonusController = TextEditingController(text: '0');

  int get total {
    final base = int.tryParse(baseController.text) ?? 0;
    final bonus = int.tryParse(bonusController.text) ?? 0;
    return base + bonus;
  }

  void dispose() {
    baseController.dispose();
    bonusController.dispose();
  }
}
