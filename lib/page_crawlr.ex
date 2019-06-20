defmodule PageCrawlr do
  @moduledoc """
  Documentation for PageCrawlr.
  """

  # NOTE in practice, this would be set in config
  @get_page if Mix.env == :test, do: PageCrawlr.GetPageMock, else: PageCrawlr.GetPage

  @doc """
  fetch image assets url and links from a page.
  """
  def fetch(""), do: %{assets: [], links: []}

  def fetch(url) do
    with {:ok, html} <- @get_page.get(url),
         assets <- Floki.find(html, "img") |> Floki.attribute("src"),
         links <- Floki.find(html, "a") |> Floki.attribute("href")
    do
      %{assets: assets, links: links}
    else
      {:error, msg} when is_integer(msg) ->
        "Can't get url, http error: #{msg}"
    end
  end
end
