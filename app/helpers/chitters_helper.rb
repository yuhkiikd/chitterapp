module ChittersHelper
  def  choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create' 
       confirm_chitters_path
    elsif action_name == 'edit'
       chatter_path
    end
  end
end