ActiveAdmin.register User do
  permit_params :name, :email, :facebook_identifier, :password, :timestamps

  form title: 'New user' do
    inputs do
      input :name
      input :facebook_identifier
      input :email
    end
    actions
  end
end
