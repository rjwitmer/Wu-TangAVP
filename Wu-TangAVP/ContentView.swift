//
//  ContentView.swift
//  Wu-TangAVP
//
//  Created by Bob Witmer on 2025-08-13.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @FocusState private var textFieldIsFocused: Bool
    @State private var enteredName: String = ""
    @State private var staticCoderNames: String = ""
    @State private var wuTangName: String = ""
    @State private var imageName: String = ""
    @State private var firstColumn: [String] = [
        "Algorithmic",
        "Byte",
        "Cache",
        "Debug",
        "Echo",
        "Function",
        "Git",
        "Hex",
        "Infinite",
        "Java",
        "Kernel",
        "Logic",
        "Module",
        "Node",
        "Object",
        "Pixel",
        "Query",
        "Runtime",
        "Script",
        "Token",
        "Undefined",
        "Virtual",
        "Web",
        "Xcode",
        "Yota",
        "Zero"]
    @State private var secondColumn: [String] = [
        "$tack",
        "Processor",
        "Cipher",
        "Daemon",
        "EndPoint",
        "Framework",
        "Gateway",
        "Hub",
        "Interrupt",
        "Crash",
        "Loop",
        "Module",
        "Nexus",
        "Optimizer",
        "Protocol",
        "Queue",
        "Router",
        "Stack",
        "Thread",
        "Update",
        "Variable",
        "Widget",
        "Terminal",
        "Yield",
        "Zen",
        "Ace",
        "Breakpoint",
        "Root",
        "Instance",
        "Access",
        "Archive",
        "Control",
        "Justice"]
    
    var body: some View {
        VStack {

            VStack {
                Text("Wu-Tang")
                Text("Coder Name Generator")
            }
            .font(.title)
            .fontWeight(.black)
            .foregroundStyle(.yellow)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .padding(.bottom)
            .background(Color.black)
            
            Spacer()
            
            TextField("Enter Name Here", text: $enteredName)
                .font(.title2)
                .fontWeight(.medium)
                .textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
//                .border(Color.gray, width: 1)
                .padding()
                .focused($textFieldIsFocused)
                .onChange(of: textFieldIsFocused) { // Keyboard is enabled or disabled
                    if textFieldIsFocused == true { // Keyboard is enabled
                        imageName = ""
                        enteredName = ""
                        staticCoderNames = ""
                        wuTangName = ""
                    }
                }
            
            Button {
                wuTangName = "Your Wu-Tang Coder Name is:\n\(getWuTangName(name: enteredName))"
                imageName = "wu-tang"
                textFieldIsFocused = false
            } label: {
                HStack {
                    Image("wu-tang-button")
                    Text("Get It!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.yellow)
                }
            }
            .tint(.black)
            .disabled(enteredName.isEmpty)

            VStack {
                Text(staticCoderNames)
                    .fontWeight(.regular)
                    .multilineTextAlignment(.leading)
                Text(wuTangName)
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
            }
            .font(.largeTitle)
            .frame(minHeight: 130)
                
            Spacer()
            
            Image(imageName)
            .resizable()
            .scaledToFit()
            
        }
//        .padding()
    }
    
    func getWuTangName(name: String) -> String {
        let firstChar = name.prefix(1)
        
        var firstColumnIndex: Int = 0
        // Loop through all of the elements of firstColumn and compare the first letters
        for index in 0..<firstColumn.count {
            if firstColumn[index].prefix(1).uppercased() == firstChar.uppercased() {
                firstColumnIndex = index == 0 ? 25 : index - 1
            }
        }
        return "\(firstColumn[firstColumnIndex]) \(secondColumn.randomElement() ?? "")"
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
