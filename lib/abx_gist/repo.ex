defmodule AbxGist.Repo do
  use Ecto.Repo,
    otp_app: :abx_gist,
    adapter: Ecto.Adapters.Postgres
end
