//
//  Player.swift
//  Engine
//
//  Created by Dustin Knopoff on 8/30/20.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import Foundation

public struct Player {
	public var position: Vector
	public var velocity: Vector
	public var radius: Double = 0.5
	public let speed: Double = 2
	
	public init(position: Vector) {
		self.position = position
		self.velocity = Vector(x: 0, y: 0)
	}
}

public extension Player {
	var rect: Rect {
		let halfSize = Vector(x: radius, y: radius)
		return Rect(min: position - halfSize, max: position + halfSize)
	}
	
	func intersection(with map: Tilemap) -> Vector? {
		let minX = Int(rect.min.x), maxX = Int(rect.max.x)
		let minY = Int(rect.min.y), maxY = Int(rect.max.y)
		var largestIntersection: Vector?
		for y in minY ... maxY {
			for x in minX ... maxX where map[x, y].isWall {
				let wallRect = Rect(
					min: Vector(x: Double(x), y: Double(y)),
					max: Vector(x: Double(x + 1), y: Double(y + 1))
				)
				if let intersection = rect.intersection(with: wallRect),
					intersection.length > largestIntersection?.length ?? 0 {
					largestIntersection = intersection
				}
			}
		}
		return largestIntersection
	}
}
