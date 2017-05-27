
User.create(nickname: "Stan", email: "stan@gmail.com", password: "123", password_confirmation: "123", first_name: "Stan", last_name: "Smith")
User.create(nickname: "Roger", email: "roger@gmail.com", password: "123", password_confirmation: "123", first_name: "Roger", last_name: "Brown")
User.create(nickname: "Alice", email: "alice@gmail.com", password: "123", password_confirmation: "123", first_name: "Alice", last_name: "Green")
User.create(nickname: "Mary", email: "mary@gmail.com", password: "123", password_confirmation: "123", first_name: "Mary", last_name: "Poppins")
User.create(nickname: "Nancy", email: "nancy@gmail.com", password: "123", password_confirmation: "123", first_name: "Nancy", last_name: "Jackson")
User.create(nickname: "Josh", email: "josh@gmail.com", password: "123", password_confirmation: "123", first_name: "Josh", last_name: "Merlin")
User.create(nickname: "Barry", email: "barry@gmail.com", password: "123", password_confirmation: "123", first_name: "Barry", last_name: "Allen")
User.create(nickname: "Felicity", email: "felicity@gmail.com", password: "123", password_confirmation: "123", first_name: "Felicity", last_name: "Smoke")

Chatroom.create(owner: User.first, title: "Lets go to a cinema tonight")
UserChatroom.create(chatroom: Chatroom.first, user: User.all[1])
UserChatroom.create(chatroom: Chatroom.first, user: User.all[2])
UserChatroom.create(chatroom: Chatroom.first, user: User.all[3])
UserChatroom.create(chatroom: Chatroom.first, user: User.all[4])
Message.create(chatroom: Chatroom.first, user: User.all[0], content: "Hi Guys!")
Message.create(chatroom: Chatroom.first, user: User.all[1], content: "Hi!")
Message.create(chatroom: Chatroom.first, user: User.all[2], content: "Hi!")
Message.create(chatroom: Chatroom.first, user: User.all[3], content: "Hello!")
Message.create(chatroom: Chatroom.first, user: User.all[0], content: "What do you think about cinema tonight?")
Message.create(chatroom: Chatroom.first, user: User.all[1], content: "It would be awesome")
Message.create(chatroom: Chatroom.first, user: User.all[0], content: "I wanted to watch Split :)")
Message.create(chatroom: Chatroom.first, user: User.all[2], content: "Yeah, I haven't seen it too")
Message.create(chatroom: Chatroom.first, user: User.all[0], content: "Ok, I've added some cinemas which I really like")
s1 = Suggestion.create(chatroom: Chatroom.first, user: User.first, title: "Sunshine Cinema", place_id_google: "ChIJY0PJboRZwokR07zrsDqd39k")
s2 = Suggestion.create(chatroom: Chatroom.first, user: User.first, title: "Village East Cinema", place_id_google: "ChIJy_q2gZ5ZwokRrG27bv1NgtU")
s3 = Suggestion.create(chatroom: Chatroom.first, user: User.all[2], title: "Quad Cinema", place_id_google: "ChIJcwBe65dZwokRkYIyxD42ge0")
s4 = Suggestion.create(chatroom: Chatroom.first, user: User.all[3], title: "Nitehawk Cinema", place_id_google: "ChIJMza4HWFZwokREyXlhbnRf5E")
s1.add_evaluation(:votes, 1, User.first)
s1.add_evaluation(:votes, 1, User.all[1])
s2.add_evaluation(:votes, 1, User.all[2])
s3.add_evaluation(:votes, 1, User.all[3])
s4.add_evaluation(:votes, 1, User.all[4])

Chatroom.create(owner: User.all[6], title: "Choosing bar for birthday celebration")

UserChatroom.create(chatroom: Chatroom.last, user: User.all[5])
UserChatroom.create(chatroom: Chatroom.last, user: User.all[7])
UserChatroom.create(chatroom: Chatroom.last, user: User.all[0])
Message.create(chatroom: Chatroom.last, user: User.all[6], content: "Hey guys how are you?")
Message.create(chatroom: Chatroom.last, user: User.all[5], content: "Good! You?")
Message.create(chatroom: Chatroom.last, user: User.all[6], content: "Great! I'm excited about our celebration! :)")
