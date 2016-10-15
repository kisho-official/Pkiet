authorization do
  
role :Admin do
has_permission_on :users , :to => [:index, :new, :create, :show, :edit, :update, :destroy]
has_permission_on :home, :to => [:index]
end


role :Student do
has_permission_on :users, :to => [:index, :show]
has_permission_on :home, :to => [:index]
end

end