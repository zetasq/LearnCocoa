//
//  PopoverUtils.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/5/17.
//

import Foundation
import Cocoa


public class OlkTooltipUtils {

  public static func show(relativeTo positioningRect: NSRect, of positioningView: NSView, preferredEdge: NSRectEdge, withTooltipText text: String) {
    let controller = PopoverViewController.init(tooltipText: text)
    let popover = NSPopover.init()
    popover.behavior = .transient
    popover.contentViewController = controller
    popover.show(relativeTo: positioningRect, of: positioningView, preferredEdge: preferredEdge)
  }
}

private class PopoverViewController : NSViewController {

  private let tooltipText : String

  init(tooltipText: String) {
    self.tooltipText = tooltipText

    let textField = NSTextField()
    textField.stringValue = tooltipText
    textField.drawsBackground = true
    textField.backgroundColor = NSColor.clear
    textField.isBezeled = false
    textField.isBordered = false
    textField.isSelectable = false
    textField.alignment = .natural
    textField.font = NSFont.systemFont(ofSize: ViewConstants.popoverTextFontSize)
    textField.preferredMaxLayoutWidth = 300

    self.innerTextView = textField

    super.init(nibName: nil, bundle: nil)
  }

  @available(*, unavailable)
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private let innerTextView : NSTextField

  override func loadView() {
    view = NSView()
    setupStackView()
  }

  private func setupStackView() {
    let stackView = NSStackView.init(frame: NSZeroRect)
    stackView.alignment = .leading
    stackView.orientation = .vertical
    stackView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stackView)

    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: ViewConstants.popoverInnerPadding),
      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: ViewConstants.popoverInnerPadding),
      stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -ViewConstants.popoverInnerPadding),
      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -ViewConstants.popoverInnerPadding),
    ])

    stackView.spacing = 20
    stackView.addArrangedSubview(innerTextView)
  }
}

private enum ViewConstants {
  static let popoverTextFontSize: CGFloat = 11
  static let popoverInnerPadding: CGFloat = 5
}
