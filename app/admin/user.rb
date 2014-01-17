ActiveAdmin.register User do

  
 	form do |f|
	  	f.inputs "Details" do
	    	f.input :name
	    	f.input :email
	    	f.input :password
	    	f.input :admin, :as => :boolean
	  	end

	  f.actions
	end
  
end
