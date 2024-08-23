Post.destroy_all
User.destroy_all


users = []

# 5.times do |n|
#   User.create!(
#     email: "user#{n + 1}@example.com",
#     password: "hogehoge",
#     password_confirmation: "hogehoge"
#   )
# end

# User.all.each do |user|
#   post.create!(
#     title: "`メールアドレス`による`#{n + 1}番目`の投稿です",
#     body: "`メールアドレス`による`#{n + 1}回目`の本文です",
#     created_at: "17:00",
#     contributor: user.email
#   )
# end

5.times do |i|
  users << User.create!(
    email: "user#{i+1}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )
end

users.each do |user|
  5.times do |i|
    Post.create!(
      title: "Sample Post #{i+1} by #{user.email}",
      body: "This is the body of sample post #{i+1} by #{user.email}",
      created_at: Time.now,
      user: user
    )
  end
end
