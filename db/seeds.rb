# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Like.destroy_all
Comment.destroy_all
Post.destroy_all
Profile.destroy_all


users = User.create!([
  {
    username: "tom", 
    email: "tom@example.com",
    password: "123456",
    profile_attributes: {
        department: "Engineering",
        intro: "I want to be an engineer after graduation."
       }
  },
  {
    username: "jerry", 
    email: "jerry@example.com",
    password: "123456",
    profile_attributes: {
         department: "Health Science",
         intro: "I want to make more friends on the platform:)"
      }
  },
  {
    username: "alice", 
    email: "alice@example.com",
    password: "123456",
    profile_attributes: {
          department: "Literature",
          intro: "Interested in reading different kinds of books."
       }
  },
  {
    username: "jennie",
    email: "jennie@example.com",
    password: "password",
    profile_attributes: {
           department: "Arts",
           intro: "a big fan of detective films"
       }
   }
])


posts = Post.create!([
  {
    user: users[0], title: "Weekend movie partner wanted", content: "I’m planning to watch Zootopia this Saturday. Anyone interested?"
  },
  {
    user: users[1], title: "Looking for badminton partner", content: "Beginner-friendly games. Let's play and improve together!"
  },
  {
    user: users[2], title: "Toronto carpool", content: "I want to go to the Toronto this Friday. Is there anyone who wants to carpool?"
  },
  {
    user: users[0], title: "Looking for study partners", content: "I plan to enroll in the class ENG500 next term. Who also attends this class? We can connect!"
  }
])

comments = Comment.create!([
  {
    user: users[2], post: posts[0], content: "I am also interested in this movie!"
  },
  {
    user: users[0], post: posts[1], content: "I want to participate."
  },
  {
    user: users[3], post: posts[1], content: "Count me in!"
  }
])

likes = Like.create!([
  {
    user: users[0], post: posts[1]
  },
  {
    user: users[1], post: posts[0]
  },
  {
    user: users[2], post: posts[0]
  },
  {
    user: users[3], post: posts[2]
  }
])
