class TranslationSerializer < ActiveModel::Serializer
  attributes :provider, :from, :origin, :to, :text
end
