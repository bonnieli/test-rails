# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

SEED_PW = '123456'

thomas = User.create(username: 'thomas', password: SEED_PW)
santiago = User.create(username: 'santiago', password: SEED_PW)
ashanti = User.create(username: 'ashanti', password: SEED_PW)

# post 1: multi-author
post1 = Post.create(text: 'Excepteur occaecat minim reprehenderit cupidatat dolore voluptate velit labore pariatur culpa esse mollit. Veniam ipsum amet eu dolor reprehenderit quis tempor pariatur labore. Tempor excepteur velit dolor commodo aute. Proident aute cillum dolor sint laborum tempor cillum voluptate minim. Amet qui eiusmod duis est labore cupidatat excepteur occaecat nulla.', 
                    likes: 12,
                    reads: 5,
                    tags: 'food,recipes,baking',
                    popularity: 0.19)


UserPost.create(user_id: santiago.id, post_id: post1.id)

# post 2: single-author
post2 = Post.create(text: 'Ea cillum incididunt consequat ullamco nisi aute labore cupidatat exercitation et sunt nostrud. Occaecat elit tempor ex anim non nulla sit culpa ipsum aliquip. In amet in Lorem ut enim. Consectetur ea officia reprehenderit pariatur magna eiusmod voluptate. Nostrud labore id adipisicing culpa sunt veniam qui deserunt magna sint mollit. Cillum irure pariatur occaecat amet reprehenderit nisi qui proident aliqua.',
                    likes: 104,
                    reads: 200,
                    tags: 'travel,hotels',
                    popularity: 0.7)

UserPost.create(user_id: santiago.id, post_id: post2.id)

# post 3: multi-author
post3 = Post.create(text: 'Voluptate consequat minim commodo nisi minim ut. Exercitation incididunt eiusmod qui duis enim sunt dolor sit nisi laboris qui enim mollit. Proident pariatur elit est elit consectetur. Velit anim eu culpa adipisicing esse consequat magna. Id do aliquip pariatur laboris consequat cupidatat voluptate incididunt sint ea.',
                    likes: 10,
                    reads: 32,
                    tags: 'travel,airbnb,vacation',
                    popularity: 0.7)

UserPost.create(user_id: santiago.id, post_id: post3.id)
UserPost.create(user_id: ashanti.id, post_id: post3.id)

#  post 4: single-author
post4 = Post.create(text: 'This is post 4',
                    likes: 50,
                    reads: 300,
                    tags: 'vacation,spa',
                    popularity: 0.4)
UserPost.create(user_id: ashanti.id, post_id: post4.id)

# other users with no posts
User.create(username: 'julia', password: SEED_PW)
User.create(username: 'cheng', password: SEED_PW)
