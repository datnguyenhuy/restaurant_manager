class PlayerStatistic {
  String name;
  String? avatar;
  int? height;
  int? BMI;
  int? weight;
  int? age;
  String? strongLeg;
  String? location;
  int? indexLB;
  int? indexRB;
  int? indexCB;
  int? percentLB;
  int? percentRB;
  int? percentCB;
  int? matchComplete;
  int? win;
  int? low;
  int? draw;

  PlayerStatistic(
      {required this.name,
      this.avatar,
      this.BMI,
      this.age,
      this.draw,
      this.height,
      this.indexCB,
      this.indexLB,
      this.indexRB,
      this.location,
      this.low,
      this.matchComplete,
      this.percentCB,
      this.percentLB,
      this.percentRB,
      this.strongLeg,
      this.weight,
      this.win});
}
