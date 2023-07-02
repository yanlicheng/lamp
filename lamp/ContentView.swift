//
//  ContentView.swift
//  lamp
//
//  Created by richard on 30/6/23.
//

import SwiftUI

struct ContentView: View {
    //top padding
//    var top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
//    var top = self.view.windows.first?.safeAreaInsets.top ?? 0
    @Environment(\.safeAreaInsets) private var safeAreaInsets
//    var top = safeAreaInsets.top
    
    var top: CGFloat { safeAreaInsets.top }
    
    //circle width
    var width = UIScreen.main.bounds.width / 2
    @State var angle = Double()
    @State var isOn = true
    @State var from: Date = Date()
    @State var to: Date = Date()
    
    @State var isSmall = UIScreen.main.bounds.height<750
    
    var body: some View {
        VStack{
            ScrollView(isSmall ? .vertical : .init()){
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    Image("lamp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: isSmall ? 150 : nil, height: isSmall ? 150 : nil)
                    HStack{
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.left")
                            //                            .resizable()
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Image(systemName: "gear")
                            //                            .resizable()
                                .font(.title2)
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding()
                    .padding(.top, top)
                }
                
                Text("Intensity")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding()
                Spacer()
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
                    ZStack{
                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: width, height: width)
                        Circle()
                            .fill(Color.white)
                            .frame(width: width-45, height: width-45)
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
                            .rotationEffect(Angle(degrees: angle))
                        
                        Circle()
                            .fill(Color("yellow"))
                            .frame(width: 20)
                            .offset(x: (width-100)/2)
                            .rotationEffect(Angle(degrees: angle))
                            .gesture(DragGesture(minimumDistance: 0).onChanged(onChange(value:)))
                            .rotationEffect(Angle(degrees: -210))
                        
                        //dots
                        Dots()
                    }
                    HStack{
                        Text("18℃")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("28℃")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom, 30)
                }
                .padding()
                
                HStack{
                    Spacer()
                    HStack(spacing: 15) {
                        Text("Power Saver")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Toggle("", isOn: $isOn)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: Color("yellow")))
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 20)
                    //                .blur(radius: 15)
                    //                .background(Color.gray.opacity(0.1).blur(radius: 1).cornerRadius(15))
                    .background(BlurView().cornerRadius(15))
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Schedule")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    Text("from")
                    HStack(spacing: 15) {
                        DatePicker("", selection: $from, displayedComponents: DatePickerComponents.hourAndMinute)
                            .labelsHidden()
                            .accentColor(.black)
                        Text("to")
                            .font(.caption)
                            .foregroundColor(.gray)
                        DatePicker("", selection: $to, displayedComponents: DatePickerComponents.hourAndMinute)
                            .labelsHidden()
                            .accentColor(.black)
                    }
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            ZStack{
                HStack{
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "house")
                            .font(.system(size: 24))
                            .foregroundColor(Color("yellow"))
                            .padding()
                            .background(Circle().fill( Color.white))
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    }

                    Spacer()
                    Button {
                        
                    } label: {
                        
                        Image(systemName: "person")
                            .font(.system(size: 24))
                            .foregroundColor(Color("yellow"))
                            .padding()
                            .background(Circle().fill( Color.white))
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    }

                }
                Button {
                    
                } label: {
                    
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(Color("yellow"))
                        .padding()
                        .background(Circle().fill( Color.white))
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                }
                .offset(y: 10)

            }
            .padding(.horizontal)
            .padding(.top, isSmall ? 0 : 25)
            .padding(.bottom, top==0 ? 15 : 15)
            .background(
                ZStack {
                    Color("yellow")
                    Color(.white)
                        .clipShape(CustomShape(bottom: safeAreaInsets.bottom))
                        .rotationEffect(Angle(degrees: 180))
                }
                    .ignoresSafeArea(.all, edges: .all)
            )
            
            
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func onChange(value: DragGesture.Value)->Void{
        let transition = value.location
        let vector = CGVector(dx: transition.x, dy: transition.y)
        
        let radians = atan2(vector.dy-10, vector.dx-10)
        var angle = radians*180 / .pi
        if angle<0{
            angle = 360+angle
        }
        if angle<=240{
            self.angle = angle
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
