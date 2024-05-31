ActiveAdmin.register Article do
  permit_params :header, :body, :published, :image
  menu priority: 2


  index do
    id_column
    column :header
    column :body
    column :published

    column :image do |article|
      if article.image.attached?
        image_tag url_for(article.image), size: '50x50'
      end
    end

    actions
  end

  show do
    attributes_table do
      rows :id, :header, :body, :published

      row :image do |article|
        if article.image.attached?
          image_tag url_for(article.image), size: '50x50'
        end
      end
    end    
  end

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names

    f.inputs 'Article' do
      input :header
      input :body

      if f.object.image.attached?
        f.inputs 'Current Image' do
          div do
            image_tag url_for(f.object.image), size: '50x50'
          end
          f.input :remove_image, as: :boolean, label: 'Remove image'
        end
      end

      input :image, as: :file, input_html: { accept: 'image/jpeg,image/png' }    

      input :published
    end

    f.actions
  end


  controller do
    def create
      article = Article.create!(article_params)
      redirect_to admin_article_path(article)
    end

    def update
      article = Article.find(params[:id])
      if params[:article][:remove_image] == '1'
        article.image.purge
      end
      super
    end

  
    private

    def article_params
      params.require(:article).permit(:header, :body, :image)
    end

  end

end
