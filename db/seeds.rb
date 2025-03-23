# ========
# Users
# =======

User.create!([
  {
    name: 'Adeleke Raheem',
    phone: '11111111111',
    color: "green",
    password: "demons",
    location: "Nation-wide",
  },
  {
    name: 'Rahemm Ajiboye',
    phone: '22222222222',
    color: "blue",
    password: "demons",
    location: "Ibadan",
  },
  {
    name: 'Juliet Dedunsin',
    phone: '33333333333',
    color: "red",
    password: "demons",
    location: "Illorin",
  },
  {
    name: 'Luke Chukwudi',
    phone: '44444444444',
    color: "saddlebrown",
    password: "demons",
    location: "Nation-wide",
  },
  {
    name: 'Oscar Hassan',
    phone: '55555555555',
    color: "red",
    password: "demons",
    location: "Ikeja",
  },
  {
    name: 'Odoba Usmond',
    phone: '66666666666',
    color: "blue",
    password: "demons",
    location: "Yaba",
  },
  {
    name: 'Mark Olofu',
    phone: '77777777777',
    color: "saddlebrown",
    password: "demons",
    location: "Abuja",
  },
])

# ========
# Products
# =======

Product.create!([
  {
    title: 'Mercedes-Benz GL-Class GL 450 2012 Gray',
    user_id: 1,
    price: 9500000,
    description: "Mercedes-Benz GL-Class GL 450 2012 Gray. Alloy wheels. Neatly used. Just buy and drive.",
    location: "Surulere",
  },
  {
    title: 'Highlander Upgrade, 2015 to 2024',
    user_id: 2,
    price: 2500000,
    description: "Complete upgrade kits front and back highlander 2014-2015 upgraded to 2024 VIP face available now.",
    location: "Ikeja",
  },
  {
    title: 'Tundra 2008-2010-2015 Upgraded to 2024 Like Kits Available',
    user_id: 3,
    price: 15000000,
    description: "Complete upgrade kits front and back Toyota tundra 2024 2025 face available now...",
    location: "Ogba",
  },
  {
    title: 'Latest Upgrade Kits for Toyota Highlander 2020-2022 to 2025',
    user_id: 1,
    price: 6000000,
    description: "Latest design upgrade kits Toyota highlander 2020 to 2025 newest design, landcruiser 2025 face for highlander available now.",
    location: "Adeniyi Jones",
  },
  {
    title: 'Fat Tyre Giant Bicycle',
    user_id: 2,
    price: 320000,
    description: "26-inch fat tyre giant bicycle for adults.",
    location: "Alausa",
  },
  {
    title: 'Qlink Motorcycle',
    user_id: 3,
    price: 800000,
    description: "Qlink 200cc bike is fuel-economic. Suitable for dispatch and delivery.",
    location: "Dawaki Hillside, Abuja",
  },
  {
    title: "New Qlink XF 200 2013 (Blue)",
    user_id: 1,
    price: 1450000,
    description: 'Brand new Qlink delivery service bike with high engine capacity.',
    location: "Mararaba, Abuja",
  },
  {
    title: "Laptop HP EliteBook 850 G3 8GB Intel Core I5 HDD+SSD 256GB",
    user_id: 4,
    price: 230000,
    description: 'Slick HP Elitebook 850 G3. 8g RAM. 256g SSD. Core i5 6th Gen. Keyboard light. SIM slot. Type C. Excellent battery life. 15.6" screen.',
    location: "Computer Village",
  },
  {
    title: "Brand New Fat Tyre Bicycle (26inch)",
    user_id: 5,
    price: 220000,
    description: 'Brand New Fat Tyre Bicycle (26inch) for adults.',
    location: "ICM Ikeja",
  },
])

# ========
# Product Images
# =======

[
  ["Mercedes-Benz GL-Class GL 450 2012 Gray", "mercedez.webp"],
  ["Highlander Upgrade, 2015 to 2024", "highlander.webp"],
  ["Laptop HP EliteBook 850 G3 8GB Intel Core I5 HDD+SSD 256GB", "hp.webp"],
  ["Latest Upgrade Kits for Toyota Highlander 2020-2022 to 2025", "upgrade.webp"],
  ["Tundra 2008-2010-2015 Upgraded to 2024 Like Kits Available", "tundra.webp"],
  ["Fat Tyre Giant Bicycle", "bike.webp"],
  ["Qlink Motorcycle", "qlink.webp"],
  ["New Qlink XF 200 2013 (Blue)", "qlinks.webp"],
  ["Brand New Fat Tyre Bicycle (26inch)", "hero.webp"],  
].each do |product_title, file_name|
  f = File.open(Rails.root.join("app/assets/images/#{file_name}"))
  p = Product.find_by(title: product_title)
  p.image.attach(io: f, filename: file_name)
  sleep(5.seconds)
end