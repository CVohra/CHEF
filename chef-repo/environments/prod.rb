name 'prod'
description 'The prod environment'
cookbook_versions 'stack' => '0.1.0'
override_attributes 'stack' => { 'DBIP' => 'dbserver' }