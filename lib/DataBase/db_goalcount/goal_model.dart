class GoalModel{
  late int GoalID;
  late String GoalCount;

  //GoalModel({required this.goalID1 , required this.goalCount1});
  int get goalID => GoalID;

  set goalID(int goalID) {
    GoalID = goalID;
  }

  String get goalCount => GoalCount;

  set goalCount(String goalCount) {
    GoalCount = goalCount;
  }
}