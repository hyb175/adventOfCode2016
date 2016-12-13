import Foundation

class Day2: Day {
  override func calc() {
    let file = readFile(path: "./input/day2")

    let keypad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
    func part1(lines: [String]) -> String {
      var indices = (1, 1)
      var output = ""
      for line in lines {
        line.characters.forEach { char in
          switch(char) {
          case "U", "D":
            let addition = char == "U" ? -1 : 1
            if case 0...2 = indices.0 + addition {
              indices.0 += addition
            }
            break
          case "L", "R":
            let addition = char == "L" ? -1 : 1
            if case 0...2 = indices.1 + addition {
              indices.1 += addition
            }
            break
          default: break
          }
        }
        output.append(String(keypad[indices.0][indices.1]))
      }
      return output
    }

    let keypad2 = [
      ["", "", "1", "", ""],
      ["", "2", "3", "4", ""],
      ["5", "6", "7", "8", "9"],
      ["", "A", "B", "C", ""],
      ["", "", "D", "", ""],
    ]
    func part2(lines: [String]) -> String {
      var indices = (2, 0)
      var output = ""
      for line in lines {
        line.characters.forEach { char in
          switch(char) {
          case "U", "D":
            let addition = char == "U" ? -1 : 1
            if case 0...4 = indices.0 + addition {
              if keypad2[indices.0 + addition][indices.1] != "" {
                indices.0 += addition
              }
            }
            break
          case "L", "R":
            let addition = char == "L" ? -1 : 1
            if case 0...4 = indices.1 + addition {
              if keypad2[indices.0][indices.1 + addition] != "" {
                indices.1 += addition
              }
            }
            break
          default: break
          }
        }
        output.append(keypad2[indices.0][indices.1])
      }
      return output
    }

    let lines:[String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)
    print("Answer for part1: \(part1(lines: lines))")
    print("Answer for part2: \(part2(lines: lines))")
  }
}
