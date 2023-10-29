# How to contribute

## Step 1 - Get Access

First you will need acces to the [ElixirLearners documentation](https://github.com/elixirlearners/els-docs)
repository on Github. To get access you can contact either **faroutchris** or **Zexanima** in discord.

## Step 2 - Get the documentation

After you've been granted access, clone the repository to your local machine. If you're unfamiliar with [ex_doc](https://hexdocs.pm/ex_doc/readme.html) be sure
to read up on the documentation. Create a branch with;

```
$ git branch <my-branch-name> main
```

Swap to the branch;

```
$ git checkout <my-branch-name>  
```


## Step 3 - Test your changes

Once in your branch, create the documentation as markdown files in the folder `/markdown`.
Be sure to check if there is a markdown file related to what you're doing and append to it. Only
create a new markdown file if something simliar doesn't exist. For instance if you're adding a
project you're working on, add it to the `markdown/projects.md` file. If you do add a new file
be sure to update the `mix.exs` file to include it.

```elixir
# ...
  def project do
    [
      app: :els_docs,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      # Docs
      name: "Elixir Learners Documentation",
      source_url: "https://github.com/elixirlearners/els-docs",
      docs: [
        api_reference: false,
        authors: [
          "Caleb Gasser"
        ],
        before_closing_head_tag: &add_mermaid_graph_support/1,
        extras: [
          "markdown/contributing.md",
          "markdown/doc_layout.md",
          "markdown/learning_resources.md",
          "markdown/projects.md",
          "markdown/bots.md",
          "markdown/contributors.md",
          "markdown/my_new_file.md", # <------- Like this
          "LICENSE",
        ]
      ]
    ]
  end
# ...
```

## Step 4 - Contribute

**Don't forget to add yourself to the Contributors section if you have not already!**
After your finished push up your changes and create a pull request. 
After the changes have be reviewed and merged, it will be built and deployed to the github page. Thats it!

