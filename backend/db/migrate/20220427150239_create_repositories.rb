class CreateRepositories < ActiveRecord::Migration[6.1]
  def change
    create_table :repositories do |t|
      t.references :user, index: true
      t.string :name, null: false
      t.string :node_id, null: false
      t.string :full_name, null: false
      t.string :html_url, null: false
      t.string :description
      t.boolean :fork, default: false
      t.boolean :private, default: true
      t.string :url
      t.string :git_url
      t.string :ssh_url
      t.string :language
      t.string :clone_url
      t.string :svn_url
      t.string :forks_url
      t.integer :size
      t.integer :forks_count,default: 0
      t.datetime :pushed_at
      t.timestamps
    end
  end
end
