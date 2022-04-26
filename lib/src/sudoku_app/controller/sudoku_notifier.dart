import 'package:flutter/cupertino.dart';
import 'sudoku_solver.dart';

class SudokuState extends ChangeNotifier {
  Snapshot _solvedBoard = Snapshot();
  bool? _solved;
  List<Pos> _startPos = [];
  Pos? focusPos;
  List showBoard = Snapshot.makeBoard();
  int _solvedNum = 0;

  Snapshot get solvedBoard => _solvedBoard;
  bool? get solved => _solved;
  int get solvedNum => _solvedNum;

  void setPos(int x, int y) {
    if (0 <= x && x < 9 && 0 <= y && y < 9) {
      var newPos = Pos(x: x, y: y, n: 0);
      if (focusPos == newPos) {
        focusPos == null;
      } else {
        focusPos = Pos(x: x, y: y, n: 0);
      }
      notifyListeners();
    }
  }

  void setFocus(int n) {
    if (focusPos != null) {
      Pos newPos = Pos(x: focusPos!.x, y: focusPos!.y, n: n);
      List<Pos> listPos = [];
      for (var pos in _startPos) {
        if (pos.x == newPos.x && pos.y == newPos.y) {
          listPos.add(newPos);
        } else {
          listPos.add(pos);
        }
      }
      if (_startPos.length == listPos.length) {
        listPos.add(newPos);
      }
      _startPos = listPos;
      showBoard[focusPos!.x][focusPos!.y] = n;
      notifyListeners();
    }
  }

  void delete() {
    if (focusPos != null && showBoard[focusPos!.x][focusPos!.y] != null) {
      List<Pos> listPos = [];
      showBoard[focusPos!.x][focusPos!.y] = null;
      for (int i = 0; i < 9; i++) {
        for (int j = 0; j < 9; j++) {
          var n = showBoard[focusPos!.x][focusPos!.y];
          if (n != null) {
            listPos.add(Pos(x: i, y: j, n: n));
          }
        }
      }
      _startPos = listPos;
      notifyListeners();
    }
  }

  init () {
    _solved = null;
    _startPos = [];
    _solvedNum = 0;
    showBoard = Snapshot.makeBoard();
    notifyListeners();
  }

  solve() {
    SudokuSolver solver = SudokuSolver();
    if (solver.init(_startPos)) {
      List<Snapshot> list = solver.solve();
      _solved = list.isNotEmpty;
      if (solved!) {
        // _solvedBoard = list[0];
        _solvedBoard = list[list.length - 1];
        _solvedNum = list.length;
      }
    } else {
      _solved = false;
    }
    notifyListeners();
  }
}