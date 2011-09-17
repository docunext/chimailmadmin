class EmailsController < InheritedResources::Base
  defaults :resource_class => Email, :collection_name => 'accounts', :instance_name => 'account'

end
