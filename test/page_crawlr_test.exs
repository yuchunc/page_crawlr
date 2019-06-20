defmodule PageCrawlrTest do
  use ExUnit.Case

  describe "fetch/1" do
    test "returns on empty string url" do
      assert PageCrawlr.fetch("") == %{assets: [], links: []}
    end
  end
end
