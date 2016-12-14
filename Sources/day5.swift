import Foundation
import CryptoSwift

class Day5: Day {
  override func calc() {
    let input = "cxdnnyjw"

    print("Answer for part1: \(part1(input: input))")
    print("Answer for part2: \(part2(input: input))")
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

  func part2(input: String) -> String {
    var count = 0
    var index = 0
    var password: [Int:String] = [:]
    while true {
      let output = (input + String(index)).md5()
      let position = output.index(output.startIndex, offsetBy: 5)
      let num = output.index(output.startIndex, offsetBy: 6)
      if output.hasPrefix("00000") {
        if let positionNum = Int(String(output[position])) {
          if 0...7 ~= positionNum {
            guard let _ = password[positionNum] else {
              password[positionNum] = String(output[num])
              print(output, index, String(output[num]))
              count += 1
              continue
            }
          }
        }
      }
      if count >= 8 {
        break
      }
      index += 1
    }
    return ""
  }
}
