# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(username: "MildlyConfused", password: 'password', email: "BenZBraunstein@gmail.com", phone: "516-477-8178")
User.create(username: "Yosef", password: 'password', email: "Yolehrer@gmail.com", phone: "917-7301-3162")
User.create(username: "Joe", password: 'password', email: "Joe@gmail.com", phone: "917-310-8021")

Item.create(name: 'iPhone 11', image: 'https://images-na.ssl-images-amazon.com/images/I/41zgaFGlp2L.jpg', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'Sherpa Blanket (Queen)', image: 'https://images-na.ssl-images-amazon.com/images/I/81W7Bf%2B9xHL._SX425_.jpg', category: 'Home', user_id: rand(1..3))

Item.create(name: 'Plastic Cup', image: 'https://images-na.ssl-images-amazon.com/images/I/612IJH9NOeL._SX425_.jpg', category: 'Home', user_id: rand(1..3))

Item.create(name: 'LG Ultrawide Monitor', image: 'https://static.bhphoto.com/images/images2500x2500/1557225507_1348097.jpg', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'Gaming PC', image: 'https://www.cyberpowerpc.com/images/cs/PCO11/cs-193-102.png', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'LG V30', image: 'https://images-na.ssl-images-amazon.com/images/I/51Fluzhj%2B8L._SX569_.jpg', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'Ryzen 3900X', image: 'https://thumbor.forbes.com/thumbor/fit-in/1200x0/filters%3Aformat%28jpg%29/https%3A%2F%2Fblogs-images.forbes.com%2Fantonyleather%2Ffiles%2F2019%2F07%2FMG_88262-1200x1200.jpg', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'Safety Shoes', image: 'https://www.dhresource.com/0x0s/f2-albu-g10-M00-CE-E7-rBVaVlxPtPGAXgTPAAXhfe9agJw060.jpg/men-039-s-indestructible-shoes-mens-safety.jpg', category: 'Clothing', user_id: rand(1..3))

Item.create(name: 'Galax RTX 2080 Ti', image: 'https://m9m3k2m8.stackpathcdn.com/image/cache/catalog/graphics%20card/galax/rtx-2080ti-hof/rtx-2080ti-hof-image-main-600x600.jpg', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'Samsung 970 EVO', image: 'https://www.excaliberpc.com/images/679450_2/large.jpg', category: 'Tech', user_id: rand(1..3))

Item.create(name: 'The Great Gatsby', image: 'https://target.scene7.com/is/image/Target/GUEST_210cc1fd-85b7-4a13-b315-46545a0e86d1?wid=488&hei=488&fmt=pjpeg', category: 'Books', user_id: rand(1..3))

Item.create(name: 'The Catcher in the Rye', image: 'https://i5.walmartimages.com/asr/87dbbbb9-6157-49e5-81b2-2f23eebc05bd_1.4e9b7e403d7de805c15ea1b9b9f96121.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF', category: 'Books', user_id: rand(1..3))

Item.create(name: 'Harry Potter and the Prisoner of Azkaban', image: 'https://i5.walmartimages.com/asr/6203b8f8-2b25-4210-8f86-74bd8f29cad4_1.7fb18bac579090c28ec66e3a28d1c801.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF', category: 'Books', user_id: rand(1..3))

