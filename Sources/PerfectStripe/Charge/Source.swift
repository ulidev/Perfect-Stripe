//
//  Source.swift
//  Perfect-Stripe
//
//  Created by Jonathan Guthrie on 2017-05-16.
//
//

import PerfectLib

public class StripeChargeSource {

	/// Two digit number representing the card's expiration month.
	public var exp_month: String = ""

	/// Two or four digit number representing the card's expiration year.
	public var exp_year: String = ""

	/// The card number, as a string without any separators.
	public var number: String = ""

	/// The type of payment source. Should be "card".
	public var object: String = "card"

	/// Card security code. Highly recommended to always include this value, but it's only required for accounts based in European countries.
	public var cvc: String = ""

	public var address_city: String = ""
	public var address_country: String = ""
	public var address_line1: String = ""
	public var address_line2: String = ""

	/// Cardholder's full name
	public var name: String = ""

	public var address_state: String = ""
	public var address_zip: String = ""


	public func parse(_ obj: [String: Any]) {
		if let o = obj["exp_month"], !(o is PerfectLib.JSONConvertibleNull) {
			exp_month = o as? String ?? ""
		}
		if let o = obj["exp_year"], !(o is PerfectLib.JSONConvertibleNull) {
			exp_year = o as? String ?? ""
		}
		if let o = obj["number"], !(o is PerfectLib.JSONConvertibleNull) {
			number = o as? String ?? ""
		}
		if let o = obj["cvc"], !(o is PerfectLib.JSONConvertibleNull) {
			cvc = o as? String ?? ""
		}
		if let o = obj["address_city"], !(o is PerfectLib.JSONConvertibleNull) {
			address_city = o as? String ?? ""
		}
		if let o = obj["address_country"], !(o is PerfectLib.JSONConvertibleNull) {
			address_country = o as? String ?? ""
		}
		if let o = obj["address_line1"], !(o is PerfectLib.JSONConvertibleNull) {
			address_line1 = o as? String ?? ""
		}
		if let o = obj["address_line2"], !(o is PerfectLib.JSONConvertibleNull) {
			address_line2 = o as? String ?? ""
		}
		if let o = obj["name"], !(o is PerfectLib.JSONConvertibleNull) {
			name = o as? String ?? ""
		}
		if let o = obj["address_state"], !(o is PerfectLib.JSONConvertibleNull) {
			address_state = o as? String ?? ""
		}
		if let o = obj["address_zip"], !(o is PerfectLib.JSONConvertibleNull) {
			address_zip = o as? String ?? ""
		}

	}

	public static func parseArray(_ o: [[String: Any]]) -> [StripeChargeSource] {
		var out = [StripeChargeSource]()
		o.forEach{
			data in
			let this = StripeChargeSource()
			this.parse(data)
			out.append(this)
		}
		return out
	}

	public func asData() -> [String: Any] {
		var d = [String: Any]()
		d["exp_month"] = exp_month
		d["exp_year"] = exp_year
		d["number"] = number
		d["object"] = object
		d["cvc"] = cvc

		if !address_city.isEmpty { d["address_city"] = address_city }
		if !address_country.isEmpty { d["address_country"] = address_country }
		if !address_line1.isEmpty { d["address_line1"] = address_line1 }
		if !address_line2.isEmpty { d["address_line2"] = address_line2 }
		if !name.isEmpty { d["name"] = name }
		if !address_state.isEmpty { d["address_state"] = address_state }
		if !address_zip.isEmpty { d["address_zip"] = address_zip }

		return d
	}
}
