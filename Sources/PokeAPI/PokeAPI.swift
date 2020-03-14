import Foundation

public class PokeAPI {
	public static func makeSession(withIdentifier identifier: String = "PokeAPI", cachedWith urlCache: URLCache?) -> URLSession {
		let sessionConfiguration = URLSessionConfiguration.background(withIdentifier: identifier)
		sessionConfiguration.networkServiceType = .responsiveData
		sessionConfiguration.urlCache = urlCache
		sessionConfiguration.requestCachePolicy = .returnCacheDataElseLoad

		return URLSession(configuration: sessionConfiguration)
	}

	private var cache : [String : Any] = [:]

	public subscript<R : Resource>(resource: APIResource<R>) -> R? {
		self.cache[resource.url] as? R
	}
}

