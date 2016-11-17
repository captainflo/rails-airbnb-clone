Category.destroy_all
Vehicle.destroy_all
  Category.create(name: "Car")
  Category.create(name: "Motorbike")
  Category.create(name: "Boat")
  Category.create(name: "Van")
10.times do
  vec = [
    {"Ferrari" => "http://pictures.topspeed.com/IMG/crop/201611/ferrari-looking-to-r_800x0w.jpg" },
    {"Renault" => "http://images.caradisiac.com/logos-ref/gamme/gamme--renault-twingo/S5-gamme--renault-twingo.jpg" },
    {"Peugeot" => "http://www.telegraph.co.uk/content/dam/motoring2/2015/12/03/1-peugeot-108-main-image-xlarge_trans++ZgEkZX3M936N5BQK4Va8RQJ6Ra64K3tAxfZq0dvIBJw.jpg" },
    {"Alfa" => "http://www.largus.fr/images/images/alfa-giulia-quadrifoglio-09.jpg" },
    {"Porcshe" => "http://www.telegraph.co.uk/cars/images/2016/01/09/Porsche-Boxster-Spyder-front-xlarge_trans%2B%2BB1FoUxnpzDgOvWx5yBOTWenjwzLTge-EHCkJ66RZ6Cg.jpg" },
  ].sample
  vehicle = Vehicle.new(marque: vec.keys.first ,
   description: Faker::Lorem.paragraph, user: User.all.sample,
    category: Category.all.sample, city: ["Bordeaux", "Lille", "Marseille", "La Rochelle"].sample)
  vehicle.remote_photo_url = vec.values.first
  vehicle.save
  sleep(0.5)
end
Vehicle.all.each do |veh|
  5.times do
    veh.reservations.create(user: User.all.sample, rating: rand(0..5))
  end
end
