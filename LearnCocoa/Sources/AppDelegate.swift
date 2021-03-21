//
//  AppDelegate.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/3/14.
//

import Foundation
import AppKit
import Flow

@main
class AppDelegate: NSObject, NSApplicationDelegate {
  static func main() {
    let delegate = AppDelegate()
    NSApplication.shared.delegate = delegate

    _ = NSApplicationMain(CommandLine.argc, CommandLine.unsafeArgv)
  }
  
  private var mainWindow: NSWindow?
  
  func applicationDidFinishLaunching(_ aNotification: Notification) {
		setUp()
  }

	private func setUp() {
		setUpMenu()

//		let window = NSWindow(
//			contentRect: .zero,
//			styleMask: [.titled, .closable, .miniaturizable, .resizable],
//			backing: .buffered, defer: false
//		)
//
//		window.titlebarSeparatorStyle = .automatic
//		window.hasShadow = true
//		window.isRestorable = true
//		window.tabbingMode = .automatic
//		window.contentViewController = MainViewController()
//
//		window.title = "LearnCocoa"
//		window.setFrame(NSRect(x: 100, y: 240, width: 480, height: 270), display: false)
//
//		window.makeKeyAndOrderFront(nil)
//
//		mainWindow = window
    setUpMainWindow()
	}
  
  private func setUpMainWindow() {
    let windowController = MainWindowController()
    print(windowController.window)
    print("dd")
    windowController.showWindow(nil)
  }

	private func setUpMenu() {
		let menu = NSMenu().withBuildContext { context in
			context.addSubmenu(title: Bundle.main.displayName) { (context) in
				context.addItem(title: "About \(Bundle.main.displayName)", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)))

				context.addSeparator()

				context.addItem(title: "Preferences...", action: nil, keyEquivalent: ",", keyModifiers: .command)

				context.addSeparator()

				context.addSubmenu(title: "Services", { _ in })

				context.addSeparator()

				context.addItem(title: "Hide \(Bundle.main.displayName)", action: #selector(NSApplication.hide(_:)), keyEquivalent: "h", keyModifiers: .command)

				context.addItem(title: "Hide Others", action: #selector(NSApplication.hideOtherApplications(_:)), keyEquivalent: "h", keyModifiers: [.option, .command])

				context.addItem(title: "Show All", action: #selector(NSApplication.unhideAllApplications(_:)))

				context.addSeparator()

				context.addItem(title: "Quit \(Bundle.main.displayName)", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q", keyModifiers: .command)
			}

			context.addSubmenu(title: "File") { context in
				context.addItem(title: "New", action: #selector(NSDocumentController.newDocument(_:)), keyEquivalent: "n", keyModifiers: .command)

				context.addItem(title: "Open...", action: #selector(NSDocumentController.openDocument(_:)), keyEquivalent: "o", keyModifiers: .command)

				context.addSubmenu(title: "Open Recent") { context in
					context.addItem(title: "Clear Menu", action: #selector(NSDocumentController.clearRecentDocuments(_:)))
				}

				context.addSeparator()

				context.addItem(title: "Close", action: #selector(NSWindow.performClose(_:)), keyEquivalent: "w", keyModifiers: .command)

				context.addItem(title: "Save...", action: #selector(NSDocument.save(_:)), keyEquivalent: "s", keyModifiers: .command)

				context.addItem(title: "Save As...", action: #selector(NSDocument.saveAs(_:)), keyEquivalent: "s", keyModifiers: [.shift, .command])

				context.addItem(title: "Revert to Saved", action: #selector(NSDocument.revertToSaved(_:)), keyEquivalent: "r", keyModifiers: .command)

				context.addSeparator()

				context.addItem(title: "Page Setup", action: #selector(NSDocument.runPageLayout(_:)), keyEquivalent: "p", keyModifiers: [.shift, .command])

				context.addItem(title: "Print", action: #selector(NSDocument.printDocument(_:)), keyEquivalent: "p", keyModifiers: .command)
			}

			context.addSubmenu(title: "Edit") { context in
				context.addItem(title: "Undo", action: #selector(UndoManager.undo), keyEquivalent: "z", keyModifiers: .command)

				context.addItem(title: "Redo", action: #selector(UndoManager.redo), keyEquivalent: "z", keyModifiers: [.shift, .command])

				context.addSeparator()

				context.addItem(title: "Cut", action: #selector(NSText.cut(_:)), keyEquivalent: "x", keyModifiers: .command)

				context.addItem(title: "Copy", action: #selector(NSText.copy(_:)), keyEquivalent: "c", keyModifiers: .command)

				context.addItem(title: "Paste", action: #selector(NSText.paste(_:)), keyEquivalent: "v", keyModifiers: .command)

				context.addItem(title: "Past and Match Style", action: #selector(NSTextView.pasteAsPlainText(_:)), keyEquivalent: "v", keyModifiers: [.shift, .option, .command])

				context.addItem(title: "Delete", action: #selector(NSText.delete(_:)))

				context.addItem(title: "Select All", action: #selector(NSText.selectAll(_:)), keyEquivalent: "a", keyModifiers: .command)

				context.addSeparator()

				context.addSubmenu(title: "Find") { context in
					context.addItem(title: "Find...", action: #selector(NSTextView.performFindPanelAction(_:)), keyEquivalent: "f", keyModifiers: .command)

					context.addItem(title: "Find and Replace...", action: #selector(NSTextView.performFindPanelAction(_:)), keyEquivalent: "f", keyModifiers: [.option, .command])

					context.addItem(title: "Find Next", action: #selector(NSTextView.performFindPanelAction(_:)), keyEquivalent: "g", keyModifiers: .command)

					context.addItem(title: "Find Previous", action: #selector(NSTextView.performFindPanelAction(_:)), keyEquivalent: "g", keyModifiers: [.shift, .command])

					context.addItem(title: "Use Selection for Find", action: #selector(NSTextView.performFindPanelAction(_:)), keyEquivalent: "e", keyModifiers: .command)

					context.addItem(title: "Jump to Selection", action: #selector(NSTextView.centerSelectionInVisibleArea(_:)), keyEquivalent: "j", keyModifiers: .command)
				}

				context.addSubmenu(title: "Spelling and Grammar") { context in
					context.addItem(title: "Show Spelling and Grammar", action: #selector(NSText.showGuessPanel(_:)), keyEquivalent: ":", keyModifiers: .command)

					context.addItem(title: "Check Document Now", action: #selector(NSText.checkSpelling(_:)), keyEquivalent: ";", keyModifiers: .command)

					context.addSeparator()

					context.addItem(title: "Check Spelling While Typing", action: #selector(NSTextView.toggleContinuousSpellChecking(_:)))

					context.addItem(title: "Check Grammar with Spelling", action: #selector(NSTextView.toggleGrammarChecking(_:)))

					context.addItem(title: "Correct Spelling Automatically", action: #selector(NSTextView.toggleAutomaticSpellingCorrection(_:)))
				}

				context.addSubmenu(title: "Substitutions") { context in
					context.addItem(title: "Show Substitutions", action: #selector(NSTextView.orderFrontSubstitutionsPanel(_:)))

					context.addSeparator()

					context.addItem(title: "Smart Copy/Paste", action: #selector(NSTextView.toggleSmartInsertDelete(_:)))

					context.addItem(title: "Smart Quotes", action: #selector(NSTextView.toggleAutomaticQuoteSubstitution(_:)))

					context.addItem(title: "Smart Dashes", action: #selector(NSTextView.toggleAutomaticDashSubstitution(_:)))

					context.addItem(title: "Smart Links", action: #selector(NSTextView.toggleAutomaticLinkDetection(_:)))

					context.addItem(title: "Data Detectors", action: #selector(NSTextView.toggleAutomaticDataDetection(_:)))

					context.addItem(title: "Text Replacement", action: #selector(NSTextView.toggleAutomaticTextReplacement(_:)))
				}

				context.addSubmenu(title: "Transformations") { context in
					context.addItem(title: "Make Upper Case", action: #selector(NSStandardKeyBindingResponding.uppercaseWord(_:)))

					context.addItem(title: "Make Lower Case", action: #selector(NSStandardKeyBindingResponding.lowercaseWord(_:)))

					context.addItem(title: "Capitalize", action: #selector(NSStandardKeyBindingResponding.capitalizeWord(_:)))
				}

				context.addSubmenu(title: "Speech") { context in
					context.addItem(title: "Start Speaking", action: #selector(NSTextView.startSpeaking(_:)))

					context.addItem(title: "Stop Speaking", action: #selector(NSTextView.stopSpeaking(_:)))
				}

				// The cleanest way to disable auto-addition of dictation and emoji menu item. See https://stackoverflow.com/questions/21369736/remove-start-dictation-and-special-characters-from-menu
				//			UserDefaults.standard.set(true, forKey: "NSDisabledDictationMenuItem")
				//			UserDefaults.standard.set(true, forKey: "NSDisabledCharacterPaletteMenuItem")
			}

			context.addSubmenu(title: "Format") { context in
				if let fontMenu = NSFontManager.shared.fontMenu(true) {
					context.addSubmenu(fontMenu)
				} else {
					assertionFailure("No font menu returned from NSFontManager.shared")
				}

				context.addSubmenu(title: "Text") { context in
					context.addItem(title: "Align Left", action: #selector(NSText.alignLeft(_:)), keyEquivalent: "{", keyModifiers: .command)

					context.addItem(title: "Center", action: #selector(NSText.alignCenter(_:)), keyEquivalent: "|", keyModifiers: .command)

					context.addItem(title: "Justify", action: #selector(NSTextView.alignJustified(_:)))

					context.addItem(title: "Align Right", action: #selector(NSText.alignRight(_:)), keyEquivalent: "}", keyModifiers: .command)

					context.addSeparator()

					context.addSubmenu(title: "Writing Direction") { context in
						context.addItem(title: "Paragraph", action: nil).isEnabled = false

						context.addItem(title: "Default", action: #selector(NSStandardKeyBindingResponding.makeBaseWritingDirectionNatural(_:))).indentationLevel = 2

						context.addItem(title: "Left to Right", action: #selector(NSStandardKeyBindingResponding.makeBaseWritingDirectionLeftToRight(_:))).indentationLevel = 2

						context.addItem(title: "Right to Left", action: #selector(NSStandardKeyBindingResponding.makeBaseWritingDirectionRightToLeft(_:)))

						context.addSeparator()

						context.addItem(title: "Selection", action: nil).isEnabled = false

						context.addItem(title: "Default", action: #selector(NSStandardKeyBindingResponding.makeTextWritingDirectionNatural(_:)))

						context.addItem(title: "Left to Right", action: #selector(NSStandardKeyBindingResponding.makeTextWritingDirectionLeftToRight(_:)))

						context.addItem(title: "Right to Left", action: #selector(NSStandardKeyBindingResponding.makeTextWritingDirectionRightToLeft(_:)))
					}

					context.addSeparator()

					context.addItem(title: "Show Ruler", action: #selector(NSText.toggleRuler(_:)))

					context.addItem(title: "Copy Ruler", action: #selector(NSText.copyRuler(_:)), keyEquivalent: "c", keyModifiers: [.control, .command])

					context.addItem(title: "Paste Ruler", action: #selector(NSText.pasteRuler(_:)), keyEquivalent: "v", keyModifiers: [.control, .command])
				}
			}

			context.addSubmenu(title: "View") { context in
				context.addItem(title: "Show Toolbar", action: #selector(NSWindow.toggleToolbarShown(_:)), keyEquivalent: "t", keyModifiers: [.option, .command])

				context.addItem(title: "Customize Toolbar...", action: #selector(NSWindow.runToolbarCustomizationPalette(_:)))

				context.addSeparator()

				context.addItem(title: "Show Sidebar", action: #selector(NSSplitViewController.toggleSidebar(_:)), keyEquivalent: "s", keyModifiers: [.control, .command])

				context.addItem(title: "Enter Full Screen", action: #selector(NSWindow.toggleFullScreen(_:)), keyEquivalent: "f", keyModifiers: [.control, .command])
			}

			context.addSubmenu(title: "Window") { context in
				context.addItem(title: "Minimize", action: #selector(NSWindow.performMiniaturize(_:)), keyEquivalent: "m", keyModifiers: .command)

				context.addItem(title: "Zoom", action: #selector(NSWindow.performZoom(_:)))

				context.addSeparator()

				context.addItem(title: "Bring All to Front", action: #selector(NSApplication.arrangeInFront(_:)))
			}

			context.addSubmenu(title: "Help") { context in
				context.addItem(title: "\(Bundle.main.displayName) help", action: #selector(NSApplication.showHelp(_:)), keyEquivalent: "?", keyModifiers: .command)
			}
		}

		NSApplication.shared.menu = menu
	}

}

