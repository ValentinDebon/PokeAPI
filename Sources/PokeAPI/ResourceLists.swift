
public struct APIResourceList<R : Resource> : Codable {
	public let count : Int
	public let next : String?
	public let previous : String?
	public let results : Set<APIResource<R>>
}

public struct NamedAPIResourceList<R : NamedResource> : Codable {
	public let count : Int
	public let next : String?
	public let previous : String?
	public let results : Set<NamedAPIResource<R>>
}

