defmodule Helpdesk.Support.Representative do
  use Ash.Resource,
  domain: Helpdesk.Support,
  data_layer: AshPostgres.DataLayer

  postgres do
    table "representatives"
    repo Helpdesk.Repo
  end

  multitenancy do
    strategy :context
  end
end
