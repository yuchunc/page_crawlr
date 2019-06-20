defmodule PageCrawlr do
  @moduledoc """
  Documentation for PageCrawlr.
  """

  @doc """
  fetch image assets url and links from a page.
  """
  def fetch(""), do: %{assets: [], links: []}
end
