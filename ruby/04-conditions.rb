a=`cat /etc/redhat-release | awk '{print $1}'`.gsub("\n","")
puts "OS =  #{a}"


### IF Statement
if a == 'CentOS'
    puts "Server is CentOS"
elsif a == 'RedHat'
    puts "Server is RedHat"
else
    puts "Server is UNKNOWN"
end

### Case Statement
case a
when 'CentOS'
    puts "Server is CentOS"
when 'RedHat'
    puts "Server is RedHat"
else
    puts "Server is UNKNOWN"
end