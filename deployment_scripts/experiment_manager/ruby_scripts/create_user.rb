login = 'scalarm'
password = 'scalarm'

users = ScalarmUser.where(login: login)
if users.empty?
	u = ScalarmUser.new(login: login)
	u.password = password
	u.save
	puts "Created user with login: #{login}, password: #{password}"
else
	u = users.first
	u.password = password
	u.save
	puts "User with login: #{login} already exists, resetting password to: #{password}"
end
