# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

stephanie = User.create(first_name: "Stephanie", last_name: "Gonzalez", email: "sgonzalez@fake.com", password: "happy")
emerson = User.create(first_name: "Emerson", last_name: "Payne", email: "epayne@fake.com", password: "sunshine")
lanie = User.create(first_name: "Lanie", last_name: "Barnfield", email: "lbarnfield@fake.com", password: "monday")
randall = User.create(first_name: "Randall", last_name: "Hamilton", email: "rhamilton@fake.com", password: "coffee")
amy = User.create(first_name: "Amy", last_name: "Anthony", email: "aanthony@fake.com", password: "flower")
tony = User.create(first_name: "Tony", last_name: "Williams", email: "twilliams@fake.com", password: "hedgehog")

proj1 = stephanie.projects.create(title: "Better Weather", quote: "Nobody knows what tomorrow will bring that's why we rely on hope", style: "digital")
proj2 = stephanie.projects.create(title: "Kind", quote: "Be Kind", style: "digital")
proj3 = emerson.projects.create(title: "Expect Nothing", quote: "Expect Nothing, Appreciate Everything", style: "traditional")
proj4 = lanie.projects.create(title: "Done in Love", quote: "What is done in love is done well", style: "traditional")
proj5 = emerson.projects.create(title: "Bring Me Coffee", quote: "If you're reading this, bring me coffee", style: "digital")
proj6 = lanie.projects.create(title: "Okay", quote: "It's okay to not be okay", style: "traditional")
proj7 = randall.projects.create(title: "Subscription", quote: "Please cancel my subscription to your issues", style: "digital")
proj8 = amy.projects.create(title: "Enough", quote: "You are enough", style: "digital")
proj9 = randall.projects.create(title: "Start", quote: "Just Start", style: "traditional")
proj10 = tony.projects.create(title: "Energy", quote: "Protect your energy", style: "traditional")
proj11= tony.projects.create(title: "The Reason", quote: "Be the reason someone smiles today", style: "digital")
proj12 = emerson.projects.create(title: "Changing, Choosing", quote: "What you are not changing you are choosing", style: "digital")
proj13 = amy.projects.create(title: "Room for All", quote: "There is room for all of us", style: "traditional")
proj14 = stephanie.projects.create(title: "Dust Off", quote: "Dust yourself off and try again", style: "digital")

tool1 = Tool.create(brand: "Apple", name: "iPad")
tool2 = Tool.create(brand: "Apple", name: "Pencil")
tool3 = Tool.create(brand: "Sharpie", name: "Pen")
tool4 = Tool.create(brand: "Sakura", name: "Gelly Roll")
tool5 = Tool.create(brand: "Kuretake", name: "Clean Color Dot Marker")
tool6 = Tool.create(brand: "Chameleon", name: "Marker")
tool7 = Tool.create(brand: "Chameleon", name: "Fineliner")
tool8 = Tool.create(brand: "Tombow", name: "Brush Pen")
tool9 = Tool.create(brand: "Kuretake", name: "Brush Pen")
tool10 = Tool.create(brand: "Molotow", name: "Liquid Chrome 1mm")
tool11 = Tool.create(brand: "Sharpie", name: "Marker")
tool12 = Tool.create(brand: "Prismacolor", name: "Fineliner")

pt1 = ProjectTool.create(tool_id: 1)
