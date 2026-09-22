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

## LESSON ONE - Generating a LiveView

Phoenix can do normal Controllers, but let's do a LiveView since it's more unique to Phoenix.

LiveViews will feel familiar to anyone who's done Vue, React, or other similar components that respond to variable changes, but it handles it using server responses over a websocket rather than via a large Javascript library.

The way a LiveView works is you go to a ROUTE (`router.ex`), which connects to a LiveView, which calls `mount`, and then which calls `render`.

Any ASSIGNS that get changed automatically re-render the view. Assigns are set in functions and the mount, and then show up in `render` as an `@variable`. First up, let's generate one.
