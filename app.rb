require 'sinatra/base'
require 'sinatra/config_file'
require 'pony'

class SaucePotApp < Sinatra::Base
  register Sinatra::ConfigFile

  config_file 'configuration.yml'

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
    Pony.mail to: settings.contact_to,
              from: settings.contact_from,
              subject: 'Contact Form Submission',
              body: erb(:email_template, layout: false),
              via: :smtp,
              via_options: {
                address: settings.smtp_config['address'],
                port: settings.smtp_config['port'],
                enable_starttls_auto: settings.smtp_config['enable_starttls_auto'],
                user_name: settings.smtp_config['user_name'],
                password: settings.smtp_config['password'],
                authentication: settings.smtp_config['authentication'],
                domain: settings.smtp_config['domain']
              }

    erb :thank_you, locals: { title: 'Thank You!', hero: '' }
  end

end
