//
//  Question.swift
//  ColorOfMood
//
//  Created by macbook on 15/08/2019.
//  Copyright © 2019 macbook. All rights reserved.
//


import Foundation
//
//struct Answer {
//    var text: String
//    var type: ColorType
//}

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

extension Question {
    static func getQuestions() -> [Question] {
        return [
            Question(

                text: "Выберите подходящее вам утверждение:",
                type: .single,
                answers: [
                    Answer(text: "Я ощущаю прилив сил и бодрости", type: .green),
                    Answer(text: "Я испытываю приступ меланхолии", type: .purple),
                    Answer(text: "Мое состояние ровное и спокойное", type: .blue),
                    Answer(text: "Мое настроение можно описать как мечтательное", type: .yellow)
                ]
            ),
            Question(
                text: "В настоящий момент вас привлекает возможность:",
                type: .multiple,
                answers: [
                    Answer(text: "Отправиться в путешествие, сорвавшись с места", type: .yellow),
                    Answer(text: "Уютно устроиться с книгой, посмотреть любимый фильм", type: .blue),
                    Answer(text: "Провести время с друзьями", type: .green),
                    Answer(text: "Предаться размышлениям о смысле жизни", type: .purple)
                ]
            ),
            Question(
                text: "В настоящий момент вы предпочитаете:",
                type: .single,
                answers: [
                    Answer(text: "Одеваться неброско, практично", type: .yellow),
                    Answer(text: "Носить мрачные, темные тона", type: .purple),
                    Answer(text: "Одеваться ярко, оригинально", type: .green),
                    Answer(text: "Соблюдать деловой стиль в одежде", type: .blue)
                ]
            ),
            Question(
                text: "Выберите привлекающее вас время суток:",
                type: .ranged,
                answers: [
                    Answer(text: "Утро", type: .green),
                    Answer(text: "Ночь", type: .purple),
                    Answer(text: "День", type: .yellow),
                    Answer(text: "Вечер", type: .blue)
                ]
            ),            Question(
                text: "Выберите предпочтительную для вас погоду",
                type: .multiple,
                answers: [
                    Answer(text: "Снег", type: .blue),
                    Answer(text: "Солнце", type: .yellow),
                    Answer(text: "Гроза", type: .green),
                    Answer(text: "Туман", type: .purple)

                ]
            )
        ]
    }
}
