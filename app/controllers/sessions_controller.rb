require 'chronic'

class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(auth_hash)
    session[:user_id] = user.id

    # # update person record
    # client = FsClient.new(current_user.access_token)
    # me = client.current_person
    # byebug
    # user.update_attributes(
    #       contact_name: me.contactName,
    #       country: me.country,
    #       display_name: me.displayName,
    #       email: me.email,
    #       given_name: me.givenName,
    #       family_name: me.familyName,
    #       gender: me.gender,
    #       birth_date: Chronic.parse(me.birthDate),
    #       links: me.links.as_json,
    #       helper_access_ping: me.helperAccessPin,
    #
    #
    #       t.string   "uid"
    # t.string   "name"
    # t.string   "email"
    # t.datetime "created_at",         null: false
    # t.datetime "updated_at",         null: false
    # t.json     "links"
    # t.string   "contact_name"
    # t.string   "helper_access_pin"
    # t.string   "given_name"
    # t.string   "family_name"
    # t.string   "gender"
    # t.date     "birth_date"
    # t.string   "country"
    # t.string   "preferred_language"
    # t.string   "display_name"
    # t.string   "person_id"
    # t.string   "tree_user_id"
    # )

    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
