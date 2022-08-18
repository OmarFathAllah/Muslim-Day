
import Foundation
struct TimingData : Decodable {
	let timings : Timings?
	let date : Datea?
	let meta : Meta?

	enum CodingKeys: String, CodingKey {

		case timings = "timings"
		case date = "date"
		case meta = "meta"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		timings = try values.decodeIfPresent(Timings.self, forKey: .timings)
		date = try values.decodeIfPresent(Datea.self, forKey: .date)
		meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
	}

}
