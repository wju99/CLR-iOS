//
//  ResourcesItemView.swift
//  Tenant
//
//  Created by Will Ju on 10/24/23.
//

import SwiftUI
import PDFKit

struct ResourcesItemView: UIViewRepresentable {
    
    var resourceName: String
    
    func makeUIView(context: UIViewRepresentableContext<ResourcesItemView>) -> PDFView {
        let pdfUrl = Bundle.main.url(forResource: resourceName, withExtension: "pdf")
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: pdfUrl!)
        return pdfView
    }
    
    func updateUIView(_ uiView: PDFView, context: UIViewRepresentableContext<ResourcesItemView>) {
        // TODO
    }
    
}

#Preview {
    ResourcesItemView(resourceName: "Mission Statement")
}
