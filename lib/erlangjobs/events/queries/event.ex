#TODO refactor
defmodule Erlangjobs.Events.Queries.Event do
  import Ecto.Query, warn: false

  def order_id_desc(query) do
    from j in query,
      order_by: [desc: j.id]
  end

  def approved(query) do
    from j in query,
      where: [is_approved: true]
  end
end
