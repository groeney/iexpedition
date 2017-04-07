module DataSteps
  step 'A sample database' do
    FactoryGirl.create(:user)
  end

  step 'A production database' do
    Dir.chdir(Rails.root.to_s)
    config = ActiveRecord::Base.connection_config
    username = config[:username]
    database = config[:database]
    path = 'spec/fixtures/ie.backup'
    %x( pg_restore --clean --no-acl --no-owner -d #{database} -U #{username} #{path} )
  end
end

RSpec.configure { |c| c.include DataSteps }