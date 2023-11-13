defmodule ElsDocs.MixProject do
  use Mix.Project

  def project do
    [
      app: :els_docs,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases(),
      # Docs
      name: "Elixir Learners Documentation",
      source_url: "https://github.com/elixirlearners/els-docs",
      docs: [
        api_reference: false,
        main: "discord",
        authors: [
          "Caleb Gasser"
        ],
        before_closing_head_tag: &add_mermaid_graph_support/1,
        extras: [
          "markdown/discord.md",
          "markdown/contributing.md",
          "markdown/doc_layout.md",
          "markdown/learning_resources.md",
          "markdown/projects.md",
          "markdown/bots.md",
          "markdown/ecto.md",
          "markdown/contributors.md",
          "markdown/ci-cd.md",
          "LICENSE",
        ]
      ]
    ]
  end

  defp aliases do
    [docs: ["docs", &copy_images/1]]
  end

  defp copy_images(_) do
    File.cp_r!("imgs","doc/imgs")
  end

  defp add_mermaid_graph_support(:epub), do: ""
  defp add_mermaid_graph_support(:html) do
    """
    <script src="https://cdn.jsdelivr.net/npm/mermaid@10.2.3/dist/mermaid.min.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        mermaid.initialize({
          startOnLoad: false,
          theme: document.body.className.includes("dark") ? "dark" : "default"
        });
        let id = 0;
        for (const codeEl of document.querySelectorAll("pre code.mermaid")) {
          const preEl = codeEl.parentElement;
          const graphDefinition = codeEl.textContent;
          const graphEl = document.createElement("div");
          const graphId = "mermaid-graph-" + id++;
          mermaid.render(graphId, graphDefinition).then(({svg, bindFunctions}) => {
            graphEl.innerHTML = svg;
            bindFunctions?.(graphEl);
            preEl.insertAdjacentElement("afterend", graphEl);
            preEl.remove();
          });
        }
      });
    </script>
    """
  end
  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      # extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.30.9"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
