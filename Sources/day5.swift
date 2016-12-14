import Foundation
import CryptoSwift

class Day5: Day {
  override func calc() {
    let input = "cxdnnyjw"

    print("Answer for part1: \(part1(input: input))")
    // print("Answer for part2: \(part2(lines: lines))")
  }

  func part1(input: String) -> String {
    var count = 0
    var index = 0
    while true {
      let output = (input + String(index)).md5()
      if output.hasPrefix("00000") {
        print(output, index)
        count += 1
      }
      if count >= 8 {
        break
      }
      index += 1
    }
    return ""
  }

  func part2(lines: [String]) -> Int {
    return 0
  }
}
