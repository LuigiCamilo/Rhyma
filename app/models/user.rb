class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses, dependent: :destroy
  has_many :advances, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  validates_length_of :first_name, :minimum => 5, :message => ""
  validates_presence_of :email, :message => ""
  validates_uniqueness_of :email, :message => ""
  # validates :email, presence: { message: "El correo electrónico no puede estar en blanco." }
  # validates :email, uniqueness: { message: "El correo electrónico ya existe." }
  # validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "no es un correo electrónico válido." }

end
