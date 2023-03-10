defmodule Razor.Presenter do
  require Logger

  @moduledoc """
  Razor.Presenter displays information about the generated project
  """

  def print_plan(target_dir, title_name, prototype_repo) do
    art = ~S"""
    __________
    \______   \_____  ___________________
     |       _/\__  \ \___   /  _ \_  __ \
     |    |   \ / __ \_/    (  <_> )  | \/
     |____|_  /(____  /_____ \____/|__|
            \/      \/      \/
    """

    Logger.info(art)
    Logger.info("Razor will create your new Phoenix app in directory: #{target_dir}")
    Logger.info("- Application Name: #{title_name}")
    Logger.info("- Project Template: #{prototype_repo}")
    Logger.info("- Elixir Version:    Not yet determined.")
    :ok
  end

  def print_next_steps(dir) do
    IO.puts("""
    // Your new application has been cut! Next steps... //
    $ cd #{dir}
    # Resolve application dependencies
    $ mix deps.get
    # Set up your database, named after the application
    $ mix ecto.setup
    # Install your javascript dependencies (you'll need yarn installed and in your path)
    $ cd assets && yarn install && cd -
    # Build static assets with brunch
    $ cd assets && ./node_modules/.bin/brunch build && cd -
    # Run the initial tests (they should all pass)
    $ mix test
    # Generate a secret key base, which you'll use to run your server
    $ mix phx.gen.secret
    # Run your server (use the key you generated as the value for SECRET_KEY_BASE)
    $ MIX_ENV=dev SECRET_KEY_BASE= mix phx.server
    $ open http://127.0.0.1:4000
    For more detailed instructions, visit https://github.com/carbonfive/razor.
    Enjoy your Carbon Five flavored Phoenix application!
    """)
  end
