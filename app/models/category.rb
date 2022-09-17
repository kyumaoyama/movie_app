class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: 'アクション' },
    { id: 2, name: 'SF' },
    { id: 3, name: 'サスペンス' },
    { id: 4, name: 'コメディ' },
    { id: 5, name: '恋愛' },
    { id: 6, name: '戦争' },
    { id: 7, name: 'ホラー' },
    { id: 8, name: 'アニメ' },
    { id: 9, name: 'ファンタジー' },
    { id: 10, name: 'スポーツ' },
    { id: 11, name: 'ファミリー' },
    { id: 12, name: 'ミュージーカル' },
    { id: 13, name: '探偵' },
    { id: 14, name: 'ヤクザ' },
    { id: 15, name: 'パニック' },
    { id: 16, name: '動物' }

  ]

  include ActiveHash::Associations
  has_many :posts
end
