<p align="center">
    <h1 align="center">Commandy</h1>
</p1>

<p align="center"><i>Commandy is Cli framework.</i></p>

<p align="center">
    <img src="https://img.shields.io/badge/Swift-5-ffac45.svg">
    <a href=".license-mit"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a> 
</p>

## Usage

### Implement Command

**non option**
```swift
enum Stash: Command {
    static func run() throws {
        print("git stash")
    }
}
```

**option**
```swift
enum Commit: String, Command {

    case message
    case allowEmpty
    
    var shortOption: String? {
        switch self {
        case .message: return "m"
        default:       return nil
        }
    }

    static func run() throws {
        let matchOptions = Commit.matchOptions
        switch matchOptions {
        case _ where matchOptions[.message]:
            print("git commit -m")
        case _ where matchOptions[.allowEmpty, .message]:
            print("git commit --allow-empty -m")
        default: break
        }
    }
}
```

Analysis method of command options is as follows:

|definition|prefix|separator|example word|analyzed|
|---|---|---|---|---|
|single-word|`--`||message|--message|
|multiple-word|`--`|`-`|allowEmpty|--allow-empty|

### Implement Cli
```swift
enum Git: String, Commandy.Cli {

    case commit
    case stash

    func run() throws {
        switch self {
        case .commit: try Commit.run()
        case .stash:  try Stash.run()
        }
    }
}
```

### Running
```swift
try YourCli().run()
```

### Arguments
```swift
❯ git commit
let command = Arguments.cached.command // Optional("commit")

❯ git commit -m hello_world
let nonOptionArguments = Arguments.cached.nonOptionArguments.first // Optional("hello_world")

❯ git commit --allow-empty -m hello_world
let options = Arguments.cached.options // ["--allow-empty", "-m"]
```

## Installation via Swift Package Manager
```swift
.package(url: "https://github.com/atsushi130/Commandy", from: "1.0.0"),
```

## License
Commandy is available under the MIT license. See the [LICENSE file](https://github.com/atsushi130/Commandy/blob/master/license-mit).
