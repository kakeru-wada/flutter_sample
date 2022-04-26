import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/sudoku_notifier.dart';

class SudokuPage extends StatelessWidget {
  const SudokuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SudokuState> (
      create: (_) => SudokuState(),
      child: const SudokuPageWithState(),
    );
  }
}

class SudokuPageWithState extends StatelessWidget {
  const SudokuPageWithState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideLength = MediaQuery.of(context).size.width / 9;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sudoku"),
      ),
      body: Scaffold(
        body: Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: _SudokuFrame(),
              ),
              Center(
                child: _SudokuBoxes(),
              ),
              Center(
                child: Container(
                  alignment: Alignment.centerRight,
                  height: MediaQuery.of(context).size.width + 40,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.width + 20, 10, 0),
                  child: Consumer<SudokuState>(
                    builder: (context, sudokuState, child) {
                      if (sudokuState.solved == null || sudokuState.solvedNum == 1) {
                        return const Text("");
                      }
                      if (sudokuState.solved!) {
                        var solutionsNumStr = (sudokuState.solvedNum > 1000)
                            ? "More than 1000"
                            : sudokuState.solvedNum.toString();
                        return Text(solutionsNumStr + " solutions found.");
                      } else {
                        return const Text("There is no solution.");
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int n = 1; n < 10; n++) ... {
                Container(
                  width: sideLength,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: FloatingActionButton(
                    heroTag: "btn" + n.toString(),
                    child: Text(n.toString(), style: const TextStyle(color: Colors.white, fontSize: 20)),
                    backgroundColor: Colors.deepOrangeAccent.shade100,
                    onPressed: () {
                      Provider.of<SudokuState>(context, listen: false).setFocus(n);
                    },
                  ),
                ),
              }
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      ),
      floatingActionButton: Row(
        //verticalDirection: VerticalDirection.up, // childrenの先頭を下に配置
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            heroTag: "delete",
            child: const Icon(Icons.delete, size: 30, color: Colors.white),
            backgroundColor: Colors.orangeAccent.shade200,
            onPressed: () {
              Provider.of<SudokuState>(context, listen: false).delete();
            },
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: FloatingActionButton(
              heroTag: "new",
              child: const Icon(Icons.add, size: 30, color: Colors.white),
              backgroundColor: Colors.orangeAccent.shade200,
              onPressed: () {
                Provider.of<SudokuState>(context, listen: false).init();
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 16.0),
            child: FloatingActionButton(
              heroTag: "solve",
              child: const Icon(Icons.onetwothree, size: 50, color: Colors.white),
              backgroundColor: Colors.deepOrange.shade300,
              onPressed: () {
                Provider.of<SudokuState>(context, listen: false).solve();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _SudokuFrame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sideLength = MediaQuery.of(context).size.width / 9;
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      border: TableBorder.all(color: Colors.deepOrange.shade300, width: 2),
      children: <TableRow>[
        for (int i = 0; i < 3; i++)
          TableRow(
            children: <TableCell>[
              for (int j = 0; j < 3; j++)
                TableCell(
                  child: Table(
                    defaultColumnWidth: const IntrinsicColumnWidth(),
                    border: TableBorder(
                      horizontalInside: BorderSide(color: Colors.orangeAccent.shade100),
                      verticalInside: BorderSide(color: Colors.orangeAccent.shade100),
                    ),
                    children: <TableRow>[
                      for (int k = 0; k < 3; k++)
                        TableRow(
                          children: <TableCell>[
                            for (int l = 0; l < 3; l++)
                              TableCell(
                                child: SizedBox(width: sideLength, height: sideLength),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
            ],
          ),
      ],
    );
  }
}

class _SudokuBoxes extends StatefulWidget {
  @override
  _SudokuBoxesState createState() => _SudokuBoxesState();
}

class _SudokuBoxesState extends State<_SudokuBoxes> {
  @override
  Widget build(BuildContext context) {
    final sideLength = MediaQuery
        .of(context)
        .size
        .width / 9;
    return Table(
      defaultColumnWidth: const IntrinsicColumnWidth(),
      children: <TableRow>[
        for (int m = 0; m < 9; m++)
          TableRow(
            children: <Widget>[
              for (int n = 0; n < 9; n++)
                TableCell(
                  child: SizedBox(
                    height: sideLength,
                    width: sideLength,
                    child: Center(
                      child: Consumer<SudokuState>(
                        builder: (context, sudokuState, child) {
                          if (sudokuState.solved != null && sudokuState.solved!) {
                            return Text(sudokuState.solvedBoard.board[n][m].num
                                .toString());
                          } else {
                            var num = sudokuState.showBoard[n][m] ?? 0;
                            return Stack(
                              children: [
                                Center(
                                  child: IconButton(
                                    icon: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (sudokuState.focusPos != null &&
                                            sudokuState.focusPos!.x == n &&
                                            sudokuState.focusPos!.y == m) ?
                                        Colors.yellow.shade200 : Colors
                                            .transparent,
                                      ),
                                    ),
                                    onPressed: () {
                                      sudokuState.setPos(n, m);
                                    },
                                  ),
                                ),
                                Center(child: Text(
                                    (num > 0) ? num.toString() : "",
                                    style: const TextStyle(fontSize: 18))),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}