//
//  Book.swift
//  BOOKWARM
//
//  Created by walkerhilla on 2023/07/31.
//

import Foundation

struct Book {
  let title: String
  let desc: String
  let price: Int
  let bookImage: URL?
  let rate: Double
  var like: Bool
}

class BookInfo {
  static var bookData: [Book] = [
    Book(title: "혼자 공부하는 머신러닝+딥러닝", desc: "이 책은 수식과 이론으로 중무장한 머신러닝, 딥러닝 책에 지친 ‘독학하는 입문자’가 ‘꼭 필요한 내용을 제대로’ 학습할 수 있도록 구성했다.", price: 23400, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791162243664.jpg"), rate: 9.77, like: false),
    Book(title: "혼자 공부하는 컴퓨터 구조+운영체제", desc: "이 책은 독학으로 컴퓨터 구조와 운영체제를 배우는 입문자가 ‘꼭 필요한 내용을 제대로 학습’할 수 있도록 구성했다.", price: 25200, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791162243091.jpg"), rate: 9.7, like: false),
    Book(title: "된다! 하루 만에 끝내는 챗GPT 활용법", desc: "누구나 챗GPT에게 쉽게 질문할 수 있지만 질문하는 요령을 배우면 차원이 다른 답변을 받습니다. 저자의 활동명이 ‘프롬프트 크리에이터’인 것은 바로 질문의 기술이 남다르기 때문입니다.", price: 14850, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791163034773.jpg"), rate: 10, like: false),
    Book(title: "가상 면접 사례로 배우는 대규모 시스템 설계 기초", desc: "“페이스북의 뉴스 피드나 메신저,유튜브, 구글 드라이브 같은 대규모 시스템은 어떻게 설계할까?” IT 경력자라도 느닷없이 대규모 시스템을 설계하려고 하면 막막하다고 느낄 수 있다.", price: 21600, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788966263158.jpg"), rate: 9.86, like: false),
    Book(title: "캐글 메달리스트가 알려주는 캐글 노하우", desc: "국내 캐글 실력자 8명이 모였다. 직접 참가한 대회를 소개하고, 시작부터 제출까지 전 과정을 생생하게 담아 냈다.", price: 30600, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791140705290.jpg"), rate: 10, like: false),
    Book(title: "챗GPT로 대화하는 기술", desc: "챗GPT는 전문가의 전유물이었던 알파고나 업무에 활용하기엔 부족했던 AI 스피커와는 다르다. 누구나 무료로 사용할 수 있고, 자연스러운 대화로부터 실속 있는 결과를 도출할 수 있다는 점에서 그", price: 16020, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791169211079.jpg"), rate: 9.46, like: false),
    Book(title: "소프트웨어 테스트 전문가(CSTS) 가이드", desc: "소프트웨어 테스트 전문가(CSTS) 가이드』는 〈테스트 개요〉, 〈테스트 설계기법〉, 〈테스트 프로세스〉, 〈SW테스트 전문가(CSTS) 자격시험 예제〉를 수록하고 있는 책이다.", price: 33000, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791156008569.jpg"), rate: 9.64, like: false),
    Book(title: "클린 아키텍처: 소프트웨어 구조와 설계의 원칙", desc: "“살아있는 전설이 들려주는 실용적인 소프트웨어 아키텍처 원칙” 소프트웨어 아키텍처의 보편 원칙을 적용하면 소프트웨어 수명 전반에서 개발자 생산성을 획기적으로 끌어올릴 수 있다.", price: 26100, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788966262472.jpg"), rate: 9.67, like: false),
    Book(title: "한 권으로 읽는 컴퓨터 구조와 프로그래밍", desc: "컴퓨터는 어떻게 동작하며, 컴퓨터 프로그래밍이란 무엇인가? 개발자가 되기 위해 프로그래밍을 배우는 것은 단지 시작일 뿐이다!", price: 31500, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791189909284.jpg"), rate: 9.24, like: false),
    Book(title: "리얼-타임 렌더링 4/e", desc: "고품질 3D 영상을 실시간으로 렌더링하는 과정에서 필요한 이론과 실무에 관한 내용을 모두 담고 있다. 그래픽스 엔지니어링 분야에서 매우 유용한 기술과 실용적인 지식을 제공한다.", price: 79200, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791161757728.jpg"), rate: 0.0, like: false),
    Book(title: "시스템 소프트웨어 개발을 위한 Arm 아키텍처의 구조와 원리", desc: "친절한 선배 개발자가 Arm 아키텍처에 대해 꼼꼼하게 알려주듯, Arm 아키텍처(Armv8-A, Armv7-A) 아키텍처를 쉽고 친절하게 설명합니다! ", price: 43200, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791158394349.jpg"), rate: 10, like: false),
    Book(title: "밑바닥부터 시작하는 딥러닝", desc: "밑바닥부터 시작하는 딥러닝』은 라이브러리나 프레임워크에 의존하지 않고, 딥러닝의 핵심을 ‘밑바닥부터’ 직접 만들어보며 즐겁게 배울 수 있는 본격 딥러닝 입문서다.", price: 21600, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9788968484636.jpg"), rate: 9.58, like: false),
    Book(title: "MLOps 실전 가이드", desc: "이 책은 MLOps와 DevOps의 개념을 종합적으로 이해하고, 깊이 있는 학습을 돕기 위해 다양한 실습을 포함하고 있습니다.", price: 36000, bookImage: URL(string: "https://contents.kyobobook.co.kr/sih/fit-in/300x0/pdt/9791169211215.jpg"), rate: 10, like: false),
  ]
  
  static var dataCount: Int {
    self.bookData.count
  }
}
