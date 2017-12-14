class Post < ApplicationRecord
    #validates:content,presence:true
    
    #validates:content,length:{in:1..140}
    validate :add_error_sample
 
  def add_error_sample
    # 投稿が空のときにエラーメッセージを追加する
    if content.blank?
      errors[:base] << "投稿内容が入力されていません！もう一度入力して下さい。"
    end
 
    # 文字数が条件に合わない時にエラーメッセージを追加する
    if content.length.>140  
      errors[:base] << "140文字を超えています。もう一度入力して下さい！"
    end
  end
end

