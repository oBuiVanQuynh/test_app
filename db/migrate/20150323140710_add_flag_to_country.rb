class AddFlagToCountry < ActiveRecord::Migration
  def self.up
    add_attachment :countries, :flag
  end

  def self.down
    remove_attachment :countries, :flag
  end
end
