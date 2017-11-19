# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

if Rails.env.production?
  AdminUser.create!(email: 'admin@fui.com', password: 'password', password_confirmation: 'password')
end

Experience.create(name: 'Ibirapuera', description: 'Ibirapuera', image_url: 'https://i.imgur.com/PaCf4Il.jpg', sponsored: false)
Experience.create(name: 'Mercado Municipal', description: 'Mercado Municipal', image_url: 'https://i.imgur.com/0fVLQ12.jpg', sponsored: true)
Experience.create(name: 'Santos', description: 'Santos', image_url: 'https://i.imgur.com/Aj7iezN.jpg', sponsored: false)
Experience.create(name: 'Sí Señor!', description: 'Sí Señor!', image_url: 'https://cdn.pixabay.com/photo/2017/06/29/20/09/mexican-2456038_960_720.jpg', sponsored: true)
Experience.create(name: 'Guarujá', description: 'Guarujá', image_url: 'https://i.imgur.com/hJQEmuN.jpg', sponsored: false)
Experience.create(name: 'Tex - Redneck Bar', description: 'Tex - Redneck Bar', image_url: 'https://imagesapt.apontador-assets.com/fit-in/640x480/4815b65cc2dc49b995e7e1ce1af71623/tex-redneck-bar.jpg', sponsored: false)
Experience.create(name: 'Temakeria Paulista', description: 'Temakeria Paulista', image_url: 'https://upload.wikimedia.org/wikipedia/commons/e/ed/Natto_temakizushi_by_nattokun_in_Honolulu.jpg', sponsored: false)
Experience.create(name: 'Praça do Pôr do Sol', description: 'Praça do Pôr do Sol', image_url: 'https://oba.portal5g-media.com/contentFiles/image/opt_w840h0/praca-por-do-sol-sao-paulo-editada.jpg', sponsored: false)
Experience.create(name: 'Lellis Trattoria', description: 'Lellis Trattoria!', image_url: 'https://media-cdn.tripadvisor.com/media/photo-s/05/0c/b5/b0/lellis-tratoria.jpg', sponsored: false)
