require 'colorize'

namespace :saucepot do
  desc "Deploy saucepot website to server"
  task :deploy do
    puts 'Starting deployment to wordsauce.com/thesaucepot ...'.yellow

    r = system("ssh wordsauce \"bash -l ~/update_saucepot.sh\"")
    if !r
      puts 'Deployment failed'.red
      exit(-1)
    end

    puts 'Success!'.green
  end
end
