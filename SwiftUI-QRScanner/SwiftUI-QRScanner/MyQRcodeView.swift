//
//  MyQRcodeView.swift
//  SwiftUI-QRScanner
//
//  Created by 이경후 on 2021/08/26.
//

import SwiftUI

struct QRCodeScannerExampleView: View {
    
    @State var isPresentingScanner = false
    @State var scannedCode: String?
    
    var body: some View {
        ZStack{
            
            if self.scannedCode != nil {
                MyLottoView(urlToLoad: self.scannedCode!)
            } else {
                MyLottoView(urlToLoad: "https://www.naver.com")
            }
            
            VStack(spacing: 10) {
                Spacer()
                Button(action:{
                    self.isPresentingScanner = true
                })
                {
                    Text("로또 번호확인")
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding()
                        .background(Color.yellow)
                        .cornerRadius(12)
                        .overlay(RoundedRectangle(
                            cornerRadius: 12
                        )
                        .stroke(lineWidth: 5)
                        )
                }
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
            }
        }
    }
    
    var scannerSheet : some View {
        ZStack{
            CodeScannerView(
                codeTypes: [.qr],
                completion: { result in
                    if case let .success(code) = result {
                        self.scannedCode = code
                        self.isPresentingScanner = false
                    }
                }
            )
            GeometryReader{ geometry in
                HStack{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style:
                                    StrokeStyle(
                                        lineWidth: 10, dash: [15]
                                    )
                        )
                        .frame(width: geometry.size.width/2, height: geometry.size.height/3, alignment: .center)
                        .foregroundColor(.yellow)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
        }
    }
}

struct MyQRcodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeScannerExampleView()
    }
}
