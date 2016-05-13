ActiveAdmin.register Participant do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
  permit_params :name, :email, :phone,
    :sn, :role, :team_id,
    :major
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :phone
      f.input :sn
      f.input :team_id, as: :select, collection: Team.all.map{|team| [team.name, team.id] }
      f.input :major, as: :select, collection: resource.majors.map {|major| [major, major] }
    end
    actions
  end
end
