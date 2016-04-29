ActiveAdmin.register Team do

  collection_action "sms", :method=>:get, action: :sms do

  end

  controller do
    def sms
      @teams = Team.all
    end
  end

  permit_params :name


  index do
    # Note the addition of index_table class.
    table_for(Team.all, class: 'index_table') do
      column "Product Name", :name
    end
  end

end
