# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

sc = Showcase.create!(title: "Título", subtitle: "Subtítulo", phrase: "pequena frase")
sc.image = Rails.root.join("app/assets/images/morro_santa_teresa.jpg").open 
sc.save!

TheEvent.create!(title: "O Evento", days: "02 a 03", mounth: "Janeiro", 
    locality:"Porto Alegre",
    content: "Lorem ipsum dolor sit amet,
    consectur adipiscing elit. Praesent
    nunc elit, feugiat et tellus quis,
    luctus interd.")

Airfare.create!(title: "Compre sua Passagem aérea aqui", phrase: "Confira os melhores preços")

ts = TheSpeaker.create!(title: "Os palestrantes", 
    description: "Lorem ipsum dolor sit amet,
    consectur adipiscing elit. Praesent
    nunc elit, feugiat et tellus quis,
    luctus interd.")
ts.image = Rails.root.join("app/assets/images/parque_farroupilha1.jpg").open
ts.save!

en = EventNotice.create!(title: "Editais do Evento",
    content: "Lorem ipsum dolor sit amet,
    consectur adipiscing elit. Praesent
    nunc elit, feugiat et tellus quis,
    luctus interd.")
en.image = Rails.root.join("app/assets/images/parque_farroupilha2.jpg").open
en.save!

mv = MerchandisingVideo.create!(title: "Conheça a Revolução")
mv.video = Rails.root.join("app/assets/images/sample.mp4").open
mv.save!

EventRealizersTitle.create!(title: "Realizadores do Evento")

4.times do
    e = EventRealizer.create!(image: "enec2019.png" , name:"A FENEC",
        description: "Lorem ipsum dolor sit amet,
        consectur adipiscing elit. Praesent
        nunc elit, feugiat et tellus quis,
        luctus interd.", link: "www.google.com" )
    e.image = Rails.root.join("app/assets/images/enec2019.png").open
    e.save!
end

SponsorsAndSupportersTitle.create!(title: "Patrocinadores e Apoiadores")
5.times do
    ss = SponsorsAndSupporter.create!(image: "patrocinador.png", link: "www.google.com")
    ss.image = Rails.root.join("app/assets/images/patrocinador.png").open
    ss.save!
end

Lot.create!(name:"1º Lote Com Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"1º Lote Com Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"1º Lote Sem Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"1º Lote Sem Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote Com Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote Com Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote Sem Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote Sem Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote Com Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote Com Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote Sem Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote Sem Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote Com Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote Com Hospedagem Não Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote Sem Hospedagem Federado", description: "", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote Sem Hospedagem Não Federado", description: "", value:"200", status:"Ativo")


Ies.create!(name:"UFF - Universidade Federal Fluminense", city:"Niterói")
User.create!(email: "admin@admin.com", password:"123456",admin: true)

us = User.create!(name:"teste da silva", telephone:"2199588584", email: "teste@teste.com" ,password: "111111",
    admin: false ,lot_id: "1", delegation: "IN Junior", cpf: "18182888234", rg: "319877367", rg_issuing_body: "detran-rj",
    birth_date: "Mon, 10 Dec 2018 23:40:30 UTC +00:00", gender:"Masculino", address:"avenida teste, numero teste", city: "Rio de janeiro",
    state: "Rio de Janeiro", course: "Sistemas de Informação", period: "5 periodo", IES_id: 1)
us.image = Rails.root.join("app/assets/images/perfil.jpg").open
us.registration_proof = Rails.root.join("app/assets/images/atestado.jpg").open
us.save!

