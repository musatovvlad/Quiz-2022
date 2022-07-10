//
//  AnimalType.swift
//  Quiz 2022
//
//  Created by влад on 10.07.2022.
//

enum AnimalType: Character{
    case dog="🐶"
    case cat="🐱"
    case rabbit="🐰"
    case turtle="🐢"
    
    
    // строка будет определять что значит быть (собакой, кошкой, ...)
    var definition: String{
        switch self {
        case .dog:
            return "Вы чрезвычaйано активны. Вы окружаете себя теми, кого любите и наслаждаетесь взаимодействием с ними"
        case .cat:
            return "Вы предпочитаете гулять сами по себе"
        case .rabbit:
            return "Вам нравится всё мягкое. Вы полны сил и энергии"
        case .turtle:
            return "И пусть вся жизнь подождёт!"
        }
    }
    
}
