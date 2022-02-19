# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    # for any visitor or user
    can :read, Product
    #can :manage, :all
    #user ||= User.new # guest user (not logged in)
    if user
      if user.admin?
        # admins can do any action on any model or action
        can :manage, :all
        #can :access, :rails_admin       # only allow admin users to access Rails Admin
        #can :read, :dashboard           # allow access to dashboard
      elsif user.sales?
        can [:update, :destroy], Product, hidden: false  # allow sales to only update visible products
        can :create, Product
        #temp
        can :access, :rails_admin
        can :read, :dashboard  
      elsif user.operator?
        can :manage, [User, Product]  # allow managers to do anything to products and users
      else
        # regular users can read all content
        can :read, :all
        # but cannot read hidden articles
        cannot :read, Product, hidden: true
      end
    else
      # only unlogged visitors can visit a sign_up page:
      can :read, :sign_up
    end
  end
=begin 
    if user
      if user.admin?
        # admins can do any action on any model or action
        can :manage, :all
      else
        # regular users can read all content
        can :read, :all
      end
    else
      # only unlogged visitors can visit a sign_up page:
      can :read, :sign_up
    end
=end

    # Define abilities for the passed in user here. For example:
    #
    
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
