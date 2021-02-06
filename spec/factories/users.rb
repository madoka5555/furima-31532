FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name }
    end
    nickname              { Faker::JapaneseMedia::SwordArtOnline.game_name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Alphanumeric.alphanumeric(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { gimei.first.kanji }
    last_name             { gimei.last.kanji }
    first_name_katakana   { gimei.first.katakana }
    last_name_katakana    { gimei.last.katakana }
    birthday              { Faker::Date.birthday }
  end
end
