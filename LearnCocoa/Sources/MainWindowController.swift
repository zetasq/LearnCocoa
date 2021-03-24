//
//  MainWindowController.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/3/20.
//

import Foundation
import AppKit
import Flow

final class MainWindowController: NSWindowController {
	private var colorWell: NSColorWell?

	private var redSlider: NSSlider?

	private var greenSlider: NSSlider?

	private var blueSlider: NSSlider?

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

		window.title = "LearnCocoa"

		self.window = window
  }

	override func windowDidLoad() {
		super.windowDidLoad()

		setUpUI()
		updateColorWellColor()
	}

	private func setUpUI() {
		let containerStackView = NSStackView()
		containerStackView.orientation = .horizontal

		window!.contentView!.addSubview(containerStackView)
		containerStackView.translatesAutoresizingMaskIntoConstraints = false
		AutoLayout {
			containerStackView.anchor.centerX == window!.contentView!.anchor.centerX
			containerStackView.anchor.centerY == window!.contentView!.anchor.centerY
		}

		do {
			let colorWell = NSColorWell()
			colorWell.isEnabled = false
			self.colorWell = colorWell

			containerStackView.addArrangedSubview(colorWell)
			AutoLayout {
				colorWell.anchor.width == 200
				colorWell.anchor.height == 200
			}

			let colorSlidersStackView = NSStackView()
			colorSlidersStackView.orientation = .vertical

			containerStackView.addArrangedSubview(colorSlidersStackView)

			do {
				let redStackView = NSStackView()
				redStackView.orientation = .horizontal

				colorSlidersStackView.addArrangedSubview(redStackView)

				do {
					let label = NSTextField(labelWithString: "R")
					redStackView.addArrangedSubview(label)

					let redSlider = NSSlider()
					redSlider.action = #selector(redSliderValueChanged(_:))
					self.redSlider = redSlider

					redStackView.addArrangedSubview(redSlider)
					AutoLayout {
						redSlider.anchor.width == 100
					}
				}

				let greenStackView = NSStackView()
				greenStackView.orientation = .horizontal

				colorSlidersStackView.addArrangedSubview(greenStackView)

				do {
					let label = NSTextField(labelWithString: "G")
					greenStackView.addArrangedSubview(label)

					let greenSlider = NSSlider()
					greenSlider.action = #selector(greenSliderValueChanged(_:))
					self.greenSlider = greenSlider

					greenStackView.addArrangedSubview(greenSlider)
					AutoLayout {
						greenSlider.anchor.width == 100
					}
				}

				let blueStackView = NSStackView()
				blueStackView.orientation = .horizontal

				colorSlidersStackView.addArrangedSubview(blueStackView)

				do {
					let label = NSTextField(labelWithString: "B")
					blueStackView.addArrangedSubview(label)

					let blueSlider = NSSlider()
					blueSlider.action = #selector(blueSliderValueChanged(_:))
					self.blueSlider = blueSlider

					blueStackView.addArrangedSubview(blueSlider)
					AutoLayout {
						blueSlider.anchor.width == 100
					}
				}
			}
		}
	}

	@objc
	private func redSliderValueChanged(_ sender: NSSlider) {
		updateColorWellColor()
		print("Red slider value = \(sender.doubleValue)")
	}

	@objc
	private func greenSliderValueChanged(_ sender: NSSlider) {
		updateColorWellColor()
		print("Green slider value = \(sender.doubleValue)")
	}

	@objc
	private func blueSliderValueChanged(_ sender: NSSlider) {
		updateColorWellColor()
		print("Blue slider value = \(sender.doubleValue)")
	}

	private func updateColorWellColor() {
		let redValue = CGFloat(redSlider?.doubleValue ?? 0)
		let greenValue = CGFloat(greenSlider?.doubleValue ?? 0)
		let blueValue = CGFloat(blueSlider?.doubleValue ?? 0)
		let color = NSColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
		self.colorWell?.color = color
	}
}
