
public protocol Resource: Hashable, Codable {
	static var endpoint: String { get }
	var id: Int { get }
}

public protocol NamedResource: Resource {
	var name: String { get }
}

public protocol Localized: Hashable, Codable {
	var language: NamedAPIResource<Language> { get }
}

public extension Resource {
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.id)
	}

	static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.id == rhs.id
	}
}

public extension Localized {
	func hash(into hasher: inout Hasher) {
		hasher.combine(self.language)
	}

	static func ==(lhs: Self, rhs: Self) -> Bool {
		lhs.language == rhs.language
	}
}
