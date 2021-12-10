defmodule Rumbl.DataCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Rumbl.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Rumbl.DataCase
      import Rumbl.TestHelpers
    end
  end

  setup tags do
    # :ok = Ecto.Adapters.SQL.Sandbox.checkout(Rumbl.Repo)

    # unless tags[:async] do
    #   Ecto.Adapters.SQL.Sandbox.mode(Rumbl.Repo, {:shared, self()})
    # end

    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(Rumbl.Repo, shared: not tags[:async])
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
    :ok
  end

  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
