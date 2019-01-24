class TranslationsController < ApplicationController
  def show
    query = params[:query]
    from  = params[:from] || 'en'
    to    = params[:to] || 'ja'

    translation1 = translate_by_google(query, from, to)
    translation2 = translate_by_bing(query, from, to)
    translations = [
      translation1,
      translation2
    ]
    pp translations

    render json: translations
  end

  private

  def translate_by_google(query, from, to)
    translate = Google::Cloud::Translate.new
    translation = translate.translate(query, from: from, to: to)
    {
      provider: 'google',
      from: translation.from,
      origin: translation.origin,
      to: translation.to,
      text: translation.text
    }
  end

  def translate_by_bing(query, from, to)
    results = TranslatorText.client.translate([query], from: from, to: to)
    translations = results.first.translations if results.first.present?
    translation = translations.first if translations.present?
    return Translation.new(provider: 'bing') if translation.blank?
    {
      provider: 'bing',
      from: from,
      origin: query,
      to: translation.to,
      text: translation.text
    }
  end
end
