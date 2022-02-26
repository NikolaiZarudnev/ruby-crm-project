# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    # for any visitor or user
    can :read, Product, hidden: false
    can :search, Product, hidden: false
    if user
      if user.is_admin?
        # admins can do any action on any model or action
        can :manage, :all
      elsif user.is_supplier?
        can :read, :all
        can %i[update destroy], Product
        can :create, Product
      elsif user.is_operator?
        can :manage, [User, Supplier, Product] # allow is_operators to do anything to products and users
        can :access, :rails_admin # only allow admin users to access Rails Admin
        can :read, :all
      else
        # regular users can read all content
        can :read, :all
        # but cannot read hidden
        cannot :read, Product, hidden: true
      end
    else
      # only unlogged visitors can visit a sign_up page:
      can :read, :sign_up
      can :read, :sign_out
    end
  end
end
