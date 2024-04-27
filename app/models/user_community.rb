class UserCommunity < ApplicationRecord
  belongs_to :user
  belongs_to :community

  # ステータス
  enum status: { applying: 0, joined: 1 }

end
