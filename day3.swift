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

let file = readFile(path: "./input/day3")
let lines:[String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

func part1(lines: [String]) -> Int {
  return lines.filter { line in
    let parts = line.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).flatMap { Int($0) }
    return parts[0] + parts[1] > parts[2] &&
           parts[1] + parts[2] > parts[0] &&
           parts[2] + parts[0] > parts[1]
  }.count
}

func part2(lines: [String]) -> Int {
  let result = lines.map { line in
    return line.trimmingCharacters(in: .whitespaces).components(separatedBy: .whitespaces).flatMap { Int($0) }
  }
  var newArray: [[Int]] = [[], [], []]
  result.forEach { row in
    newArray[0].append(row[0])
    newArray[1].append(row[1])
    newArray[2].append(row[2])
  }
  let flattened: [Int] = newArray.reduce([], +)
  var count = 0
  for i in 0..<flattened.count / 3 {
    let first = 3 * i
    let second = 3 * i + 1
    let third = 3 * i + 2
    if flattened[first] + flattened[second] > flattened[third] &&
       flattened[second] + flattened[third] > flattened[first] &&
       flattened[third] + flattened[first] > flattened[second] {
         count += 1
    }
  }
  return count
}

print("Answer for part1: \(part1(lines: lines))")
print("Answer for part2: \(part2(lines: lines))")
