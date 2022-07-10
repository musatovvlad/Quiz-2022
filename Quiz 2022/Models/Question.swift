//
//  Question.swift
//  Quiz 2022
//
//  Created by влад on 09.07.2022.
//

struct Questions{
    let text: String
    let type: responseType
    let answers:[Answer]
    
    
    static let oll:[Questions] = [
        Questions(text: "Какую еду вы любите?", type: .single, answers: [
            Answer(text:"Рыбу", type:.cat),
            Answer(text:"Стэйк", type:.dog),
            Answer(text:"Морковь", type:.rabbit),
            Answer(text:"Кукурузу", type:.turtle),
        
        ]),
        Questions(text: "Что вы любите делать", type: .multiply, answers: [ //switch
            Answer(text:"Прыгать", type:.rabbit),
            Answer(text:"Спать", type:.cat),
            Answer(text:"Есть ", type:.dog),
            Answer(text:"Плавать", type:.turtle),
        ]),
        Questions(text: "Любите ли вы ездить на машине", type: .single, answers: [ // Слайдер
            Answer(text:"Не замечаю", type:.turtle),
            Answer(text:"Обожаю", type:.dog),
            Answer(text:"Ненавижу", type:.cat),
            Answer(text:"Нервничаю", type:.rabbit),
        ]),
    ]
}
 
