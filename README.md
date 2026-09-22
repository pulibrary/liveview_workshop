# Liveview Workshop

This workshop was given to a group of experienced Ruby developers, so will reference things from that context.

## Installation

Getting Started:

1. `devbox shell`
1. `lando start`
1. `mix setup`
1. `iex -S mix phx.server`
1. `open http://localhost:4000"`

**IF NO DEVBOX**:

1. `asdf plugin-add erlang`
1. `asdf plugin-add elixir`
1. `asdf install`
1. `lando start`
1. `mix setup`
1. `iex -S mix phx.server`
1. `open http://localhost:4000"`

## NAVIGATION

If at any point you want to reset, you can do `git switch lesson_#` and `mix setup` to catch up to the starting point for that lesson.

## LESSON ONE - Generating a LiveView

**Reset Command**: `git switch main && mix setup`

Phoenix can do normal Controllers, but let's do a LiveView since it's more unique to Phoenix.

LiveViews will feel familiar to anyone who's done Vue, React, or other similar components that respond to variable changes, but it handles it using server responses over a websocket rather than via a large Javascript library.

The way a LiveView works is you go to a ROUTE (`router.ex`), which connects to a LiveView, which calls `mount`, and then which calls `render`.

Any ASSIGNS that get changed automatically re-render the view. Assigns are set in functions and the mount, and then show up in `render` as an `@variable`. First up, let's generate one.

Let's make one!

```
mix phx.gen.live LibraryManagement Book books title:string author:string
```

It says to add routes, so do so. Open up `lib/liveview_workshop_web/router.ex` and add the following lines below `scope "/", LiveviewWorkshopWeb do`

```elixir
    live "/books", BookLive.Index, :index
    live "/books/new", BookLive.Form, :new
    live "/books/:id", BookLive.Show, :show
    live "/books/:id/edit", BookLive.Form, :edit
```

Make sure you then run your migrations:

`mix ecto.migrate`

Now go to `http://localhost:4000/books` and see what you've made!

## LESSON TWO - LiveView from Scratch

**Reset Command**: `git switch lesson_two && mix setup`

Wow, that was a lot. There's a lot of code in there! Maybe we asked a bunch of questions, maybe we didn't. Either way, we got to look at some Elixir code.

Let's build something a little simpler, right from the [Phoenix documentation](https://phoenix.hexdocs.pm/live_view.html#basic-example).

First up let's build a route. Open `lib/liveview_workshop_web/router.ex`, go to where you put the routes before, and add `live "/thermostat", ThermostatLive`

Then add a new file in `lib/liveview_workshop_web/live/thermostat_live.ex` with the following code:

```elixir
defmodule LiveviewWorkshopWeb.ThermostatLive do
  use LiveviewWorkshopWeb, :live_view

  def render(assigns) do
    ~H"""
    Current temperature: {@temperature}°F
    <button phx-click="inc_temperature">+</button>
    """
  end

  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
```

Now let's try it out at http://localhost:4000/thermostat.

When you click the plus button, the number goes up!

## Lesson Three: Components

**Reset Command**: `git switch lesson_three && mix setup`

This works great, but that button is so unstyled. What can we do?

Well, let's use the button component!

If you look in `lib/liveview_workshop_web/core_components.ex` you'll find a bunch of functions. Everything in Elixir is a function, even reusable UI components.

On line 103 is `def button` - it does a bunch of things, but importantly it comes with some styles (see the "btn-primary" class, which comes from DaisyUI).

Let's use it. Change `<button>` to `<.button>` and `</button>` to `</.button>`.

Look at that button!!

## Lesson Four: Playin' Around

**Reset Command**: `git switch lesson_four && mix setup`

That's all there is to it! Now's a great time to ask questions or try doing new things.

For instance, can you add a "decrease" button?
