Employer.create!(name: 'Urtu', username: 'urtu', password: 'password', company_name: 'Urtu Inc.')
Employee.create!(name: 'Ryan Kwon', username: 'rhk1', password: 'phoenix', employer_id: 1)
Employee.create!(name: 'John A. Smith', username: 'jas1', password: 'password', employer_id: 1)
property = Property.create!(name: "26 Union Street", company_id: 1)
property2 = Property.create!(name: "Ambulatory Care Center", company_id: 1)
property3 = Property.create!(name: "Stratton Hills Association Trust", company_id: 1)
property4 = Property.create!(name: "1000 Massachusetts Ave", company_id: 1)


               
property.qr_codes.create!(location: "26 Union Street", content: "Hey", company_id: "1")
property2.qr_codes.create!(location: "Ambulatory Care Center", content: "Hey", 
               company_id: "1")
property3.qr_codes.create!(location: "Stratton Hills Association Trust", content: "Hey", 
               company_id: "1")
property4.qr_codes.create!(location: "1000 Massachusetts Ave", content: "Hey", 
               company_id: "1")

property.tasks.create!(content: "Furnace/Boiler Room: Basement - hot water boiler,
                      fresh air unit, system pumps, and cooling tower (outside)")
