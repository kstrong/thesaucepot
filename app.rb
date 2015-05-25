require 'sinatra/base'
require 'pony'

class SaucePotApp < Sinatra::Base

  get '/' do
    erb :home, locals: { title: '', hero: 'home' }
  end

  get '/faq' do
    erb :faq, locals: { title: 'FAQ', hero: '' }
  end

  get '/locations/?' do
    erb :locations, locals: { title: 'Locations', hero: '' }
  end

  get '/contact' do
    erb :contact, locals: { title: 'Contact', hero: '' }
  end

  post '/contact' do
    Pony.mail to: 'kvmstrong@gmail.com',
              from: 'The Saucepot',
              subject: 'Contact Form Submission',
              body: erb(:email_template, layout: false)

    erb :thank_you, locals: { title: 'Thank You!', hero: '' }
  end

end
