class User < ActiveRecord::Base
  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    where(uid: auth.uid).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    extra = auth.extra.raw_info.users.first

    create! do |user|
      user.uid = auth.uid
      user.name = auth.info.name
      user.email = auth.info.email
      user.token = auth.credentials.token
      user.links = extra.links.as_json
      user.contact_name = extra.contactName
      user.helper_access_pin = extra.helperAccessPin
      user.given_name = extra.givenName
      user.family_name = extra.familyName
      user.country = extra.country
      user.gender = extra.gender
      user.birth_date = Date.parse(extra.birthDate)
      user.preferred_language = extra.preferredLanguage
      user.display_name = extra.displayName
      user.person_id = extra.personId
      user.tree_user_id = extra.treeUserId
    end
  end
end
