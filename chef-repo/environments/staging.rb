name 'staging'
description 'The staging environment'
cookbook_versions ({ 
	'stack' => '0.1.0', 
	'demo2' => '0.1.1'
})
default_attributes 'stack' => { 'DBIP' => "local" }, "demo2" => { 'URL' => 'env.google.com' }
