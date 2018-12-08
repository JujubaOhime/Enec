# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Showcase.create!(title: "Título", subtitle: "Subtítulo", phrase: "pequena frase")

TheEvent.create!(title: "O Evento", days: "02 a 03", mounth: "Janeiro", 
    locality:"Porto Alegre",
    content: "Lorem ipsum dolor sit amet,
    consectur adipiscing elit. Praesent
    nunc elit, feugiat et tellus quis,
    luctus interd.")

Airfare.create!(title: "Compre sua Passagem aérea aqui", phrase: "Confira os melhores preços")

TheSpeaker.create!(title: "Os palestrantes", 
    description: "Lorem ipsum dolor sit amet,
    consectur adipiscing elit. Praesent
    nunc elit, feugiat et tellus quis,
    luctus interd.",
    image: "parque_farroupilha1.jpg")

    EventNotice.create!(title: "Editais do Evento",
        content: "Lorem ipsum dolor sit amet,
        consectur adipiscing elit. Praesent
        nunc elit, feugiat et tellus quis,
        luctus interd.",
    image: "parque_farroupilha2.jpg")

    MerchandisingVideo.create!(title: "Conheça a Revolução", 
    video: "sample.mp4")

    EventRealizersTitle.create!(title: "Realizadores doo Evento")

4.times do
    EventRealizer.create!(image: "enec2019.png" , name:"A FENEC",
        description: "Lorem ipsum dolor sit amet,
        consectur adipiscing elit. Praesent
        nunc elit, feugiat et tellus quis,
        luctus interd.", link: "www.google.com" )
end

SponsorsAndSupportersTitle.create!(title: "Patrocinadores e Apoiadores")
5.times do
    SponsorsAndSupporter.create!(image: "patrocinador.png", link: "www.google.com")
end

Lot.create!(name:"1º Lote", description: "Com Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"1º Lote", description: "Com Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"1º Lote", description: "Sem Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"1º Lote", description: "Sem Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote", description: "Com Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote", description: "Com Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote", description: "Sem Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"2º Lote", description: "Sem Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote", description: "Com Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote", description: "Com Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote", description: "Sem Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"3º Lote", description: "Sem Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote", description: "Com Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote", description: "Com Hospedagem Não Federado", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote", description: "Sem Hospedagem Federado", value:"200", status:"Ativo")
Lot.create!(name:"4º Lote", description: "Sem Hospedagem Não Federado", value:"200", status:"Ativo")

User.create!(email: "admin@admin.com", password:"123456", lot_id: "1")