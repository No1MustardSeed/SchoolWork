
from pathlib import Path
from git import Repo

#path
repo_path = Path("/workspaces/SchoolWork")

#creating folder
folder = repo_path / "Albright"
folder.mkdir(parents=True, exist_ok=True)
(folder / ".gitkeep").touch()

#connect to repo
repo = Repo(repo_path)
repo.index.add(["Albright/.gitkeep"])

#commit
repo.index.commit("Create Albright folder")

#push
origin = repo.remote("origin")
origin.push(repo.active_branch.name)

print("Folder successfully pushed to GitHub!")
