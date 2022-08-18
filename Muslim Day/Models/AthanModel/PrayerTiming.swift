
import Foundation
struct PrayerTiming : Decodable {
	let code : Int?
	let status : String?
	let data : TimingData?

	enum CodingKeys: String, CodingKey {

		case code = "code"
		case status = "status"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		code = try values.decodeIfPresent(Int.self, forKey: .code)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		data = try values.decodeIfPresent(TimingData.self, forKey: .data)
	}

}