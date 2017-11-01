class AddTranslationToFields < ActiveRecord::Migration
  def change
    #documents
    rename_column :documents, :abbr, :abbr_az
    rename_column :documents, :title, :title_az
    rename_column :documents, :organization, :organization_az
    rename_column :documents, :description, :description_az

    add_column :documents, :abbr_en, :string
    add_column :documents, :title_en, :string
    add_column :documents, :organization_en, :string
    add_column :documents, :description_en, :text

    #categories
    rename_column :categories, :name, :name_az

    add_column :categories, :name_en, :string

    #articles
    rename_column :articles, :title, :title_az
    rename_column :articles, :body, :body_az

    add_column :articles, :title_en, :text
    add_column :articles, :body_en, :text

    #pages
    rename_column :pages, :title, :title_az
    rename_column :pages, :body, :body_az

    add_column :pages, :title_en, :string
    add_column :pages, :body_en, :text

    #questions
    rename_column :questions, :title, :title_az
    rename_column :questions, :answer, :answer_az

    add_column :questions, :title_en, :text
    add_column :questions, :answer_en, :text

    #authors
    rename_column :authors, :bio, :bio_az

    add_column :authors, :bio_en, :text

    #publications
    rename_column :publications, :title, :title_az
    rename_column :publications, :summary, :summary_az
    rename_column :publications, :contents, :contents_az    

    add_column :publications, :title_en, :string
    add_column :publications, :summary_en, :text
    add_column :publications, :contents_en, :text
  end
end
