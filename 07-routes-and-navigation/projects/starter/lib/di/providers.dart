import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/models.dart';
import 'locator.dart';

final groceryManagerProvider = ChangeNotifierProvider((ref) => locator.get<GroceryManager>());
final profileManagerProvider = ChangeNotifierProvider((ref) => locator.get<ProfileManager>());
final appStateManagerProvider = ChangeNotifierProvider((ref) => locator.get<AppStateManager>());
