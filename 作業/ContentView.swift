import SwiftUI

struct ContentView: View {
    @State private var num : Int = 0
    @State private var showalert = false
    @State private var sportToday = true
    @State private var showalertSleep = false
    @State private var showSport = false
    @State private var sportChange = false
    @State private var old : Int = 0
    @State private var stop = false
    var sports :[String] = ["飯","麵","水餃","披薩","漢堡"]
    var alertText :[String] = ["飯","麵","水餃","披薩","漢堡"]
    
    var body: some View {
        NavigationView {
            VStack {
                if sportToday {
                    if showSport {
                        if sportChange {
                            Image(sports[num])
                                .resizable()
                                .padding(.bottom)
                                .frame(width: 250.0, height: 300.0)
                        } else{
                            Image(sports[old])
                                .resizable()
                                .padding(.bottom)
                                .frame(width: 250.0, height: 300.0)
                        }
                    } else{
                        Image("sleep")
                            .resizable()
                            .padding(.bottom)
                            .frame(width: 250.0, height: 300.0)
                    }
                    Spacer()
                        .frame(height: 50.0)
                    NavigationLink {
                        food()
                    } label: {
                        Text("看看你的bmi")
                    }
                    Button {
                        showalert = true
                        sportChange = false
                        if stop {
                            old = old
                        } else{
                            old = num
                        }
                        num = Int.random(in:0 ... 4)
                    }
                label: {
                        Text("今天要吃啥...")
                    }
                    .alert("今天吃"+alertText[num], isPresented: $showalert) {
                        Button("開吃"){
                            showSport = true
                            sportChange = true
                            stop = false
                        }
                        Button("不吃", role: .destructive){
                            sportToday = false
                        }
                       
                    }
                } else {
                    VStack {
                        Text("好窮喔不想吃沒錢嗚嗚嗚嗚嗚嗚嗚嗚嗚")
                            .multilineTextAlignment(.center)
                        Image("hungry")
                            .resizable()
                            .scaledToFit()
                    }
                    Spacer()
                        .frame(height: 50.0)
                    Button {
                        showalertSleep = true
                    } label: {
                        Text("看一下帳戶")
                    }
                    .padding(.bottom)
                    .alert("餘額：？", isPresented: $showalertSleep) {
                        Button("老媽匯錢了"){
                            sportToday = true
                            showSport = false
                        }
                        Button("沒錢啊"){
                        }
                    }
                }
            }

            .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
