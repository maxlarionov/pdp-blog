class Post < ActiveRecord::Base
  validates :title, :body, :user, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :picture,
                    storage: (Rails.env.staging? ? :dropbox : :filesystem),
                    styles: {
                      medium: '600x500>',
                      thumb: '100x100>'
                    },
                    default_url: '/images/:style/missing.png',
                    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                    dropbox_visibility: 'public'

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  paginates_per 3

  scope :with_user, -> { includes(:user) }
  default_scope { order('created_at desc') }
end
