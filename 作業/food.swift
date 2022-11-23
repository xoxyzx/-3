import SwiftUI

struct food: View {
    @State  var name = ""
    @State  var name1 = ""
    @State  var birthday = Date()
    @State  var intelligence: Double = 0
    @State  var bodys: Double = 0
    @State  var luck: Double = 0
    @State  var soul: Double = 0
    @State  var appearance: Double = 0
    @State private var Textcolor = Color.black
    @State  var grade: Double = 0
    @State var sum: Double = 30
    @State private var showAlert = false
    @State private var showAlert1 = false
    @State private var success = false
    @State private var alertTitle = ""
    @State private var alert1Title = ""
    @State private var showNextPage = false
    @State  var attributes : Int = 0
    @State private var ischeatOn = false
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                HStack(){
                    Spacer()
                    Text("姓名:")
                        .foregroundColor(Textcolor)
                    TextField("嗨", text: $name, prompt: Text("姓名"))
                        .foregroundColor(Textcolor)
                        .padding().frame(width: 150, height: 50)
                    Spacer()
                }
               
            }
            DisclosureGroup("星座") {
                Picker(selection: $attributes ) {
                    Text("水瓶").tag(0)
                    Text("雙魚").tag(1)
                    Text("射手").tag(2)
                    Text("天蠍").tag(3)
                    Text("天秤").tag(5)
                    Text("金牛").tag(6)
                    Text("巨蟹").tag(7)
                    Text("獅子").tag(8)
                    Text("處女").tag(9)
                    Text("牡羊").tag(10)
                } label: {
                    Text("星座")
                }
            }.frame(width: 150, height: 100)
            HStack(){
                Spacer()
                Text("你的生日:")
                    .foregroundColor(Textcolor)
                DatePicker("你的生日:", selection: $birthday,displayedComponents: .date).padding().frame(width: 150, height: 50)
                Spacer()
            }
            Group{
                HStack(){
                    Spacer()
                    Text("體重:")
                        .foregroundColor(Textcolor)
                    Slider(value: $intelligence, in: 0...200 ,step:1).frame(width: 150, height: 50)
                    Text("體重：\(intelligence)")
                        .foregroundColor(Textcolor)
                    Spacer()
                }
                HStack(){
                    Spacer()
                    Text("身高:")
                        .foregroundColor(Textcolor)
                    Slider(value: $bodys, in: 0...200,step:1).frame(width: 150, height: 50)
                    Text("身高：\(bodys)")
                        .foregroundColor(Textcolor)
                    Spacer()
                }
                
                HStack(){
                    Stepper("飯好吃嗎", value: $grade, in: 0...10)
                }.frame(width: 200, height: 100)
                Text("分數：\(grade)")
                    .foregroundColor(Textcolor)
            }
            Spacer()
            
            Text("BMI：\(intelligence/bodys/bodys*10000)")
                .foregroundColor(Textcolor)
            Spacer()
            Button {
                if ischeatOn{
                    showNextPage=true
                }
                else{
                    if(intelligence/bodys/bodys*10000<18||intelligence/bodys/bodys*10000>24){
                        showAlert = true
                        alertTitle = "你生病拉去看醫生啊"
                    }else{
                        showNextPage=true
                    }
                }
                
            } label: {
                VStack {
                    Text("檢查出來囉")
                    Spacer()
                    Spacer()
                }
            } .alert(alertTitle, isPresented: $showAlert, actions: {
                
            }
                     
            ).fullScreenCover(isPresented: $showNextPage, content: {hi(name:$name,birthday:$birthday,intelligence:$intelligence,bodys:$bodys,luck:$luck,grade:$grade,showNextPage:$showNextPage,success:$success)})
            VStack{
                ColorPicker("文字顏色", selection: $Textcolor)
            }
        }
            }
    }

struct food_Previews: PreviewProvider {
    static var previews: some View {
        food()
    }
}
