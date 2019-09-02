class AdminController < ApplicationController
  before_action :admin?

  def admin?
    if current_user.admin == true
      return true
    else
      redirect_to root_path
    end
  end

  def dashboard
    @claims = Claim.all
  end

  def review
    require 'watir'
    require 'webdrivers'

    # Initalize the Browser
    browser = Watir::Browser.new

    # Navigate to Page
    browser.goto 'https://delayrepay.southwesternrailway.com/make-claim'

    # Authenticate and Navigate to the Form
    # browser.link(id: 'sign-in').click
    # browser.text_field(data_test: 'email').set 'benw27@gmail.com'
    # browser.text_field(data_test: 'password').set '123456'
    # browser.button(name: 'commit').click
    # browser.link(data_test: 'addresses').click
    # browser.link(data_test: 'create').click

    email = Faker::Internet.email
    phone = '07738202553'
    title = 'Mr'
    address_line_one = '14 Waterden Road'
    postcode = 'gu1 2aw'
    city = 'Guildford'

    #clicking the dropdown

    # browser.select_list(name: "title").select("Mr")


    # #clicking the option from the opened dropdown
    # browser.option(:text, title).click


    #fill out page 1
    browser.text_field(id: 'mat-input-0').set Faker::Name.first_name
    browser.text_field(id: 'mat-input-1').set Faker::Name.last_name
    browser.text_field(id: 'mat-input-13').set email
    browser.text_field(id: 'mat-input-14').set email
    browser.text_field(id: 'mat-input-2').set phone
    browser.text_field(id: 'mat-input-3').set postcode
    browser.text_field(id: 'mat-input-4').set address_line_one
    browser.text_field(id: 'mat-input-7').set city

    #click ticket button
    browser.button class: 'mat-raised-button mat-primary'



    browser.text_field(id: 'mat-input-13').set
    browser.text_field(id: 'address_secondary_address').set Faker::Address.secondary_address
    browser.text_field(id: 'address_city').set Faker::Address.city

    # select list elements can select by either text or value
    browser.select_list(id: 'address_state').select Faker::Address.state

    browser.text_field(id: 'address_zip_code').set Faker::Address.zip_code

    # radio buttons can be selected with `text` or `label` locators
    browser.radio(text: 'Canada').set

    # Date Field elements accept Date objects
    birthday = Faker::Date.birthday
    browser.date_field.set birthday

    age = Date.today.year - birthday.year
    browser.text_field(id: 'address_age').set age

    browser.text_field(id: 'address_website').set Faker::Internet.url

    # File Field elements upload files with the `#set` method, but require the full system path
    file_name = 'watir_example.text'
    File.write(file_name, '')
    path = File.expand_path(file_name)
    browser.file_field(id: 'address_picture').set path

    # Checkboxes can be selected by `label` or `text` locators
    browser.checkbox(label: 'Dancing').set

    browser.textarea(id: 'address_note').set 'See, filling out a form with Watir is easy!'
    browser.button(data_test: 'submit').click

    browser.close
      end

  private

end
