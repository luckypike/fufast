namespace :migrate do
  desc 'Remove duplicated users from orders and users'
  task users: :environment do
    User.includes(:orders).all.group_by(&:email).each do |_email, users|
      next unless users.size > 1

      canonical = users.max_by(&:LAST_LOGIN)
      users.each do |user|
        next if user == canonical

        user.orders.each do |order|
          order.update(user: canonical)
        end

        login = SecureRandom.alphanumeric
        user.update(
          active: :N,
          email: login + '@fufayka.drop',
          login: login,
          phone: '79999999999'
        )
      end
    end
  end
end
