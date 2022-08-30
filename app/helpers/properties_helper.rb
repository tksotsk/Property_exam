module PropertiesHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "create"
      properties_path
    #   confirm_pictures_path
    elsif action_name == "edit"
      picture_path
    end
  end

  def submit_new_or_edit
    if action_name == "new" || action_name == "create"
      "登録する"
    elsif action_name == "edit"
      "編集する"
    end
  end
end
