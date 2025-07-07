//
//  PowerCategory.swift
//  Bonsai
//
//  Created by Rafael Soh on 6/6/22.
//

import Foundation
import SwiftUI

struct PowerCategory: Hashable, Identifiable {
    let id: UUID
    let category: Category
    let percent: Double
    let amount: Double
}

struct SuggestedCategory: Hashable {
    let name: String
    let emoji: String
    let income: Bool

    static var expenses: [SuggestedCategory] {
        var holding = [SuggestedCategory]()
        let food = SuggestedCategory(name: "Food", emoji: "🍔", income: false)
        holding.append(food)

        let transport = SuggestedCategory(name: "Transport", emoji: "🚆", income: false)
        holding.append(transport)

        let housing = SuggestedCategory(name: "Rent", emoji: "🏠", income: false)
        holding.append(housing)

        let subscriptions = SuggestedCategory(name: "Subscriptions", emoji: "🔄", income: false)
        holding.append(subscriptions)

        let groceries = SuggestedCategory(name: "Groceries", emoji: "🛒", income: false)
        holding.append(groceries)

        let family = SuggestedCategory(name: "Family", emoji: "👨‍👩‍👦", income: false)
        holding.append(family)

        let utilities = SuggestedCategory(name: "Utilities", emoji: "💡", income: false)
        holding.append(utilities)

        let fashion = SuggestedCategory(name: "Fashion", emoji: "👔", income: false)
        holding.append(fashion)

        let healthcare = SuggestedCategory(name: "Healthcare", emoji: "🚑", income: false)
        holding.append(healthcare)

        let pets = SuggestedCategory(name: "Pets", emoji: "🐕", income: false)
        holding.append(pets)

        let sneakers = SuggestedCategory(name: "Sneakers", emoji: "👟", income: false)
        holding.append(sneakers)

        let gifts = SuggestedCategory(name: "Gifts", emoji: "🎁", income: false)
        holding.append(gifts)

        return holding
    }

    static var incomes: [SuggestedCategory] {
        var holding = [SuggestedCategory]()
        let paycheck = SuggestedCategory(name: "Paycheck", emoji: "💰", income: true)
        holding.append(paycheck)

        let allowance = SuggestedCategory(name: "Allowance", emoji: "🤑", income: true)
        holding.append(allowance)

        let parttime = SuggestedCategory(name: "Part-Time", emoji: "💼", income: true)
        holding.append(parttime)

        let investments = SuggestedCategory(name: "Investments", emoji: "💹", income: true)
        holding.append(investments)

        let gifts = SuggestedCategory(name: "Gifts", emoji: "🧧", income: true)
        holding.append(gifts)

        let tips = SuggestedCategory(name: "Tips", emoji: "🪙", income: true)
        holding.append(tips)

        return holding
    }
}
