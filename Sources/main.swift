let arguments = CommandLine.arguments

var day: Day
if let dayNum: Int =  Int(arguments[1]) {
  switch(dayNum) {
  case 1:
    day = Day1()
  case 2:
    day = Day2()
  case 3:
    day = Day3()
  case 4:
    day = Day4()
  case 5:
    day = Day5()
  case 6:
    day = Day6()
  default:
    day = Day()
  }
  day.calc()
}
