
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:groceryapp/logic/blocs/auth_bloc.dart';
import 'package:groceryapp/logic/blocs/cart_bloc.dart';
import 'package:groceryapp/logic/blocs/grocery_bloc.dart';

class DependencyInjection {
  static List<BlocProvider> getBlocProviders() {
    return [
      BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      BlocProvider<CartBloc>(create: (context) => CartBloc()),
      BlocProvider<GroceryBloc>(create: (context) => GroceryBloc()),
    ];
  }
}
