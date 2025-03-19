# ========
# Users
# =======

User.create!([
  {
    name: 'Johnny Bravo',
    phone: '11111111111',
    color: "green",
    password: "demons",
  },
  {
    name: 'James Charlie',
    phone: '22222222222',
    color: "blue",
    password: "demons",
  },
  {
    name: 'Juliet Capulet',
    phone: '33333333333',
    color: "red",
    password: "demons",
  },
  {
    name: 'Mike Morano',
    phone: '44444444444',
    color: "saddlebrown",
    password: "demons",
  },
  {
    name: 'Oscar Joshua',
    phone: '55555555555',
    color: "red",
    password: "demons",
  },
  {
    name: 'Papa Shango',
    phone: '66666666666',
    color: "blue",
    password: "demons",
  },
  {
    name: 'Romeo Montague',
    phone: '77777777777',
    color: "saddlebrown",
    password: "demons",
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
  },
  {
    title: 'Highlander Upgrade, 2015 to 2024',
    user_id: 1,
    price: 2500000,
    description: "Complete upgrade kits front and back highlander 2014-2015 upgraded to 2024 VIP face available now.",
  },
  {
    title: 'Tundra 2008-2010-2015 Upgraded to 2024 Like Kits Available',
    user_id: 1,
    price: 15000000,
    description: "Complete upgrade kits front and back Toyota tundra 2024 2025 face available now...",
  },
  {
    title: 'Latest Upgrade Kits for Toyota Highlander 2020-2022 to 2025',
    user_id: 1,
    price: 6000000,
    description: "Latest design upgrade kits Toyota highlander 2020 to 2025 newest design, landcruiser 2025 face for highlander available now.",
  },
])