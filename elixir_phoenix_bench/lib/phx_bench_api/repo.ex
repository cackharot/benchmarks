defmodule PhxBenchApi.Repo do
  use Ecto.Repo, otp_app: :phx_bench_api

  @doc """
    Dynamically loads the repository url from the
    DATABASE_URL environment variable.
    """
  # koko_umbrella_apps/koko/lib/koko/repo.ex

  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end
