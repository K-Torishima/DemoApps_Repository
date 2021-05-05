import SwiftUI
import PlaygroundSupport
// https://qiita.com/shtnkgm/items/387132cd9633a59e7390
// https://thehappyprogrammer.com/custom-buttons-in-swiftui/

struct ContentView: View {
    
    @State private var fav1 = false
    @State private var fav2 = false
    
    var body: some View {
        VStack {
            ZStack {
                Button(action: {
                    self.fav1.toggle()
                }) {
                    HStack {
                        Image(systemName: fav1 ? "star.fill" : "star")
                            .foregroundColor(fav1 ? Color.yellow : Color.gray)
                        Text("いいね1")
                            .foregroundColor(Color.white)
                    }
                }
                .buttonStyle(GradientBackgroundStyle(startColor: Color.orange, endColor: Color.purple))
                .padding()
            }.ignoresSafeArea()
            
            ZStack {
                Button(action: {
                    self.fav2.toggle()
                }) {
                    HStack {
                        Image(systemName: fav2 ? "star.fill" : "star")
                            .foregroundColor(fav2 ? Color.yellow : Color.gray)
                        Text("いいね2")
                            .foregroundColor(Color.white)
                    }
                }
                .buttonStyle(GradientBackgroundStyle(startColor: Color.orange, endColor: Color.purple))
                .padding()
            }.ignoresSafeArea()
        }
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

