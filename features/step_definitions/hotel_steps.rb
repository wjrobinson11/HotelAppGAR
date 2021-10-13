Given(/^I have list of hotel with respective location$/) do
  Hotel.create(
    [
     { name: "Comfort Inn & Suites Market Ctr", location: "7138 N Stemmons Fwy, Dallas, TX, 75247" },
     { name: "Hilton Anatole", location: "2201 Stemmons Freeway, Dallas, TX, 75207" },
     { name: "Hotel ZaZa", location: "2332 Leonard St, Dallas, TX, 75201" },
     { name: "The Stoneleigh Hotel & Spa", location: "2927 Maple Ave, Dallas, TX, 75201" },
     { name: "Crap Hotel", location: "123 N Main St, Dallas, TX, 75201" },
     { name: "Hotel Indigo Test Hotel", location: "1933 Main St, Dallas, TX, 75201" },
     { name: "Renaissance Dallas Addison", location: "15201 Dallas Parkway, Dallas, TX, 75001" },
     { name: "Dallas Symphony Orchestra", location: "2301 Flora Street, Dallas, TX, 75201" },
     { name: "Warwick Melrose Hotel Dallas - Demo", location: "3015 Oak Lawn Avenue, Dallas, TX, 75219", room_types_attributes: [{name: 'Test roomtype Warwick', available: false}] },
     { name: "Econo Lodge Airport I-35 North Hotel", location: "2275 Valley View Lane, Dallas, TX, 75234", room_types_attributes: [{name: 'Test roomtype Econo', available: true}] }
   ])
end

When(/^I visit the index page as unauthenticated user$/) do
  @current_user = nil
  visit root_path
end

Then(/^I can see the hotels with available room types$/) do
  hotel = Hotel.last
  expect(page).to have_text(hotel.name)
  expect(page).not_to have_link(nil, href: "/hotels/#{hotel.id}")
end

When(/^I visit the index page as authenticated user$/) do
  user = User.create!(email: 'test@test.test', password: 'test1234')
  visit root_path
  click_link 'Login'

  find('#user_email').set('test@test.test')
  find('#user_password').set('test1234')
  click_button('Log in')
  sleep 1
  visit root_path
end

Then(/^I can see the all hotels$/) do
  hotel = Hotel.first
  expect(page).to have_text(hotel.name)
  expect(page).to have_link(nil, href: "/hotels/#{hotel.id}")
end