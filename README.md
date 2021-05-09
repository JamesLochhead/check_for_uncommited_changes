# Description

- Given a directory of Git repositories, checks if any have uncommited changes.
- Outputs the path of any directories that do have uncommited changes to stdout.
- Only works on Git repositories directly below the parent directory.

# Return codes

| Return Code | Description                   |
|-------------|-------------------------------|
| 0           | No uncommited changes/success |
| 1           | Error                         |
| 2           | Uncommited changes/success    |

# Usage

- Set `git_repo_path` to the path of your directory containing Git repositories.
