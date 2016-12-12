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

let file = readFile(path: "./input/day4")
let lines: [String] = file.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)

func part1(lines: [String]) -> Int {
  return lines.map { line -> Int in
    let parts = line.components(separatedBy: "-")
    var charMap: [Character:Int] = [:]
    for part in parts[0..<parts.count-1] {
      for char in part.characters {
        if let _ = charMap[char] {
          charMap[char]! += 1
        } else {
          charMap[char] = 1
        }
      }
    }
    var regex: NSRegularExpression
    do {
      regex = try NSRegularExpression(pattern: "^(\\d{3})\\[(\\w{5})\\]$")
    } catch {
      return -1
    }
    let matches = regex.matches(in: parts.last!, options: [], range:NSRange(location: 0, length: parts.last!.characters.count))
    var checksum = "", sectorID = ""
    if let match = matches.first {
      sectorID = (parts.last! as NSString).substring(with: match.rangeAt(1))
      checksum = (parts.last! as NSString).substring(with: match.rangeAt(2))
    }

    let topFive = charMap.sorted { $0.1 > $1.1 || ($0.1 == $1.1 && $0.0 < $1.0) }.map { $0.0 }[0...4].reduce("", { $0 + String($1) })

    if topFive == checksum {
      return Int(sectorID)!
    } else {
      return 0
    }
  }.reduce(0, +)
}

func part2(lines: [String]) -> Int {
  var result = 0
  lines.forEach { line in
    let parts = line.components(separatedBy: "-")
    var charMap: [Character:Int] = [:]
    for part in parts[0..<parts.count-1] {
      for char in part.characters {
        if let _ = charMap[char] {
          charMap[char]! += 1
        } else {
          charMap[char] = 1
        }
      }
    }
    var regex: NSRegularExpression
    do {
      regex = try NSRegularExpression(pattern: "^(\\d{3})\\[(\\w{5})\\]$")
    } catch {
      return
    }
    let matches = regex.matches(in: parts.last!, options: [], range:NSRange(location: 0, length: parts.last!.characters.count))
    var checksum = "", sectorID = ""
    if let match = matches.first {
      sectorID = (parts.last! as NSString).substring(with: match.rangeAt(1))
      checksum = (parts.last! as NSString).substring(with: match.rangeAt(2))
    }

    let topFive = charMap.sorted { $0.1 > $1.1 || ($0.1 == $1.1 && $0.0 < $1.0) }.map { $0.0 }[0...4].reduce("", { $0 + String($1) })

    if topFive == checksum {
      let decrypted = parts[0..<parts.count-1].map { part -> String in
        let addition: Int = Int(sectorID)! % 26
        return part.unicodeScalars.map { unicode -> Int in
          let val: Int = Int(unicode.value)
          if val + addition > 122 {
            return 97 + (addition - (123 - val))
          } else {
            return val + addition
          }
        }.map { Character(UnicodeScalar($0)!) }.reduce("", { $0 + String($1) })
      }.joined(separator: " ")
      if decrypted == "northpole object storage" {
        result = Int(sectorID)!
      }
    }
  }

  return result
}

print("Answer for part1: \(part1(lines: lines))")
print("Answer for part2: \(part2(lines: lines))")
