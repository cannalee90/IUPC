ActiveAdmin.register Message do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :content
  #
  # or
  #
  member_action :showimport, :method=>:get do
  end

  form do |f|
    f.inputs do
      f.input :content
    end
    actions
  end
end
