class PagesController < ApplicationController
<<<<<<< HEAD

=======
  skip_before_action :authenticate_user!, only: :home

  def home
  end
>>>>>>> d4c753ba7e192786a6bc9435e5efca23e630b41c
end
