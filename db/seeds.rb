# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  Experience.create(name: 'Ibirapuera', description: 'Ibirapuera', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/A_chuva_a_tarde_Parque_Ibirapuera_1.JPG/640px-A_chuva_a_tarde_Parque_Ibirapuera_1.JPG', sponsored: false)
  Experience.create(name: 'Mercado Municipal', description: 'Mercado Municipal', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Mercado_Municipal_SP.jpg/640px-Mercado_Municipal_SP.jpg', sponsored: true)
  Experience.create(name: 'Santos', description: 'Santos', image_url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/SANTOS_PRAIA_DE_PIRU%C3%8D_BAHIA_2.JPG/640px-SANTOS_PRAIA_DE_PIRU%C3%8D_BAHIA_2.JPG', sponsored: false)
  Experience.create(name: 'Sí Señor!', description: 'Sí Señor!', image_url: '	https://cdn.pixabay.com/photo/2017/06/29/20/09/mexican-2456038_960_720.jpg', sponsored: true)  
end

if Rails.env.production?
  AdminUser.create!(email: 'admin@fui.com', password: 'password', password_confirmation: 'password')
end
