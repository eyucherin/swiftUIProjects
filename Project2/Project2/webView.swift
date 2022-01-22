//
//  webView.swift
//  Project2
//
//  Created by Elizabeth Yu on 2022/01/22.
//

import SwiftUI
import SafariServices


struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
}


struct webView: View {
    @State private var showSafari: Bool = false
    var body: some View {
        VStack {
            HStack{
                
                Link (destination: URL(string: "https://www.linkedin.com/in/eyucherin/")!){
                    Text("Linkedin")
                        .font(.system(size: 20))
                        .padding()
                        .background(Color.yellow)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                }
                Text("Github")
                    .font(.system(size: 20))
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "https://github.com/eyucherin?tab=repositories")!, options: [:])
                    }
                
                Text("Medium")
                    .font(.system(size: 20))
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .onTapGesture{
                        showSafari.toggle()
                    }
                    .fullScreenCover(isPresented: $showSafari, content: {
                            SFSafariViewWrapper(url: URL(string: "https://medium.com/me/stories/public")!)
                    })
                
                
                
             
                 
            }
            .frame(width: 320)
    
        }
        
    }
}

struct webView_Previews: PreviewProvider {
    static var previews: some View {
        webView()
    }
}
