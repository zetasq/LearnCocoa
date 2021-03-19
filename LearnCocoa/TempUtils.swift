//
//  TempUtils.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/3/18.
//

import CoreFoundation
import Foundation

extension Bundle {
	public final var displayName: String {
		if let localizedInfoDict = localizedInfoDictionary {
			if let localizedDisplayName = localizedInfoDict["CFBundleDisplayName"] as? String {
				return localizedDisplayName
			}

			if let localizedName = localizedInfoDict[kCFBundleNameKey as String] as? String {
				return localizedName
			}
		}

		if let infoDict = infoDictionary {
			if let displayName = infoDict["CFBundleDisplayName"] as? String {
				return displayName
			}

			if let name = infoDict[kCFBundleNameKey as String] as? String {
				return name
			}
		}

		assertionFailure("No available name for bundle: \(self)")
		return ""
	}
}
