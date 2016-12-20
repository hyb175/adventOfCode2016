import Foundation

class Day8: Day {
  override func calc() {
    let file = readFile(path: "./input/day8")
    let lines: [String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

    print("Answer for part1: \(part1(lines: lines))")
  }

  func part1(lines: [String]) -> Int {
    var screen = [[Int]](repeating: [Int](repeating: 0, count: 50), count: 6)
    for line in lines {
      let parts = line.components(separatedBy: .whitespaces)
      switch(parts[0]) {
      case "rect":
        let coors = parts[1].components(separatedBy: "x")
        let x = Int(coors[0])!
        let y = Int(coors[1])!
        for j in 0..<y {
          for i in 0..<x {
            screen[j][i] = 1
          }
        }
        break
      case "rotate":
        let index = Int(parts[2].components(separatedBy: "=")[1])!
        let amount = Int(parts[4])!
        if parts[1] == "column" {
          let colToRotate = screen.map { $0[index] }
          for i in 0..<screen.count {
            let position = i - amount >= 0 ? i - amount : i + 6 - amount
            screen[i][index] = colToRotate[position]
          }
        } else {
          let rowToRotate = Array(screen[index])
          screen[index] = Array(rowToRotate[50-amount..<50]) + Array(rowToRotate[0..<50-amount])
        }
        break
      default: break
      }
    }
    return screen.flatMap { $0 }.filter { $0 == 1 }.count
  }
}
