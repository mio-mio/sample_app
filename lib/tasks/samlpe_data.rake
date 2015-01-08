namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Example User",
                 email: "example@railstutorial.jp",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|                                                                             # 99回繰り返し（ユーザーをいっぱい用意する）
      name  = Faker::Name.name                                                        ## ダミーデータの取得
      email = "example-#{n+1}@railstutorial.jp"
      password  = "password"
      User.create!(name: name,                                                            ## 取得したデータでユーザー作成
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)                                                                # ユーザデータを６人分まで取得
    50.times do                                                                                   # 50回繰り返し（ポストを50個用意する）
      content = Faker::Lorem.sentence(5)                                            ## ダミーデータ取得
      users.each { |user| user.microposts.create!(content: content) }    ## 取得したユーザそれぞれでダミーデータのポストを作成
    end
  end
end