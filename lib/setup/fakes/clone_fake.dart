import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';

import '../cloning.dart';
import '../git_transfer_progress.dart';

class FakeTransferProgress extends StatefulWidget {
  const FakeTransferProgress({Key? key}) : super(key: key);

  @override
  FakeTransferProgressState createState() => FakeTransferProgressState();
}

class FakeTransferProgressState extends State<FakeTransferProgress> {
  var progress = GitTransferProgress();
  var lines = LineSplitter.split(_cloneProgress).toList();
  var line = 0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(const Duration(milliseconds: 300), (timer) {
      updateProgress();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void updateProgress() async {
    var str = lines[line];
    var progress = await GitTransferProgress.parse(str);
    if (progress != null) {
      setState(() {
        this.progress = progress;
      });
    }
    line++;
    if (line >= lines.length) {
      line = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GitHostCloningPage(
      cloneProgress: progress,
      errorMessage: null,
    );
  }
}

var _cloneProgress = '''6793 203 203 0 0 0 41321
6793 527 527 0 0 0 98700
6793 867 867 0 0 0 147882
6793 1110 1139 0 0 0 188867
6793 1250 1301 0 0 0 213458
6793 1546 1599 0 0 0 262640
6793 1850 1907 0 0 0 336413
6793 1993 2071 0 0 0 369191
6793 1993 2071 0 0 0 434727
6793 1993 2071 0 0 0 549415
6793 1993 2071 0 0 0 549415
6793 1993 2071 0 0 0 680487
6793 1993 2071 0 0 0 680487
6793 1993 2071 0 0 0 811559
6793 1993 2071 0 0 0 811559
6793 1993 2071 0 0 0 942631
6793 1993 2071 0 0 0 942631
6793 1993 2071 0 0 0 1073703
6793 1993 2071 0 0 0 1073703
6793 1993 2071 0 0 0 1073703
6793 1993 2071 0 0 0 1204775
6793 1993 2071 0 0 0 1204775
6793 1993 2071 0 0 0 1335847
6793 1993 2071 0 0 0 1335847
6793 1993 2071 0 0 0 1466919
6793 1993 2071 0 0 0 1466919
6793 1993 2071 0 0 0 1597991
6793 1993 2071 0 0 0 1597991
6793 1993 2071 0 0 0 1729063
6793 1993 2071 0 0 0 1729063
6793 1993 2071 0 0 0 1860135
6793 1993 2071 0 0 0 1991207
6793 1993 2071 0 0 0 2122279
6793 1993 2071 0 0 0 2122279
6793 1993 2071 0 0 0 2253351
6793 1993 2071 0 0 0 2384423
6793 1993 2071 0 0 0 2384423
6793 1994 2072 0 0 0 2515495
6793 1994 2072 0 0 0 2515495
6793 1994 2072 0 0 0 2646567
6793 1994 2072 0 0 0 2777639
6793 1994 2072 0 0 0 2777639
6793 1994 2072 0 0 0 2908711
6793 1994 2072 0 0 0 3039783
6793 1994 2072 0 0 0 3039783
6793 1994 2072 0 0 0 3170855
6793 1994 2072 0 0 0 3301927
6793 1994 2072 0 0 0 3301927
6793 1994 2072 0 0 0 3432999
6793 1994 2072 0 0 0 3564071
6793 1994 2072 0 0 0 3564071
6793 1994 2072 0 0 0 3695143
6793 1994 2072 0 0 0 3695143
6793 1994 2072 0 0 0 3826215
6793 1994 2072 0 0 0 3826215
6793 1994 2072 0 0 0 3957287
6793 1994 2072 0 0 0 3957287
6793 1994 2072 0 0 0 3957287
6793 1994 2072 0 0 0 3957287
6793 1994 2072 0 0 0 3957287
6793 1994 2072 0 0 0 4088359
6793 1994 2072 0 0 0 4088359
6793 1994 2072 0 0 0 4088359
6793 1994 2072 0 0 0 4219431
6793 1994 2072 0 0 0 4219431
6793 1994 2072 0 0 0 4350503
6793 2019 2098 0 0 0 4481575
6793 2108 2187 0 0 0 4547111
6793 2215 2294 0 0 0 4612647
6793 2292 2372 0 0 0 4678183
6793 2292 2372 0 0 0 4678183
6793 2318 2398 0 0 0 4710951
6793 2354 2434 0 0 0 4743719
6793 2459 2539 0 0 0 4842023
6793 2590 2670 0 0 0 4940327
6793 2731 2811 0 0 0 5038631
6793 2934 3026 0 0 0 5104167
6793 3071 3246 0 0 0 5169703
6793 3071 3246 0 0 0 5268007
6793 3267 3558 0 0 0 5399079
6793 3396 5006 0 0 0 5595687
6793 3567 5879 0 0 0 5661223
6793 3587 6120 0 0 0 5759527
6793 3901 6793 0 3080 188 5816893
6793 4235 6793 0 3080 522 5816893
6793 4494 6793 0 3080 781 5816893
6793 4771 6793 0 3080 1058 5816893
6793 5169 6793 0 3080 1456 5816893
6793 5397 6793 0 3080 1684 5816893
6793 6373 6793 0 3080 2660 5816893
''';
