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

let file = readFile(path: "./input/day1")
let turns:[String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: ", ")

var currentDirection = "N"
var blockMaps = ["N": 0, "W": 0, "S": 0, "E": 0]
turns.map { (turn: String) -> (String, Int) in
  let index = turn.index(turn.startIndex, offsetBy: 1)
  let direction = turn.substring(to: index)
  let numOfBlocks = Int(turn.substring(from: index))!

  switch(currentDirection) {
  case "N":
    currentDirection = direction == "L" ? "W" : "E"
    break
  case "W":
    currentDirection = direction == "L" ? "S" : "N"
    break
  case "S":
    currentDirection = direction == "L" ? "E" : "W"
    break
  case "E":
    currentDirection = direction == "L" ? "N" : "S"
    break
  default:
    break
  }
  return (currentDirection, numOfBlocks)
}.forEach { (result) in
  blockMaps[result.0]! += result.1
}

let result = abs(blockMaps["N"]! - blockMaps["S"]!) + abs(blockMaps["W"]! - blockMaps["E"]!)
print("Result is \(result)")
