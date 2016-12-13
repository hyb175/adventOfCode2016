func readFile(path: String) -> String {
  do {
    let content = try String(contentsOfFile: path)
    return content
  } catch {
    print("Unable to read file: \(path)")
    return ""
  }
}
