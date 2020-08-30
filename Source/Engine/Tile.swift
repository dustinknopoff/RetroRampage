//
//  Tile.swift
//  Engine
//
//  Created by Dustin Knopoff on 8/30/20.
//  Copyright © 2020 Nick Lockwood. All rights reserved.
//

import Foundation

public enum Tile: Int, Decodable {
	case floor
	case wall
}

public extension Tile {
	var isWall: Bool {
		switch self {
		case .wall:
			return true
		case .floor:
			return false
		}
	}
}
