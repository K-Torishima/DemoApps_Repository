import SwiftUI
import PlaygroundSupport
// https://qiita.com/shtnkgm/items/387132cd9633a59e7390
// https://thehappyprogrammer.com/custom-buttons-in-swiftui/

struct ContentView: View {
    
    @State private var fav = false

    var body: some View {
        ZStack {
            Button(action: {
                self.fav.toggle()
            }) {
                HStack {
                    Image(systemName: fav ? "star.fill" : "star")
                        .foregroundColor(fav ? Color.yellow : Color.gray)
                    Text("いいね")
                        .foregroundColor(Color.black)
                }
            }
            .buttonStyle(GradientBackgroundStyle(startColor: Color.pink, endColor: Color.purple))
            .padding()
        }.ignoresSafeArea()
    }
}

let host = UIHostingController(rootView: ContentView())
PlaygroundPage.current.liveView = host

struct GradientBackgroundStyle: ButtonStyle {
    var startColor: Color
    var endColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .padding()
            .foregroundColor(.white)
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]),
                                       startPoint: .leading, endPoint: .trailing)
                            .opacity(configuration.isPressed ? 0.5 : 1))
            .cornerRadius(40)
            .padding(.horizontal, 20)
            .shadow(radius: 10)
    }
}

