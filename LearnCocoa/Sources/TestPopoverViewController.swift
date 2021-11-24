//
//  TestPopoverViewController.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/5/12.
//

import Foundation
import AppKit
import Flow

final class TestPopoverViewController: NSViewController {
  override func loadView() {
    let view = NSView(frame: NSRect(x: 0, y: 0, width: 375, height: 675))
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.white.cgColor
    self.view = view
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()

    let field = NSTextField(string: "New world!")
    view.addSubview(field)

    field.translatesAutoresizingMaskIntoConstraints = false
    AutoLayout {
      field.anchor.top == view.anchor.top
      field.anchor.leading == view.anchor.leading
      field.anchor.bottom == view.anchor.bottom
      field.anchor.trailing == view.anchor.trailing
//      field.anchor.centerX == view.anchor.centerX
//      field.anchor.centerY == view.anchor.centerY
    }
  }

}
