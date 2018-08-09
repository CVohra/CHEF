name "demo"
description "demo_description"
#run_list "recipe[stack::webservice]", "recipe[demo1]", "recipe[stack::appservice]"
run_list "recipe[demo2]"
default_attributes "demo2" => { 'URL' => 'role.google.com' }
