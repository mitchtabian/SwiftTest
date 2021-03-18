//
//  ContentView.swift
//  Shared
//
//  Created by Mitch Tabian on 2021-03-15.
//

import SwiftUI

struct Triangle: Shape{
    func path(in rect: CGRect) -> Path{
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    
        return path
    }
}

struct Arc: Shape{
    var startAngle: Angle
    var endAngle: Angle
    var clockWise: Bool
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockWise)
        return path
    }
}

struct ContentView: View {
    var body: some View {
        Arc(startAngle: .degrees(0), endAngle: .degrees(180), clockWise: false)
            .stroke(Color.blue, lineWidth: 10)
            .frame(width: 300, height: 300)
        
//        Triangle()
//            .stroke(Color.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 300, height: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
