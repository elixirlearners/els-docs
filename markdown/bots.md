# Creating Discord Bots

## Dependencies

At the time of writing this, the most mature library I could find
for creating a Discord bot is [nostrum](git@github.com:elixirlearners/els-docs.git).
Even though it looks well documented I ran into a few hitches. For one, I had to
use the version directly on github as I kept running into issues with the
`Nostrum.Api.Ratelimiter` crashing. I would try the version out on hex.pm first but
if you're getting an error like mine, or any error at all, give this a shot in
your `mix.exs`;

```elixir 
def deps do
  [{:nostrum, github: "Kraigie/nostrum"}]
end
```
## Config

I'll assume you've generated a project with `mix new --sup my_project`. After that
you'll need add a `config/config.exs` with a few settings.

```elixir
import Config
config :nostrum,
  token: "<your-discord-bot-token-here>",
  gateway_intents: :all
```

For testing, I decided to just use `gateway_intents: :all` but you can fine tune this
to be more exact.

## Some example code

To test it out, you can this to your application's module. I ripped this
directly from their documentation so be sure to check there if this doesn't
work for you.

_lib/my_app.ex_
```elixir
defmodule MyBot do
  use Nostrum.Consumer

  alias Nostrum.Api

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    IO.inspect msg
    case msg.content do
      "!sleep" ->
        Api.create_message(msg.channel_id, "Going to sleep...")
        # This won't stop other events from being handled.
        Process.sleep(3000)

      "!ping" ->
        Api.create_message(msg.channel_id, "pyongyang!")

      "!raise" ->
        # This won't crash the entire Consumer.
        raise "No problems here!"

      _ ->
        :ignore
    end
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_event) do
    :noop
  end
end
```

You'll also need to make sure you add it to your application supervisor.

_application.ex_
```elixir
  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MyBot #<<<< Here
    ]

    opts = [strategy: :one_for_one, name: MyBot.Supervisor]
    Supervisor.start_link(children, opts)
```

## Lets run it!

After you've added the bot to the server (make sure to give it the correct permissions)
you can run it with `iex -S mix`. You should see some output from nostrum. Hop over
to your Discord server and send the message `!ping` and your bot should reply with
`pyongyang!`!