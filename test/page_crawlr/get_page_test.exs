defmodule PageCrawlr.GetPageTest do
  use ExUnit.Case

  # NOTE in practice, this would be flagged to run only occasionally
  describe "get/1" do
    test "when successfully load page" do
      assert {:ok, _} = PageCrawlr.GetPage.get("https://elixir-lang.org/")
    end

    test "when an error occurred" do
      assert {:error, 301} = PageCrawlr.GetPage.get("https://facebook.com")
    end
  end
end
