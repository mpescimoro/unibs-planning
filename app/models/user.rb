class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, omniauth_providers: [:facebook]

  belongs_to :study_plan
  belongs_to :degree

  validates :name, length: { minimum: 4, maximum: 20 }
  validates :name, presence: { message: 'campo obbligatorio' }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
#     user.image = auth.info.image # assuming the user model has an image
    end
  end

  def set_default_study_plan(sp_id=nil)
    unless self.study_plan
      if sp_id
        self.study_plan_id = sp_id
      else
        study_plan = StudyPlan.new
        Course.where(degree_id: self.degree_id, degree_year: self.degree_year).each do |course|
          study_plan.courses.append course
        end
        study_plan.save
        self.study_plan_id = study_plan.id
      end
      self.save
    end
  end
end
