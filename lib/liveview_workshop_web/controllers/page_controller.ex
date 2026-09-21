defmodule LiveviewWorkshopWeb.PageController do
  use LiveviewWorkshopWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
