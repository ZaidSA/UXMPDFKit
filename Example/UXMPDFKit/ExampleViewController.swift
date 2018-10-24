//
//  ExampleViewController.swift
//  UXMPDFKit
//
//  Created by Chris Anderson on 5/7/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import UXMPDFKit

class ExampleViewController: UIViewController {
    
    @IBAction func loadPDF() {

//        let url = Bundle.main.path(forResource: "sample2", ofType: "pdf")!
        let documentDirectoryURL =  try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        let fpath = documentDirectoryURL.appendingPathComponent("PDFCache/Zg15j-Pix7nrzAPFINxSNTEV.pdf")
        let document = try! PDFDocument.from(filePath: fpath.absoluteString)
        
        let pdf = PDFViewController(document: document!)
        pdf.annotationController.annotationTypes = [
            PDFHighlighterAnnotation.self,
            PDFPenAnnotation.self,
            PDFTextAnnotation.self
        ]
        
        self.navigationController?.pushViewController(pdf, animated: true)
    }
}
