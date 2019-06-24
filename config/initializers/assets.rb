# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile += %w(
                                                  application.css
                                                  events.css
                                                  welcome.css
                                                  event-components/*.css

                                                  application.js
                                                  layouts/*.js
                                                  event-components/*.js
                                                  welcome/*.js
                                                  events.js
                                                  welcome.js
                                                )

Rails.application.config.assets.precompile += %w( 
                                                  font-awesome/*.css 
                                                  animate/*.css 
                                                  venobox/*.css 
                                                  owlcarousel/*.css 
                                                  magnific-popup/*.css 
                                                  ionicons/*.css 
                                                  alstar/*.css 
                                                  reveal/*.css 
                                                  the-event/*.css 
                                                  fullpage/*.css

                                                  bootstrap/*.js
                                                  easing/*.js
                                                  superfish/*.js
                                                  wow/*.js
                                                  venobox/*.js
                                                  owlcarousel/*.js
                                                  contactform/*.js
                                                  alstar/*.js
                                                  reveal/*.js
                                                  the-event/*.js
                                                  jquery/*.js
                                                  fullpage/*.js
                                                  fullpage/*.js.map
                                                )
