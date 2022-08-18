
import Foundation
struct Timings : Codable {
	let fajr : String?
	let sunrise : String?
	let dhuhr : String?
	let asr : String?
	let sunset : String?
	let maghrib : String?
	let isha : String?
	let imsak : String?
	let midnight : String?

	enum CodingKeys: String, CodingKey {

		case fajr = "Fajr"
		case sunrise = "Sunrise"
		case dhuhr = "Dhuhr"
		case asr = "Asr"
		case sunset = "Sunset"
		case maghrib = "Maghrib"
		case isha = "Isha"
		case imsak = "Imsak"
		case midnight = "Midnight"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fajr = try values.decodeIfPresent(String.self, forKey: .fajr)
		sunrise = try values.decodeIfPresent(String.self, forKey: .sunrise)
		dhuhr = try values.decodeIfPresent(String.self, forKey: .dhuhr)
		asr = try values.decodeIfPresent(String.self, forKey: .asr)
		sunset = try values.decodeIfPresent(String.self, forKey: .sunset)
		maghrib = try values.decodeIfPresent(String.self, forKey: .maghrib)
		isha = try values.decodeIfPresent(String.self, forKey: .isha)
		imsak = try values.decodeIfPresent(String.self, forKey: .imsak)
		midnight = try values.decodeIfPresent(String.self, forKey: .midnight)
	}

}
