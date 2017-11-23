defmodule SampleOauth2.PageView do
  use SampleOauth2.Web, :view
  use SampleOauth2.Web, :controller

  # render("success.html", assigns) do
  #   render "success.html", assigns
  # end

  def get_token(conn) do
    get_session(conn,:access_token)
  end
end
