alias Rumbl.Multimedia
alias Rumbl.Repo
alias Rumbl.Accounts.User

for category <- ~w(Action Drama Romance Comedy Sci-fi) do
  Multimedia.create_category!(category)
end

Repo.insert(%User{name: "jp0", username: "jpb0"})
Repo.insert(%User{name: "jp1", username: "jpb1"})
Repo.insert(%User{name: "jp2", username: "jpb2"})
Repo.insert(%User{name: "jp3", username: "jpb3"})
