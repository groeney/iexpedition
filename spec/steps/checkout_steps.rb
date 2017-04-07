module CheckoutSteps

  step 'I visit checkout cabin' do
    id = Cabin.ids.sample
    send 'I visit :path', "/checkout/cabins/#{id}"
    send 'I should be on :path', "/checkout/cabins/#{id}"
    @cabin_name = find("#cabin-name").text
    @cabin_overview = find("#cabin-overview").text
  end

  step 'I choose cabin' do
    send 'I select :option', rand(2..10)
    send 'I wait :seconds seconds', '0.5'
  end

  step 'I choose travelling solo option' do
    if page.text[/TRAVELLING SOLO?/].present?
      send 'I click on :content', 'TRAVELLING SOLO?'
      send 'I wait :seconds seconds', '0.5'
      send 'I should see success message :message', 'Successfully updated travelling solo'
      @travelling_solo = true
    end
  end

  step 'I choose extras' do
    extra_items = all('.extra-item')
    if extra_items.present?
      extra_item = extra_items.first
      @extra_item_name = extra_item.find('.mb8').text
      find(:xpath, "#{extra_item.path}//input[@type = 'submit']").click
      send 'I wait :seconds seconds', '0.5'
      send 'I should see success message :message', "Successfully added #{@extra_item_name} to your cart"
    end
  end

  step 'I check cart' do
    send 'I should see following content:', Turnip::Table.new([@cabin_name, @cabin_overview])
    if @extra_item_name.present?
      send 'I should see :content', @extra_item_name
    end
    if @travelling_solo
      send 'I should see :content', 'SINGLE SUPPLEMENT FEE'
    end
  end

  step 'I remove order item form cart' do
    if @extra_item_name.present?
      send 'I click :link_name link', 'remove item'
      send 'I wait :seconds seconds', '0.5'
      expect(page).to have_no_content(@extra_item_name)
    end
  end

  step 'I add correct coupon code' do
    send 'I fill form fields with:', Turnip::Table.new('coupon_code' => 'foo')
    send 'I click :input_name input', 'Apply'
    send 'I wait :seconds seconds', '0.5'
  end

  step 'I add incorrect coupon code' do
    send 'I fill form fields with:', Turnip::Table.new('coupon_code' => Faker::Code.asin)
    send 'I click :input_name input', 'Apply'
    send 'I wait :seconds seconds', '0.5'
  end

  step 'I fill and confirm information about passengers' do
    all('.passenger-details').each do |passenger|
      passenger.all('.gender .radio-option').sample.click
      passenger.fill_in 'First name', with: Faker::Name.first_name
      passenger.fill_in 'Last name', with: Faker::Name.last_name
      passenger.fill_in 'Phone number', with: Faker::PhoneNumber.phone_number
      passenger.fill_in 'Email', with: Faker::Internet.email
      passenger.all('.country option')[1..-1].sample.select_option
    end
    send 'I fill form fields with:', Turnip::Table.new('Unit' => Faker::Address.country,
                                                       'Street' => Faker::Address.street_name,
                                                       'City' => Faker::Address.city,
                                                       'Postcode' => Faker::Address.postcode,
                                                       'State' => Faker::Address.state,
                                                       'Notes' => Faker::Lorem.paragraph)
    send 'I select :date date', Faker::Date.between_except(80.year.ago, 18.year.ago, Date.today).strftime("%Y/%m/%d")
    fill_in 'Password', with: Faker::Internet.password
    send 'I click :input_name input', %w(Reserve Confirm).sample
  end

end

RSpec.configure { |c| c.include CheckoutSteps }