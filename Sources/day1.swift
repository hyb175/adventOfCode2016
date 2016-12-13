import Foundation

class Day1: Day {
  override func calc() {
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

    var visited = [(0, 0)]

    blockMaps = ["N": 0, "W": 0, "S": 0, "E": 0]
    var currentPosition = (0, 0)
    let mapptedTurns = turns.map { (turn: String) -> (String, Int) in
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
    }

    var foundIndex = -1
    for turn in mapptedTurns {
      if foundIndex != -1 { break }
      switch(turn.0) {
      case "N", "S":
        for index in 1...turn.1 {
          let coordinates = (currentPosition.0, currentPosition.1 + (turn.0 == "N" ? index : -index))
          if let _ = visited.index(where: { $0 == coordinates }) {
            print("Found the overlap")
            print(coordinates)
            foundIndex = index
          } else {
            visited.append(coordinates)
          }
        }
        currentPosition.1 = currentPosition.1 + (turn.0 == "N" ? turn.1 : -turn.1)
        break
      case "W", "E":
        for index in 1...turn.1 {
          let coordinates = (currentPosition.0 + (turn.0 == "E" ? index : -index), currentPosition.1)
          if let _ = visited.index(where: { $0 == coordinates }) {
            print("Found the overlap")
            print(coordinates)
            foundIndex = index
          } else {
            visited.append(coordinates)
          }
        }
        currentPosition.0 = currentPosition.0 + (turn.0 == "E" ? turn.1 : -turn.1)
        break
      default: break
      }
      let amount = foundIndex == -1 ? turn.1 : foundIndex
      blockMaps[turn.0]! += amount
    }

    let result2 = abs(blockMaps["N"]! - blockMaps["S"]!) + abs(blockMaps["W"]! - blockMaps["E"]!)
    print("Result part2 is \(result2)")
  }
}
