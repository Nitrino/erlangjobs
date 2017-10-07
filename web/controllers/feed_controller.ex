defmodule Erlangjobs.FeedController do
  use Erlangjobs.Web, :controller

  alias Erlangjobs.Job

  def index(conn, _params) do
    jobs = Repo.all from j in Job, order_by: [desc: j.id], limit: 100
    conn
     |> put_layout(:none)
     |> put_resp_content_type("application/xml")
     |> render "index.xml", jobs: jobs
  end
end