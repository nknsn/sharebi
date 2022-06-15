class RenameCosemeCommentsToCosmeComments < ActiveRecord::Migration[6.1]
  def change
    rename_table :coseme_comments, :cosme_comments
  end
end
