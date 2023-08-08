//
//  NewlyCoinedKeyword.swift
//  NewlyCoinedKeyword
//
//  Created by walkerhilla on 2023/07/21.
//

import Foundation

/// 신조어 키워드 모델
struct NewlyCoinedKeyword {
  let name: String
  let description: String
}

// 신조어 데이터 전역 변수
let newlyCoinedKeywords: [NewlyCoinedKeyword] = [
  NewlyCoinedKeyword(name: "쫌쫌따리", description: "아주 조금씩 하찮은 양을 모으는 모습"),
  NewlyCoinedKeyword(name: "억텐", description: "억지 텐션의 줄임말\n억지로 텐션을 올려서 발랄하게 행동할 때"),
  NewlyCoinedKeyword(name: "스불재", description: "스스로 불러온 재앙의 줄임말\n자신이 계획한 일로 자신이 고통을 받을 때 씀."),
  NewlyCoinedKeyword(name: "좋댓구알", description: "좋아요, 댓글, 구독, 알림 설정의 줄임말\n유튜브에서 동영상 보는 사람들이 할 수 있는 네 가지"),
  NewlyCoinedKeyword(name: "어쩔티비", description: "어쩌라고 가서 TV나 봐라라는 뜻\n'저쩔티비'나 '어쩔' 뒤에 전자제품을 붙여 맞받아치면 됨."),
  NewlyCoinedKeyword(name: "갓생", description: "갓(God) + 생(인생 생), 부지런하고 열심히 사는 사람에게 쓰는 말"),
  NewlyCoinedKeyword(name: "점메추", description: "점심 메뉴 추천"),
  NewlyCoinedKeyword(name: "다꾸", description: "다이어리 꾸미기\n자매품으로 위꾸(위장 꾸미기), 뇌꾸(뇌 꾸미기) 등이 있음"),
  NewlyCoinedKeyword(name: "킹받다", description: "열받다라는 뜻\n킹(King)을 붙여 강조함\n자매품으로 갇은 뜻인 킹받드라슈가 있음"),
  NewlyCoinedKeyword(name: "군싹", description: "군침이 싹도네의 줄임말로 뽀로로 루피짤과 세트로 유명해짐"),
  NewlyCoinedKeyword(name: "멍청비용", description: "쓰지 않아도 됐을 돈이나 시간을 소비했을 때 이를 표현하는 말"),
  NewlyCoinedKeyword(name: "갈비", description: "갈수록 비호감의 줄임말"),
  NewlyCoinedKeyword(name: "돼지런하다", description: "먹을 때만 부지런하게 먹는 사람을 말한다."),
  NewlyCoinedKeyword(name: "누물보", description: "누구 물어본 사람?의 줄임말"),
  NewlyCoinedKeyword(name: "내또출", description: "내일 또 출근의 줄임말"),
  NewlyCoinedKeyword(name: "슬세권", description: "슬리퍼처럼 편한 복장으로 나다닐 수 있는 범위의 생활권역을 지칭"),
  NewlyCoinedKeyword(name: "복세편살", description: "복잡한 세상 편하게 살자의 줄임말, 스스로 원하는 방식으로 즐겁게 살겠다는 의미"),
  NewlyCoinedKeyword(name: "조삼모사", description: "조금 모르면 3번, 완전 모르면 4번이라는 뜻"),
]
