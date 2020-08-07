# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Bill.count == 0
	bills = Bill.create(
		[
			{
				name: "Agua",
				image_icon: "drop"
			},
			{ 
				name: "Energia",
				image_icon: "light"
			},
			{
				name: "Internet",
				image_icon: "wifi"
			},
			{
				name: "Cartao de Credito",
				image_icon: "card"
			}
		]
	)
end

if Department.count == 0
	department = Department.create(
		[
			{
				name: "Alimentação",
				icon_id: "department-alimentacao"
			},
			{
				name: "Higiene",
				icon_id: "department-higiene"
			},
			{
				name: "Limpeza",
				icon_id: "department-limpeza"
			}
		]
	)
end

if Quote.count == 0
	quotes = Quote.create(
		[
			{
				author: "Will Rogers",
				quote: "Muitas pessoas gastam o dinheiro que ganharam, para comprar coisas que não querem, para impressionar as pessoas de que não gostam"
			},
			{
				author: "Jonathan Swift",
				quote: "Uma pessoa sábia deve ter dinheiro na cabeça, mas não no coração"
			},
			{
				author: "Epiteto",
				quote: "A riqueza não consiste em ter grandes posses, mas em ter poucas necessidades."
			},
			{
				author: "Ralph Waldo Emerson",
				quote: "O dinheiro geralmente custa muito."
			},
			{
				author: "Christopher Rice",
				quote: "Todo dia é uma conta bancária e o tempo é a nossa moeda. Ninguém é rico, ninguém é pobre, temos 24 horas cada."
			},
			{
				author: "David Feherty",
				quote: "É como você lida com o fracasso que determina como você alcança o sucesso."
			},
			{
				author: "Cicero",
				quote: "A frugalidade inclui todas as outras virtudes."
			},
			{
				author: "Steve Martin",
				quote: "Eu amo dinheiro. Eu amo tudo sobre isso. Comprei algumas coisas muito boas. Me deu um par de meias de $ 300. Tem uma pia de pele. Um polidor de cachorro elétrico. Um suéter de gola alta movido a gasolina. E, claro, comprei algumas coisas idiotas também."
			},
			{
				author: "Benjamin Franklin",
				quote: "Um investimento em conhecimento paga o melhor interesse."
			},
			{
				author: "Warren Buffett",
				quote: "Vou lhe contar o segredo para ficar rico em Wall Street. Você tenta ser ganancioso quando os outros estão com medo. E você tenta ter medo quando os outros são gananciosos."
			},
			{
				author: "Charles Dickens",
				quote: "A renda anual de vinte libras, a despesa anual de dezenove e seis resultam em felicidade. A renda anual de vinte libras, a despesa anual de vinte libras e seis, resultam em miséria."
			},
			{
				author: "Thomas Edison",
				quote: "A oportunidade é perdida pela maioria das pessoas porque está vestindo um macacão e parece um trabalho."
			},
			{
				author: "Julia Cameron",
				quote: "O que realmente queremos é o que realmente devemos fazer. Quando fazemos o que devemos fazer, o dinheiro chega até nós, as portas se abrem para nós, nos sentimos úteis e o trabalho que fazemos parece um jogo para nós."
			},
			{
				author: "Warren Buffett",
				quote: "Nunca tento ganhar dinheiro no mercado de ações. Eu compro supondo que eles poderiam fechar o mercado no dia seguinte e não reabri-lo por dez anos."
			},
			{
				author: "Benjamin Franklin",
				quote: "O dinheiro nunca fez um homem feliz ainda, nem o fará. Quanto mais um homem tem, mais ele quer. Em vez de preencher um vácuo, ele cria um."
			},
			{
				author: "Johann Wolfgang von Goethe",
				quote: "Muitas pessoas não cuidam de seu dinheiro até quase o fim, e outras fazem o mesmo com seu tempo."
			},
			{
				author: "Jim Rohn",
				quote: "A educação formal fará de você um meio de vida; a auto-educação vai lhe trazer uma fortuna."
			},
			{
				author: "Ayn Rand",
				quote: "O dinheiro é apenas uma ferramenta. Ele o levará aonde desejar, mas não o substituirá como motorista."
			},
			{
				author: "Dave Ramsey",
				quote: "A paz financeira não é a aquisição de coisas. É aprender a viver com menos do que ganha, para que você possa devolver o dinheiro e ter dinheiro para investir. Você não pode vencer até fazer isso."
			},
			{
				author: "Seneca",
				quote: "Não é o homem que tem muito pouco, mas o homem que anseia mais, que é pobre."
			},
			{
				author: "Henry Ford",
				quote: "Não é o empregador que paga os salários. Os empregadores apenas lidam com o dinheiro. É o cliente quem paga o salário."
			},
			{
				author: "Eleanor Roosevelt",
				quote: "Quem perde dinheiro, perde muito; Quem perde um amigo, perde muito mais; Aquele que perde a fé, perde tudo."
			},
			{
				author: "Franklin D. Roosevelt",
				quote: "A felicidade não está na mera posse de dinheiro; está na alegria da realização, na emoção do esforço criativo."
			},
			{
				author: "Norman Vincent Peale",
				quote: "Os bolsos vazios nunca impediram ninguém. Somente cabeças vazias e corações vazios podem fazer isso."
			},
			{
				author: "George Lorimer",
				quote: "É bom ter dinheiro e as coisas que o dinheiro pode comprar, mas também é bom verificar de vez em quando e certificar-se de que você não perdeu as coisas que o dinheiro não pode comprar."
			},
			{
				author: "Maya Angelou",
				quote: "Você só pode se tornar verdadeiramente realizado em algo que ama. Não faça do seu objetivo o dinheiro. Em vez disso, busque as coisas que você ama fazer e, em seguida, faça-as tão bem que as pessoas não consigam tirar os olhos de você."
			},
			{
				author: "J. Paul Getty",
				quote: "Compre quando todos estiverem vendendo e espere até que todos estejam comprando. Esse não é apenas um slogan atraente. É a própria essência do investimento de sucesso."
			}
		]
	)
end