//
//  GameModel.swift
//  MillionaireGame
//
//  Created by Alexandr Rodionov on 6.02.23.
//

import Foundation

struct Question {
    
    let id: Int
    let qText: String
    let qAnswers: [String]
    let correctAnswer: String
    let qDifficulty: Int
}

var qLevelOne = [
    Question(id: 1, qText: "Что растёт в огороде?", qAnswers: ["Лук", "Пистолет", "Пулемёт", "Ракета СС-20"], correctAnswer: "Лук", qDifficulty: 1),
    Question(id: 2, qText: "Как называют микроавтобусы, совершающие поездки по определённым маршрутам?", qAnswers: ["Рейсовка", "Путёвка", "Курсовка", "Маршрутка"], correctAnswer: "Маршрутка", qDifficulty: 1),
    Question(id: 3, qText: "О чём писал Грибоедов, отмечая, что он «нам сладок и приятен»?", qAnswers: ["Дым Отечества", "Дух купечества", "Дар пророчества", "Пыл девичества"], correctAnswer: "Дым Отечества", qDifficulty: 1),
    Question(id: 4, qText: "Какого персонажа нет в известной считалке «На золотом крыльце сидели»?", qAnswers: ["Сапожника", "Кузнеца", "Короля", "Портного"], correctAnswer: "Кузнеца", qDifficulty: 1),
    Question(id: 5, qText: "Какой специалист занимается изучением неопознанных летающих объектов?", qAnswers: ["Кинолог", "Уфолог", "Сексопатолог", "Психиатр"], correctAnswer: "Уфолог", qDifficulty: 1),
]

var qLevelTwo = [
    Question(id: 6, qText: "Как называется разновидность воды, в которой атом водорода замещён его изотопом дейтерием?", qAnswers: ["Лёгкая", "Средняя", "Тяжёлая", "Невесомая"], correctAnswer: "Тяжёлая", qDifficulty: 2),
    Question(id: 7, qText: "Что такое десница?", qAnswers: ["Бровь", "Глаз", "Шея", "Рука"], correctAnswer: "Рука", qDifficulty: 2),
    Question(id: 8, qText: "В какое море впадает река Урал?", qAnswers: ["Азовское", "Чёрное", "Средиземное", "Каспийское"], correctAnswer: "Каспийское", qDifficulty: 2),
    Question(id: 9, qText: "На что кладут руку члены английского общества лысых во время присяги?", qAnswers: ["Баскетбольный мяч", "Бильярдный шар", "Апельсин", "Кокосовый орех"], correctAnswer: "Бильярдный шар", qDifficulty: 2),
    Question(id: 10, qText: "Как назывался каменный монолит, на котором установлен памятник Петру I в Санкт-Петербурге?", qAnswers: ["Дом-камень", "Гром-камень", "Гора-камень", "Разрыв-камень"], correctAnswer: "Гром-камень", qDifficulty: 2),
]

var qLevelTree = [
    Question(id: 11, qText: "Как Пётр Ильич Чайковский назвал свою серенаду для скрипки с оркестром си-бемоль минор?", qAnswers: ["Флегматическая", "Меланхолическая", "Холерическая", "Сангвиническая"], correctAnswer: "Меланхолическая", qDifficulty: 3),
    Question(id: 12, qText: "Какого ордена не было у первого советского космонавта Юрия Гагарина?", qAnswers: ["«Ожерелье Нила» (Египет)", "«Крест Грюнвальда» (Польша)", "«Плайя Хирон» (Куба)", "«Орден двойного дракона» (Китай)"], correctAnswer: "«Орден двойного дракона» (Китай)", qDifficulty: 3),
    Question(id: 13, qText: "Какое животное имеет второе название — кугуар?", qAnswers: ["Оцелот", "Леопард", "Пума", "Пантера"], correctAnswer: "Пума", qDifficulty: 3),
    Question(id: 14, qText: "Что в России 19 века делали в дортуаре?", qAnswers: ["Ели", "Спали", "Ездили верхом", "Купались"], correctAnswer: "Спали", qDifficulty: 3),
    Question(id: 15, qText: "Какой химический элемент назван в честь злого подземного гнома?", qAnswers: ["Гафний", "Кобальт", "Бериллий", "Теллур"], correctAnswer: "Кобальт", qDifficulty: 3),
]
