= I18n Db

This Spree extension allows you to specify translations in the database to override
those specified in locale YAML dictionary files in other extensions.

One use for this is to allow you to use the same Spree source for unrelated 
shops and storing text customisations in the shop's own database, rather than
in your source repository.

To use:

* Install the extension from github
* Run the migration to create the translations table (rake db:migrate)
* In your config/environment.rb you need to have this extension load after the
  extensions who's translations you want to override.  Putting it at the end of
  your config.extensions load order is recommended: 
  
  Inside the "Spree::Initializer.run do |config|" block, add/modify the line:
    
    # Forces the I18nDb extension to load after all other extensions.
    config.extensions = [:all, :i18n_db]

* To override a translation create a record in the translations table, e.g.:

  Translation.create(:locale => 'en-GB',
    :key => 'site.view_all', 
    :text => 'View all widgets')
    
  Notice that scoped keys are supported by using '.'.  For example, if in YAML
  you had this:
  
  en-GB:
    site:
      view_all: View all
      thanks: Thanks
    greeting: Hello

  To override the view_all entry you would use a key of 'site.view_all', and to
  override the greeting entry (which is not a sub-entry of 'site') you would
  simply use the key 'greeting'.
  
Contributions welcome.

Thanks,
Eliot Sykes 
http://github.com/eliotsykes