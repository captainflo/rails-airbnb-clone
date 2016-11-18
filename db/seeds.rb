Category.destroy_all
Vehicle.destroy_all
Review.destroy_all
Reservation.destroy_all

Category.create(name: "Car")
Category.create(name: "Motorbike")
Category.create(name: "Boat")
Category.create(name: "Van")

10.times do
  tete = ["http://1ofdmq2n8tc36m6i46scovo2e.wpengine.netdna-cdn.com/wp-content/uploads/2014/04/Steven_Hallam-slide.jpg",
    "https://addons.cdn.mozilla.net/user-media/userpics/0/0/45.png?modified=1447324257",
    "http://chiefexperienceofficer.com/images/Eric_Gould_Bear_User_Interface_Patent_Expert_Witness.png",
    "https://cdn.pixabay.com/photo/2014/04/02/17/07/user-307993_640.png"
  ]
  user = User.new(first_name: Faker::Internet.user_name, last_name: Faker::Company.name, phone_number: "165846546582", password: "123456", password_confirmation: "123456" )
  user.remote_avatar_url = tete.sample
  user.save
end

4.times do
  vec = [
    {"Ferrari" => "http://pictures.topspeed.com/IMG/crop/201611/ferrari-looking-to-r_800x0w.jpg" },
    {"Renault" => "http://images.caradisiac.com/logos-ref/gamme/gamme--renault-twingo/S5-gamme--renault-twingo.jpg" },
    {"Peugeot" => "http://www.telegraph.co.uk/content/dam/motoring2/2015/12/03/1-peugeot-108-main-image-xlarge_trans++ZgEkZX3M936N5BQK4Va8RQJ6Ra64K3tAxfZq0dvIBJw.jpg" },
    {"Alfa" => "http://www.largus.fr/images/images/alfa-giulia-quadrifoglio-09.jpg" },
    {"Porcshe" => "http://www.telegraph.co.uk/cars/images/2016/01/09/Porsche-Boxster-Spyder-front-xlarge_trans%2B%2BB1FoUxnpzDgOvWx5yBOTWenjwzLTge-EHCkJ66RZ6Cg.jpg" },
    ].sample
    vehicle = Vehicle.new(marque: vec.keys.first ,
     description: Faker::Lorem.paragraph, user: User.all.sample,
     category: Category.first, city: ["Bordeaux", "Lille", "Marseille", "La Rochelle"].sample)
    vehicle.remote_photo_url = vec.values.first
    vehicle.save
    sleep(0.5)
  end

  4.times do
    vec = [
      {"600 CBR" => "http://www.motoplanete.com/honda/zoom-700px/honda-CBR-600-RR-2016-700px.jpg" },
      {"600 Hornett" => "http://www.motoplanete.com/honda/600-hornet-CBF-2002.jpg" },
      {"250 ktm" => "http://www.moto-station.com/ttesimages/motodivers/nouveautes2013/Essai_KTM_250_SX-F_2013/KTM_250_SX-F_2013_st1pz.jpg" },
      {"1200 Hayabusa" => "http://www.suzuki-moto.com/sites/default/files/styles/845x524/public/public/coloris/haya.16.bigblc.jpg?itok=VdLp-284" },
      {"125 Cr" => "http://www.motoverte.com/article/article/pour-une-occasion-il-faut-etre-tres-mefiant-au-niveau-moteur-pour-une-moto-anterieure-a-2004--20903-1-v4zoom.jpg" },
      ].sample
      vehicle = Vehicle.new(marque: vec.keys.first ,
       description: Faker::Lorem.paragraph, user: User.all.sample,
       category: Category.all[1], city: ["Bordeaux", "Lyon", "Marseille", "La Rochelle"].sample)
      vehicle.remote_photo_url = vec.values.first
      vehicle.save
      sleep(0.5)
    end

    4.times do
    vec = [
      {"Beneteau Barracuda 9" => "http://www.bateaux-essais.com/wp-content/blogs.dir/5/files/beneteau-barracuda-9-essai/beneteau-barracuda-9-6.jpg" },
      {"Quicksilver-Activ 675" => "http://www.bateaux-essais.com/wp-content/blogs.dir/5/files/quicksilver-activ-675-open/1.jpg" },
      {"Four Winns-V 305" => "http://www.bateaux-essais.com/wp-content/blogs.dir/5/files/four-winns-v305-ga/four-winns.jpg" },
      {"Quicksilver-Activ 535" => "http://www.bateaux-essais.com/wp-content/blogs.dir/5/files/quicksilver-activ-535-open/1.jpg" },
      ].sample
      vehicle = Vehicle.new(marque: vec.keys.first ,
       description: Faker::Lorem.paragraph, user: User.all.sample,
       category: Category.all[2], city: ["Bordeaux", "Lyon", "Clermont ferrand", "La Rochelle"].sample)
      vehicle.remote_photo_url = vec.values.first
      vehicle.save
      sleep(0.5)
    end

    4.times do
    vec = [
      {"Itineo MB740" => "https://img4.leboncoin.fr/ad-image/c51b3bc404e3efb7b5efb8df4c42b9c4cb8092de.jpg" },
      {"Intégral AUTOSTAR I690LC" => "https://img0.leboncoin.fr/ad-image/2a0254415c944e2766c4e50daba28d8fa09d0e7f.jpg" },
      {"AUTOSTAR I650LC" => "https://img2.leboncoin.fr/ad-image/7c7e64692c39df44bd6a1bb1c4569d6748aa20e5.jpg" },
      {"Pilote Pacific 746C" => "https://img4.leboncoin.fr/ad-image/76052c42075eb9cd2e31e8d4c8fdcec4217fba38.jpg" },
      ].sample
      vehicle = Vehicle.new(marque: vec.keys.first ,
       description: Faker::Lorem.paragraph, user: User.all.sample,
       category: Category.last, city: ["Bordeaux", "Lyon", "Clermont ferrand", "La Rochelle"].sample)
      vehicle.remote_photo_url = vec.values.first
      vehicle.save
      sleep(0.5)
    end


    Vehicle.all.each do |veh|
      5.times do
        veh.reservations.create(user: User.all.sample, rating: rand(0..5))
      end
    end
