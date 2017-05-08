class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

         has_many :posts, dependent: :destroy
         has_many :active_relationships, class_name: :Relationship,
         foreign_key: :follower_id, dependent: :destroy

         has_many :following, through: :active_relationships, source: :followed
         has_many :passive_relationships, class_name: :Relationship, foreign_key: :followed_id, dependent: :destroy

         has_many :followers, through: :passive_relationships, source: :follower

         #following another user
         def follow(person)
           active_relationships.create(followed_id: person.id)
         end

         #unfollow another user
         def unfollow(person)
           active_relationships.find_by(followed_id: person.id).destroy
         end

         #is this person following a user?
         def following?(person)
           following.include?(person)
         end

end
