//
//  MainViewController.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/3/14.
//

import AppKit

final class MainViewController: NSViewController {
  // MARK: - View life cycle
  override func loadView() {
    let view = NSView()

    view.wantsLayer = true

    self.view = view
  }

}
