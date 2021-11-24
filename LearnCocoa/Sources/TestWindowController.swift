//
//  TestWindowController.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/3/21.
//

import Foundation
import AppKit
import Flow

class TestWindowController: NSWindowController {
  private var tableView: NSTableView!

  override var windowNibName: NSNib.Name? {
    Self.dummyNibNameForProgrammaticallyCreatedWindow
  }

  override func loadWindow() {
    let window = NSWindow(
      contentRect: .zero,
      styleMask: [.titled, .closable, .miniaturizable],
      backing: .buffered, defer: false
    )

    window.titlebarSeparatorStyle = .automatic
    window.hasShadow = true
    window.tabbingMode = .automatic
    window.isRestorable = false

    window.title = "Test TextView"

    self.window = window
  }
  
  override func windowDidLoad() {
    super.windowDidLoad()

    self.tableView = NSTableView()
    self.tableView.dataSource = self
    self.tableView.delegate = self

    self.window?.contentView?.addSubview(self.tableView)
    self.tableView.translatesAutoresizingMaskIntoConstraints = false
    AutoLayout {
      self.tableView.anchor.top == self.window!.contentView!.anchor.top
    }
  }

  @objc
  private func buttonClicked(_ sender: Any) {
//	boxView1.isHidden.toggle()
//	boxView2.isHidden.toggle()
	print("aassdd")
  }

}

extension TestWindowController: NSTableViewDataSource {

}

extension TestWindowController: NSTableViewDelegate {

}
