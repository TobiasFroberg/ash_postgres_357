defmodule Helpdesk.Company do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    domain: Helpdesk.Support

  postgres do
    repo Helpdesk.Repo
    table "companies"

    manage_tenant do
      template ["company_", :id]
    end
  end

  defimpl Ash.ToTenant do
    def to_tenant(%{id: id}, resource) do
      if Ash.Resource.Info.data_layer(resource) == AshPostgres.DataLayer &&
           Ash.Resource.Info.multitenancy_strategy(resource) == :context do
        "company_#{id}"
      else
        id
      end
    end
  end
end
