class AddAdmin < ActiveRecord::Migration[7.0]
  def change
    User.create! do |u|
      u.email = 'admin@mail.com'
      u.name = 'admin'
      u.password = '123456'
      u.is_admin = true
    end
  end
end
