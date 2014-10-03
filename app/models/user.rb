class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :study_plan
  belongs_to :degree

  validates :name, length: { minimum: 4, maximum: 20 }
  validates :name, presence: { message: 'campo obbligatorio' }
end
