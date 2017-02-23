require "google_drive"
require "open-uri"

namespace :download do
  task :data do
    session = GoogleDrive::Session.from_service_account_key("google-drive-api-config.json")
    # Get spreadsheet
    ss = session.spreadsheet_by_key("1tC5aOIR0-hRpSPyimi2xB5gI91e-xJVXSFnliGP1aT8")
    ss.worksheets.each do |ws|
      if ws.title.include? 'data'
        title_arr = ws.title.split(' ')
        title_arr.map!(&:downcase)
        print "Downloading file #{ws.title}... "
        # ws.export_as_file # resulting in non-deterministic Invalid Request responses
        open(Rails.root.join('db', 'seeds', 'data', title_arr.join('-') + '.csv'), 'wb') do |file|
          file << open(ws.csv_export_url).read
        end
        puts "downloaded!"
        STDOUT.flush
      end
    end
  end

  task :examples do
    session = GoogleDrive::Session.from_service_account_key("google-drive-api-config.json")
    # Get spreadsheet
    ss = session.spreadsheet_by_key("1tC5aOIR0-hRpSPyimi2xB5gI91e-xJVXSFnliGP1aT8")
    ss.worksheets.each do |ws|
      if ws.title.include? 'example'
        print "Downloading file #{ws.title}... "
        # ws.export_as_file # resulting in non-deterministic Invalid Request responses
        open(Rails.root.join('db', 'seeds', 'data', ws.title + '.csv'), 'wb') do |file|
          file << open(ws.csv_export_url).read
        end
        puts "downloaded!"
        STDOUT.flush
      end
    end
  end
end