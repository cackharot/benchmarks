defmodule SampleOauth2.PageController do
  use SampleOauth2.Web, :controller
  require Logger

  def index(conn, params) do
    Logger.info("rendering with assigns #{inspect Map.keys(params)}")
    render conn, "index.html"
  end

  def login(conn, _params) do
    conn
    |>  redirect(external: OAuth2.Client.authorize_url!(client()))
  end

  def oauth2_callback(conn, %{"code" => code}) do
    Logger.info("got oauth2 code: %{code}")
    client = get_token(client(), code)
    user = get_user!(client)
    conn
    |> put_session(:current_user, user)
    |> put_session(:access_token, client.token.access_token)
    |> redirect(to: "/")
  end

  defp get_token(client, code) do
    OAuth2.Client.get_token!(client, code: code, client_secret: client.client_secret)
  end

  defp get_user!(client) do
    %{body: user} = OAuth2.Client.get!(client, "/auth/realms/demo/protocol/openid-connect/userinfo")
    %{name: user["name"], avatar: user["avatar_url"]}
  end

  defp client do
    OAuth2.Client.new([
      strategy: OAuth2.Strategy.AuthCode, #default
      client_id: "sample_oauth2",
      client_secret: "cacf9450-c757-451a-a95e-1301e03b6bec",
      site: "http://localhost:8080",
      authorize_url: "http://localhost:8080/auth/realms/demo/protocol/openid-connect/auth",
      token_url: "http://localhost:8080/auth/realms/demo/protocol/openid-connect/token",
      redirect_uri: "http://localhost:4000/auth/callback"
    ])
  end
end
