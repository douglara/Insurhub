# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if InsuranceCategory.all.count == 0
  InsuranceCategory.create([
    { name: 'Bicycle' },
    { name: 'Smartphone' },
    { name: 'Car' },
    { name: 'House' },
    { name: 'Rental' },
    { name: 'Business' },
    { name: 'Health care'},
    ])
end


if InsuranceProgram.all.count == 0
  InsuranceProgram.create([
    { name: 'Souride', description: 'Ride carefree. All insurance on the market in one place!', insurance_category: InsuranceCategory.find_by_name('Bicycle'), link_url: 'https://www.souride.com', image_url: 'https://www.souride.com/assets/img/logo-azul.png', created_at: DateTime.now - rand(1..10).days },
    { name: 'altumAI', description: "altumAI's futureWork real-time risk prevention solution includes; smarter data, easy-to-use incident reporting, continuous training, and consistent communication accessible at workers' fingertips for better loss control.", insurance_category: InsuranceCategory.find_by_name('Business'), link_url: 'https://altumai.com/', image_url: 'https://icrowdnewswire.com/wp-content/uploads/2020/06/4054-download.png', created_at: DateTime.now - rand(1..10).days },
    { name: 'bikeradar', description: "Having a bike stolen, breaking components in a crash or having to cancel a race sucks – cycling insurance can help take the sting out of these eventualities, and more.",  insurance_category: InsuranceCategory.find_by_name('Bicycle'), link_url: 'https://altumai.com', image_url: 'https://thumborcdn.acast.com/464Aq2PkFLxFHUwRg7C0TpiOuvk=/1500x1500/https://mediacdn.acast.com/assets/8ed8adfa-6342-4db0-a0d1-e9a2b4d86f53/-k35pc28f-br_main_logo_v_2.png', created_at: DateTime.now - rand(1..10).days },
    { name: 'Everguard', description: 'We incorporate ultra-accurate and reliable wearables with computer vision, machine learning and AI to provide a real-time platform to improve productivity and safety.',  insurance_category: InsuranceCategory.find_by_name('Business'), link_url: 'https://www.everguard.ai/', image_url: 'https://mir-s3-cdn-cf.behance.net/project_modules/disp/e6380b11333671.560f5f65af069.png', created_at: DateTime.now - rand(1..10).days },
    { name: 'k2dealer', description: 'Garage and Dealers Insurance Solutions Managing General Agency K2 Specialty Dealer Insurance provides agency retailers with comprehensive coverage, underwriting expertise, distribution and in-house claims handling in the Garage and Dealers niche market.',  insurance_category: InsuranceCategory.find_by_name('Business'), link_url: 'https://www.k2dealer.com/', image_url: 'https://www.k2dealer.com/wp-content/uploads/2021/05/Logo.png', created_at: DateTime.now - rand(1..10).days },
    { name: 'Vital', description: 'The Better Health Cover All-Inclusive. Affordable. Personalized. Rewarding.', insurance_category: InsuranceCategory.find_by_name('Health care'), link_url: 'https://getvital.in', image_url: 'https://images.getvital.in/vital-homepage/vitallogo.svg' },
    ])
end
