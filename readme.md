<p align="center">
    <h1 align="center">Commandy</h1>
</p1>

<p align="center"><i>Commandy is Cli framework.</i></p>

<p align="center">
    <a href=".license-mit"><img src="https://img.shields.io/badge/license-MIT-blue.svg"></a> 
</p>

## Usage

### Implement Command
```swift
struct Commit: Commandy.Command {
    static func run() throws {
        guard let argument = Commandy.Arguments.shared[1] else { throw ArgumentNotFoundError() }
        print("git commit \(argument)")
    }
}
```

### Implement Cli
```swift
import Commandy
enum Git: String, Commandy.Cli {

    case commit
    case push
    case add

    func run() throws {
        switch self {
        case .commit: try Commit.run()
        case .push:   try Push.run()
        case .add:    try Add.run()
        }
    }
}
```

### Running
```swift
try Git()?.run()
```


## Installation via Swift Package Manager
```swift
.package(url: "https://github.com/atsushi130/Commandy", from: "1.0.0"),
```

## License
Commandy is available under the MIT license. See the [LICENSE file](https://github.com/atsushi130/Commandy/blob/master/license-mit).
