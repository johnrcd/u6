ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :full_name, :phone_number, :email, :notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone_number, :email, :notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  form do |f|
    input :full_name, as: :string
    input :phone_number, as: :string
    input :email, as: :string
    input :notes, as: :text
    input :image, as: :file
    f.actions 
  end

  permit_params :full_name, :phone_number, :email, :notes, :image
  remove_filter :image_attachment, :image_blob

  show do |f|
    attributes_table do
      row :full_name
      row :phone_number
      row :email
      row :notes
      row :image do |customer|
        if customer.image.attached?
          image_tag url_for(customer.image)
        end
      end
    end
  end
end
