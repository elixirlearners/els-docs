# Documentation Layout

## Adding a project

You can reference **Kata Discord Bot** as an example.

1. Create a new entry under [Projects Overview](./projects_overview.md)
2. Add an h2 with your project name as a link. Example:
    - `## [My Project](./my_project/my_project.md)`
3. Put a one sentence description of it under the heading.
4. In your projects markdown file put the full description
5. Put anything reguarding your project under its heading.

Full example:

_SUMMARY.md_
```markdown
...
# Projects

- [Projects Overview](./projects_overview.md)
  - [Kata Discord Bot](./kdb/kata_discord_bot.md)
    - [Functional Decompisiton](./kdb/functional_decompisition.md)
    - [Tools & Libraries](./kdb/tools_and_libraries.md)
...
```

_projects_overview.md_
```markdown

...
## [Kata Discord Bot](./kdb/kata_discord_bot.md)

A discord bot that posts a daily "Kata".
...
```
