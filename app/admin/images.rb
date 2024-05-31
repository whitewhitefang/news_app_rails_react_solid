ActiveAdmin.register Image do
  permit_params :title, :source, :file_format
  menu priority: 3
  
end
