//
//  MainScreenEntity.swift
//  SravniTestTask1
//
//  Created by Artem  on 17.12.2021.
//

import UIKit

struct MainScreenSection {
    let title: String
    let titleSize: CGFloat
    let insets: CGFloat
    let bgColor: UIColor
    let items: [MainScreenItem]
}

enum MainScreenItem {
    case topInformationItem(data: [TopInformationCards])
    case OSAGOItem(data: [Coefficient])
    case moreCoefficientItem(data: MoreCoefficient)
}


struct PresentationData {
    var moreCoefficientData: [MoreCoefficient]
    var topInformationCardsData: [TopInformationCards]
    var coefficientData: [Coefficient]
}

struct TopInformationCards {
    let description: String
    let image: UIImage?
}

struct Coefficient {
    let title: String
    let description: String
}

struct MoreCoefficient {
    let coefficient: Coefficient
    let image: UIImage?
    let moreDescription: String
    
}

struct MainScreenItemsMock {
    static let coefficientData: [Coefficient] = [Coefficient(title: "БТ", description: "Базовый\nтариф"),
                                                  Coefficient(title: "КМ", description: "Коэффициент\nмощности"),
                                                  Coefficient(title: "КТ", description: "Коэффициент\nтерритории"),
                                                  Coefficient(title: "КБМ", description: "Коэффициент\nбезаварийности"),
                                                  Coefficient(title: "КО", description: "Коэффициент\nограничений"),
                                                  Coefficient(title: "КВС", description: "Коэффициент\nвозраст-стаж")]
    
    static let topInformationCardsData: [TopInformationCards] = [TopInformationCards(description: "Цена ОСАГО каждый год меняется, то вверх, то вниз, даже если не было аварий. Разложим цену полочкам", image: UIImage(named: "airplane")),
                                                                  TopInformationCards(description: "Базовый тариф - единственный параметр, который индивидуально устанавливается страховой компанией, все остальные параметры едины для всех", image: UIImage(named: "wallet")),
                                                                  TopInformationCards(description: "К полису будет применяться “самый плохой” КБМ из всех водителей, то есть за аварийных водителей придется заплатить", image: UIImage(named: "percent")),
                                                                  TopInformationCards(description: "Как и с КБМ - для расчета цены и оформления всегда будут применяться данные самого молодого и неопытного водителя", image: UIImage(named: "chair")),
                                                                  TopInformationCards(description: "Цены на полис ОСАГО будут одинаковые на сайте страховых, у агента или на сайте сравнения. На сайтах сравнения обычно немного удобнее", image: UIImage(named: "car"))]
    
    static let moreCoefficientData: [MoreCoefficient] = [
        MoreCoefficient(coefficient: Coefficient(title: "БТ ", description: "Базовый тариф"), image: UIImage(named: "BT"), moreDescription: "Устанавливается индивидуально каждой страховой от 2 471 до 5 436 Р "),
        MoreCoefficient(coefficient: Coefficient(title: "КМ ", description: "Коэффициент мощности"), image: UIImage(named: "KM"), moreDescription: "Чем мощнее ваш автомоибиль, тем выше будет коэффициент и цена"),
        MoreCoefficient(coefficient: Coefficient(title: "КТ ", description: "Коэффициент территории"), image: UIImage(named: "KT"), moreDescription: "Всегда применяется по прописке собственника автомобиля"),
        MoreCoefficient(coefficient: Coefficient(title: "КБМ ", description: "Коэффициент безаварийности"), image: UIImage(named: "KBM"), moreDescription: "Персональная накопленная скидка каждого водителя за безаварийность"),
        MoreCoefficient(coefficient: Coefficient(title: "КО ", description: "Коэффициент ограничений"), image: UIImage(named: "KO"), moreDescription: "Если страховка “без ограничений” - полис будет в 2 раза дороже"),
        MoreCoefficient(coefficient: Coefficient(title: "КВС ", description: "Коэффициент возраст-стаж"), image: UIImage(named: "BT"), moreDescription: "Чем старше и опытнее водитель - тем дешевле будет стоить полис"),
    ]
}
