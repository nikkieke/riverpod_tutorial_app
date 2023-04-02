

import 'package:flutter_riverpod/flutter_riverpod.dart';

final title = Provider<String>((ref) => "Simple Counter");

final counter = StateProvider((ref) => 0);

