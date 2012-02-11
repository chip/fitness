require 'sinatra/base'
require 'data_mapper'

DataMapper.setup(:default, 'mysql://chip:MysqlFreak@localhost/fitness')

class Entry
  include DataMapper::Resource

  property :id,         Serial
  property :body,       Text
  property :created_at, DateTime
  property :updated_at, DateTime
end

DataMapper.auto_upgrade!

class App < Sinatra::Base

  get '/' do
    Entry.create(:body => "Boo!")
    "Entries #{Entry.count}"
  end
    
  #get '/' do
  #  entries = Entry.all
  #  list = entries.map { |e| "<li>#{e}</li>" }
  #
  #  "<form action='/entry' method='post'>" +
  #    "<input type='text' size='25' placeholder='Enter daily fitness' name='entry'>" +
  #    "<input type='submit'>" +
  #    "</form>" +
  #    "<ul>" +
  #    list.join() + 
  #    "</ul>"
  #end
  #
  #post '/entry' do
  #  @entry = Entry.new(:body => params[:entry])
  #  @entry.save
  #  redirect '/'
  ##end
end
