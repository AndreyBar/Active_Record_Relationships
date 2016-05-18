class Profile < ActiveRecord::Base
  belongs_to :user

  validate :null_names
  validate :sue_male
  validates :gender, inclusion: %w(male female)

  def null_names
  	if first_name == nil && last_name == nil
  		errors.add(:first_name, 'cannot be both nil!')
  	end
  end

  def sue_male
  	if gender == 'male' && first_name == 'Sue'
  		errors.add(:first_name, 'cannot be Sue if you male!')
  	end
  end

  def self.get_all_profiles(min_year, max_year)
  	Profile.where("birth_year BETWEEN ? AND ?", min_year, max_year).order(:birth_year)
  end
end
