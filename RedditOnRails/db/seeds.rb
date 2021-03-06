# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.delete_all
Sub.delete_all
Post.delete_all
Comment.delete_all
# UserVote.delete_all

10.times do 
  User.create!(
    username: Faker::Internet.username,
    password: Faker::Internet.password(min_length: 6, max_length:  12)
  )
end



b = User.create(username: 'Brooke', password: 'aloogobiburrito')
c = User.create(username: 'Claire', password: 'mounttamhikes')
s = User.create(username: 'Scott', password: 'handshakes')
q = User.create(username: 'Quinn', password: 'dumbledore')

s1 = Sub.create(title: 'App Academy Drama', description: 'Staff Secrets', moderator_id: c.id)
s2 = Sub.create(title: 'Dogs', description: 'Worse than cats (TM)', moderator_id: s.id)
s3 = Sub.create(title: 'Food', description: 'Always hungry.', moderator_id: q.id)
s4 = Sub.create(title: 'Food1', description: 'Always hungry not.', moderator_id: b.id)


p1 = Post.create(title: 'Who stole my lunch?', user_id: b.id, content: 'No seriously, guys, where is it?', sub_ids:[s1.id,s3.id])
p2 = Post.create(title: 'Reggie the Reject Bear: MISSING', user_id: c.id, content: 'Discovered at 12:35am this morning.', sub_ids:[s1.id])
p3 = Post.create(title: 'Newfoundland/Daschund friendship', user_id: q.id, content: 'Thoughts?', sub_ids: [s2.id])
p4 = Post.create(title: 'Cookies', user_id: s.id, content: 'These are so good! \n http://allrecipes.com/recipe/11032/oatmeal-craisin-cookies/?scale=12&ismetric=0', sub_ids: [s3.id])
p5 =  Post.create(title: 'Curry Up Now', user_id: b.id, content: 'Aloo Gobi Burrito forever <3', sub_ids: [s1.id])


Comment.create(post_id: p1.id, user_id: b.id, body: 'Not me...')
Comment.create(post_id: p2.id, user_id: c.id, body: 'I saw Jeff leaving the building with a large duffel bag last night. Could\'ve been smuggling him out.')
Comment.create(post_id: p3.id, user_id: s.id, body: 'That\'s us!')
Comment.create(post_id: p4.id, user_id: q.id, body: 'Let\'s ask Jordan to make them :)')
Comment.create(post_id: p5.id, user_id: b.id, body: 'Punjabi by Nature burrito forever!')
