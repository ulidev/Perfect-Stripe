//
//  enumCollection.swift
//  PerfectStripe
//
//  Created by Jonathan Guthrie on 2017-05-25.
//
//

public enum StripeInterval: String {
	case day, week, month, year
}

public enum StripeCouponDuration: String {
	case forever, once, repeating
}

public enum StripeSubscriptionStatus: String {
	/// Note that "all" is ONLY for list sub method
	case trialing, active, past_due, canceled, unpaid, all
}
