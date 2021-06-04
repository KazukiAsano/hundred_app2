require 'csv'

namespace :import_csv do
  desc "Userデータをインポートするタスク"
  task users: :environment do
    User.transaction do
      path = "db/csv_data/user.csv"
      CSV.foreach(path, headers: true) do |row|
        # nilだとfileopenhはエラーが出る
        file = File.open("public/images/#{row['user_image']}") if row['user_image'].present?
        User.create!(
          id: row["id"],
          email: row["email"],
          password: row["password"],
          name: row["name"],
          user_image: file,
          favoshop: row["favoshop"])
      end
    end
  end
  desc "Postデータをインポートするタスク"
  task posts: :environment do
    path = "db/csv_data/post.csv"
    Post.transaction do
      CSV.foreach(path, headers: true) do |row|
        file = File.open("public/images/#{row['image']}") if row['image'].present?
          Post.create!(
            id: row["id"],
            name: row["name"],
            comment: row["comment"],
            shop_name: row["shop_name"],
            rate: row["rate"],
            genre: row["genre"],
            image: file,
            user_id: row["user_id"],
            purchase_num: row["purchase_num"])
      end
    end
  end
  desc "Reviewデータをインポートするタスク"
  task reviews: :environment do
    path = "db/csv_data/review.csv"
    # imageがないため、カラム一つずづ投入の必要なし
    Review.transaction do
      CSV.foreach(path, headers: true) do |row|
        Review.create!(row.to_h)
      end
    end
  end
end