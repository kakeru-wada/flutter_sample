import 'package:flutter/widgets.dart';

//sign in の状態管理
class BookstoreAuth extends ChangeNotifier {
  bool _signedIn = false;

  bool get signedIn => _signedIn;

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    _signedIn = false;
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }

  @override
  bool operator ==(Object other) =>
      other is BookstoreAuth && other._signedIn == _signedIn;

  @override
  int get hashCode => _signedIn.hashCode;
}

// class BookstoreAuthScope extends InheritedNotifier<BookstoreAuth> {
//   const BookstoreAuthScope({
//     required BookstoreAuth notifier,
//     required Widget child,
//     Key? key,
//   }) : super(key: key, notifier: notifier, child: child);
//
//   static BookstoreAuth of(BuildContext context) => context
//       .dependOnInheritedWidgetOfExactType<BookstoreAuthScope>()!
//       .notifier!;
// }