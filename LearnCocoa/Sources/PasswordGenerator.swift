//
//  PasswordGenerator.swift
//  LearnCocoa
//
//  Created by Zhu Shengqi on 2021/3/21.
//

import Foundation

final class PasswordGenerator {
	private let characters = Array("0123456789abcdefghijklmnopqrstuvwxyz" + "ABCDEFGHIJKLMNOPQRSTUVWXYZ")

	func generateRandomString(length: Int) -> String {
		assert(length >= 0)
		var result = ""

		for _ in 0..<length {
			result.append(characters.randomElement()!)
		}

		return result
	}
}
