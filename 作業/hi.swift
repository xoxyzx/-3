import SwiftUI

struct hi: View {
    @Binding  var name :String
    @Binding  var birthday : Date
    @Binding  var intelligence: Double
    @Binding  var bodys: Double
    @Binding  var luck: Double
    @Binding  var grade: Double
    @Binding  var showNextPage : Bool
    @Binding  var success : Bool
    var body: some View {
        
        Text("\(name)恭喜你非常的健康！")
        Button("重新來過"){
            showNextPage=false
        }
    }
}
struct StoryView_Previews: PreviewProvider {
    
    @State  static var name = ""
    @State  static var birthday = Date()
    @State  static var intelligence: Double = 10
    @State  static var bodys: Double = 9
    @State  static var luck: Double = 10
    @State  static var grade: Double = 7
    @State  static var showNextPage = false
    @State static var DialColor: Color = .black
    @State  static var success = false
    static var previews: some View {
        hi(name:$name,birthday:$birthday,intelligence:$intelligence,bodys:$bodys,luck:$luck,grade:$grade,showNextPage:$showNextPage,success:$success)
    }
}
