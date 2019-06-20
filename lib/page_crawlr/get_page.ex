defmodule PageCrawlr.GetPage do
  @behaviour PageCrawlr.GetPageBehaviour

  @doc """
  Query a page, returns page body on success.
  """
  def get(url) do
    resp = HTTPoison.get!(url)
    if 200 <= resp.status_code and resp.status_code < 300 do
      {:ok, resp.body}
    else
      {:error, resp.status_code}
    end
  end
end
