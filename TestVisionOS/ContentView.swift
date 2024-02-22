//
//  ContentView.swift
//  TestVisionOS
//
//  Created by Alexandru Jilavu on 04.02.2024.
//
/*
import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    @State private var showImmersiveSpace = false
    @State private var immersiveSpaceIsShown = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        VStack {
            Model3D(named: "Scene", bundle: realityKitContentBundle)
                .padding(.bottom, 50)

            Text("Hello, world!")

            Toggle("Show Immersive Space", isOn: $showImmersiveSpace)
                .toggleStyle(.button)
                .padding(.top, 50)
        }
        .padding()
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    switch await openImmersiveSpace(id: "ImmersiveSpace") {
                    case .opened:
                        immersiveSpaceIsShown = true
                    case .error, .userCancelled:
                        fallthrough
                    @unknown default:
                        immersiveSpaceIsShown = false
                        showImmersiveSpace = false
                    }
                } else if immersiveSpaceIsShown {
                    await dismissImmersiveSpace()
                    immersiveSpaceIsShown = false
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
*/

import SwiftUI
import Speech

struct ContentView: View {
    @State private var text: String = ""
    @State private var isListening = false

    private let speechRecognizer = SFSpeechRecognizer()
    private let audioEngine = AVAudioEngine()

    var body: some View {
        VStack{
            Text("AI Expo")
                .font(.system(size:45, weight: .light, design: .default))
                .foregroundColor(.white)
                .kerning(3)
            HStack {
                Button(action: {
                    self.startDictation()
                }) {
                    Image(systemName: "mic")
                }
                .disabled(isListening)
                .padding(.horizontal)
                TextField("Enter text here", text: $text)
                    .frame(width:400,height: 10)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius:20.0)
                            .stroke(Color.gray,lineWidth: 1)
                    )
                //.padding(.trailing,100)
                // Microphone button for speech input
                
            }.padding(.vertical,0)
            
            GeometryReader { geometry in
                HStack(spacing: 0) { // spacing set to 0 for no space between rectangles
                    ForEach(0..<4) { _ in // Assuming you want 4 rectangles
                        RoundedRectangle(cornerRadius:10)
                            
                            .stroke(Color.white)
                            .frame(width: (geometry.size.width - (CGFloat(4 - 1) * 50)) / 4, height: geometry.size.height-50)
                            .padding(.horizontal)
                            
                    }.padding(.vertical,20)
                }
            }
            .padding() // Padding around the HStack
        }
        .padding(.vertical,40)
    }
    
    private func startDictation() {
        if isListening {
            audioEngine.stop()
            audioEngine.inputNode.removeTap(onBus: 0)
            isListening = false
            return
        }
        
        let request = SFSpeechAudioBufferRecognitionRequest()
        guard (try? speechRecognizer?.recognitionTask(with: request, resultHandler: { result, _ in
            if let transcription = result?.bestTranscription {
                self.text = transcription.formattedString
            }
        })) != nil else { return }
        
        let recordingFormat = audioEngine.inputNode.outputFormat(forBus: 0)
        audioEngine.inputNode.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
            request.append(buffer)
        }
        
        audioEngine.prepare()
        try? audioEngine.start()
        isListening = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
