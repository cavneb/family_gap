class User < ActiveRecord::Base
  validates :uid, presence: true, uniqueness: true
  validates :name, presence: true
  validates :email, presence: true

  def self.from_omniauth(auth)
    current_user = where(uid: auth.uid).first || create_from_omniauth(auth)
    current_user.update_attribute(:access_token, auth.credentials.token)
    current_user
  end

  def self.create_from_omniauth(auth)
    extra = auth.extra.raw_info.users.first
    user = User.create!(
      uid: auth.uid,
      name: auth.info.name,
      email: auth.info.email,
      links: extra.links.as_json,
      contact_name: extra.contactName,
      helper_access_pin: extra.helperAccessPin,
      given_name: extra.givenName,
      family_name: extra.familyName,
      country: extra.country,
      gender: extra.gender,
      birth_date: Date.parse(extra.birthDate),
      preferred_language: extra.preferredLanguage,
      display_name: extra.displayName,
      person_id: extra.personId,
      tree_user_id: extra.treeUserId
    )
    user
  end
end
