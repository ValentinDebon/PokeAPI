
public struct APIResourceList<R: Resource>: Codable {
	public var count: Int
	public var next: String?
	public var previous: String?
	public var results: Set<APIResource<R>>
}

public struct NamedAPIResourceList<R: NamedResource>: Codable {
	public var count: Int
	public var next: String?
	public var previous: String?
	public var results: Set<NamedAPIResource<R>>
}

