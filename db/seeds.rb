# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

matt = User.create(name: "Matt Faircloth", email: "faircloth.matthew@gmail.com", phone: "7577144161", profile_image_url: "xxx")
kyra = User.create(name: "Kyra Rosow", email: "krosow1@gmail.com", phone: "9145845275", profile_image_url: "xxx")
chris = User.create(name: "Chris DeMella", email: "cdemella@vcu.com", phone: "7574032492", profile_image_url: "xxx")
ryan = User.create(name: "Ryan Bures", email: "rbures1@gmail.com", phone: "7573397366", profile_image_url: "xxx")
morris = User.create(name: "Bryan Morris", email: "morrisvt7@gmail.com", phone: "7576475614", profile_image_url: 'xxx')

workout1 = Workout.create(start_time: "7:00AM", date: "3/20/17", activity: "Run", address: "34th and East River", latitude: 40.743277, longitude: -73.972294, distance: 5, pace: "8:30", user_id: 2)
workout2 = Workout.create(start_time: "6:30AM", date: "4/1/17", activity: "Run", address: "59th and 5th Avenue", latitude: 40.764411, longitude: -73.973064, distance: 10, pace: "10:45", user_id: 3)
workout3 = Workout.create(start_time: "8:00PM", date: "3/5/17", activity: "Run", address: "1 Centre Street", latitude: 40.712671, longitude: -74.004013, distance: 2, pace: "7:00", user_id: 5)

matt.workouts << workout1
matt.workouts << workout3
kyra.workouts << workout2

matt.friends << kyra
matt.friends << chris

kyra.friends << matt
kyra.friends << chris
kyra.friends << ryan

chris.friends << matt
chris.friends << kyra

morris.friends << ryan
