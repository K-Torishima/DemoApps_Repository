import SwiftUI
import PlaygroundSupport
// https://qiita.com/shtnkgm/items/387132cd9633a59e7390
// https://thehappyprogrammer.com/custom-buttons-in-swiftui/

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text("world")
                .font(.title)
                .foregroundColor(.secondary)
        }
    }
}

let host = UIHostingController(rootView: ContentView())
PlaygroundPage.current.liveView = host

struct GradientBackgroundStyle: ButtonStyle {
    var startColor: Color
    var endColor: Color
    
    
    
}
