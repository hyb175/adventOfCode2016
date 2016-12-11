import Foundation

func readFile(path: String) -> String {
  do {
    let content = try String(contentsOfFile: path)
    return content
  } catch {
    print("Unable to read file: \(path)")
    return ""
  }
}

let file = readFile(path: "./input/day2")

let keypad = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
var indices = (1, 1)
func part1(lines: [String]) -> String {
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

let lines:[String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)
print(part1(lines: lines))
