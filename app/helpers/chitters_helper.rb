module ChittersHelper
  def  choose_new_or_edit
    if action_name == 'confirm' || action_name == 'create' || action_name == 'index'
       confirm_chitters_path
    elsif action_name == 'edit'
       chitter_path
    end
  end
end