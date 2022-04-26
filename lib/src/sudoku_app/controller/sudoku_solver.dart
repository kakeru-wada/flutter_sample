const List<int> oneToNine = [1,2,3,4,5,6,7,8,9];

class GridInfo {
  int num;
  List<int> nums;

  GridInfo({this.num = 0, this.nums = oneToNine});

  GridInfo copy() {
    return GridInfo(num: num, nums: nums);
  }

  bool setNum(int n) {
    if (1 <= n && n <= 9) {
      num = n;
      nums = [n];
      return true;
    }
    return false;
  }

  bool removeNum(int n) {
    if (1 <= n && n <= 9) {
      List<int> list = [];
      for (var num in nums) {
        if (n != num) {
          list.add(num);
        }
      }
      if (list.isNotEmpty) {
        nums = list;
        return true;
      }
    }
    return false;
  }
}

class Snapshot {
  late List board;

  static List makeBoard() {
    return [
      []..length = 9,
      []..length = 9,
      []..length = 9,
      []..length = 9,
      []..length = 9,
      []..length = 9,
      []..length = 9,
      []..length = 9,
      []..length = 9,
    ];
  }

  Snapshot() {
    board = makeBoard();
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        board[i][j] = GridInfo();
      }
    }
  }

  Snapshot copy() {
    Snapshot snapshot = Snapshot();
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        snapshot.board[i][j] = board[i][j].copy();
      }
    }
    return snapshot;
  }

  bool setNumByPos(Pos pos) {
    return setNum(pos.x, pos.y, pos.n);
  }
  bool setNum(int x, int y, int n) {
    if (x < 0 || 8 < x || y < 0 || 8 < y) {
      return false;
    }
    GridInfo gi = board[x][y];
    if (!gi.setNum(n)) {
      return false;
    }
    for (int i = 0; i < 9; i++) {
      if (i != x) {
        if (!board[i][y].removeNum(n)) {
          return false;
        }
      }
    }
    for (int j = 0; j < 9; j++) {
      if (j != y) {
        if (!board[x][j].removeNum(n)) {
          return false;
        }
      }
    }
    for (int k = 0; k < 3; k++) {
      for (int l = 0; l< 3; l++) {
        int smallX = (x ~/ 3) * 3 + k;
        int smallY = (y ~/ 3) * 3 + l;
        if (smallX != x && smallY != y) {
          if (!board[smallX][smallY].removeNum(n)) {
            return false;
          }
        }
      }
    }
    return true;
  }
}

class Pos {
  final int x, y, n;
  Pos({required this.x, required this.y, required this.n});
}

class SudokuSolver {
  late Snapshot _startBoard;
  late List<Snapshot> _solvedBoard;

  SudokuSolver() {
    _startBoard = Snapshot();
    _solvedBoard = [];
  }

  bool init(List<Pos> list) {
    bool bRet = true;
    for (var pos in list) {
      bRet = _startBoard.setNumByPos(pos);
      _solvedBoard = [];
    }
    return bRet;
  }

  bool? _canFillTheBlank(Snapshot snapshot) {
    for (int i = 0; i < 9; i++) {
      for (int j = 0; j < 9; j++) {
        GridInfo gi = snapshot.board[i][j];
        if (gi.nums.length == 1 && gi.num == 0) {
          return snapshot.setNum(i, j, gi.nums[0]);
        }
      }
    }
    return null;
  }

  bool _solveSnap(Snapshot snapshot, int n) {
    if (_solvedBoard.length > 1000) {
      return false;
    }
    if (0 <= n && n < 80) {
      bool? bCan = _canFillTheBlank(snapshot);
      while (bCan != null) {
        if (!bCan) {
          return false;
        }
        bCan = _canFillTheBlank(snapshot);
      }
    } else if (n == 80) {
      if (snapshot.board[8][8].nums.length == 1) {
        snapshot.board[8][8].num = snapshot.board[8][8].nums[0];
        _solvedBoard.add(snapshot);
        return true;
      }
      return false;
    }
    int x = n % 9;
    int y = n ~/ 9;
    List<int> listNums = snapshot.board[x][y].nums;
    for (var num in listNums) {
      Snapshot tmp = snapshot.copy();
      if (tmp.setNum(x, y, num)) {
        if (_solveSnap(tmp, n + 1)) {
          //return true;
        }
      }
    }
    return false;
  }

  List<Snapshot> solve() {
    _solveSnap(_startBoard, 0);
    return _solvedBoard;
  }
}