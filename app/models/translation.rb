class Translation < ActiveRecord::Base
  
  # Return all the translation data as a locale keyed hash as expected by the
  # I18n.Backend.Simple.load_rb(filename) method
  def self.to_locale_hash
    translations = {}
    scope = nil
    Translation.all.each do |translation|
      keys = I18n.send(:normalize_translation_keys, translation.locale, translation.key, scope)
      current_hash = translations
      keys.each_index do |i|
        key = keys[i]
        if i < (keys.size - 1)
          # We've not reached the last key yet
          if !current_hash.has_key? key
            current_hash[key] = {}
          end
          current_hash = current_hash[key]
        else
          # This is the last key in the keys array
          current_hash[key] = translation.text
        end
      end
    end
    return translations
  end
  
end
