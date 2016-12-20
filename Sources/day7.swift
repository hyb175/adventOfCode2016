import Foundation
import Regex

class Day7: Day {
  override func calc() {
    let file = readFile(path: "./input/day7")
    let lines: [String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

    print("Answer for part1: \(part1(lines: lines))")
    print("Answer for part2: \(part2(lines: lines))")
  }

  func part1(lines: [String]) -> Int {
    return lines.filter { line -> Bool in
      return "^(?=.*(\\w)(?!\\1)(\\w)\\2\\1)(?!.*\\[[^]]*(\\w)(?!\\3)(\\w)\\4\\3)".r!.matches(line)
    }.count
  }

  func part2(lines: [String]) -> Int {
    return lines.filter { line -> Bool in
      let parts = line.split(using: "\\[(\\w+)\\]".r)
      var supernets: [String] = [], hypernets: [String] = []
      for (index, element) in parts.enumerated() {
        if index % 2 == 0 {
          hypernets.append(element)
        } else {
          supernets.append(element)
        }
      }

      let abas = supernets.map { (findAbas(line: $0)) }.flatMap { $0 }
      if abas.count == 0 { return false }

      for aba in abas {
        let bab = String([aba[1], aba[0], aba[1]])
        let result = hypernets.filter { $0.range(of: bab) != nil }.count
        if result > 0 { return true }
      }
      return false
    }.count
  }

  private func findAbas(line: String) -> [[Character]] {
    let charArray = Array(line.characters)
    var outputArray: [[Character]] = []
    for i in 0...charArray.count-3 {
      if charArray[i] == charArray[i+2] && charArray[i] != charArray[i+1] {
        outputArray.append([charArray[i], charArray[i+1], charArray[i+2]])
      }
    }
    return outputArray
  }
}
