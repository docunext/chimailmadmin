class EmailsController < InheritedResources::Base
  defaults :resource_class => Email, :collection_name => 'emails', :instance_name => 'email'

end
