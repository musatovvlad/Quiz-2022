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
    
    
    static let all:[Questions] = [
        Questions(text: "Какую еду вы любите?", type: .single, answers: [
            Answer(text:"Рыбу", type:.cat),
            Answer(text:"Стэйк", type:.dog),
            Answer(text:"Морковь", type:.rabbit),
            Answer(text:"Кукурузу", type:.turtle),
        
        ]),
        Questions(text: "Что вы любите делать?", type: .multiple, answers: [ //switch
            Answer(text:"Прыгать", type:.rabbit),
            Answer(text:"Спать", type:.cat),
            Answer(text:"Есть ", type:.dog),
            Answer(text:"Плавать", type:.turtle),
        ]),
        Questions(text: "Любите ли вы ездить на машине?", type: .range, answers: [ // Слайдер
            Answer(text:"Обожаю", type:.dog),
            Answer(text:"Не замечаю", type:.turtle),
            Answer(text:"Нервничаю", type:.rabbit),
            Answer(text:"Ненавижу", type:.cat),
        ]),
    ]
}
 
