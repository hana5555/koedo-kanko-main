class ApplicationController < ActionController::Base

  #フラッシュメッセージ　bootstrap適用
  add_flash_types :success, :info, :warning, :danger


  def signed_in_root_path(resource_or_scope)
    # フラッシュメッセージを表示しないために削除する
    # flash.delete(:notice) if flash.key?(:notice) == "ログインしました。"
    # flash.delete(:alert) if flash.key?(:alert)

    # デフォルトのリダイレクトパスを返す
    super
  end

end
