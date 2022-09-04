//
//  PDFManager.swift
//  TargetWaterForCoffee
//
//  Created by 김현준 on 2022/09/03.
//

import UIKit
import Foundation

extension UIView {
  // Export pdf from Save pdf in drectory and return pdf file path
  func exportAsPdfFromView() -> String {
      let pdfPageFrame = self.bounds
      let pdfData = NSMutableData()
      UIGraphicsBeginPDFContextToData(pdfData, pdfPageFrame, nil)
      UIGraphicsBeginPDFPageWithInfo(pdfPageFrame, nil)
      guard let pdfContext = UIGraphicsGetCurrentContext() else { return "" }
      self.layer.render(in: pdfContext)
      UIGraphicsEndPDFContext()
      return self.saveViewPdf(data: pdfData)
  }

  // Save pdf file in document directory
  func saveViewPdf(data: NSMutableData) -> String {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let docDirectoryPath = paths[0]
    let pdfPath = docDirectoryPath.appendingPathComponent("viewPdf.pdf")
    if data.write(to: pdfPath, atomically: true) {
        return pdfPath.path
    } else {
        return ""
    }
  }
}


extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
