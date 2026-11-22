import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_kore_satranci/oyun_kore_satranci.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(koreSatranciConfig.title.length, 33);
    expect(koreSatranciConfig.tagline.length, 33);
    for (final s in koreSatranciConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler çözülebilir', () {
    final planner = LevelPlanner(gameId: koreSatranciId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 49999]) {
      final gl = koreSatranciRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
