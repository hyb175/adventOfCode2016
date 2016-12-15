import Foundation

class Day6: Day {
  override func calc() {
    let file = readFile(path: "./input/day6")
    let lines: [String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

    print("Answer for part1: \(part1(lines: lines))")
    print("Answer for part2: \(part2(lines: lines))")
  }

  func part1(lines: [String]) -> String {
    var charMap: [Character:Int] = [:]

    var transformedArray: [[Character]] = []

    lines.forEach { row in
      for (index, element) in row.characters.enumerated() {
        if index < transformedArray.count {
          transformedArray[index].append(element)
        } else {
          transformedArray.append([element])
        }
      }
    }

    var output = ""
    for row in transformedArray {
      row.forEach { char in
        if let _ = charMap[char] {
          charMap[char]! += 1
        } else {
          charMap[char] = 1
        }
      }
      output += String(charMap.max { a, b in a.value < b.value }!.key)
      charMap = [:]
    }

    return output
  }

  func part2(lines: [String]) -> String {
    var charMap: [Character:Int] = [:]

    var transformedArray: [[Character]] = []

    lines.forEach { row in
      for (index, element) in row.characters.enumerated() {
        if index < transformedArray.count {
          transformedArray[index].append(element)
        } else {
          transformedArray.append([element])
        }
      }
    }

    var output = ""
    for row in transformedArray {
      row.forEach { char in
        if let _ = charMap[char] {
          charMap[char]! += 1
        } else {
          charMap[char] = 1
        }
      }
      output += String(
        charMap.min { a, b in a.value < b.value }!.key
      )
      charMap = [:]
    }

    return output
  }
}
