defmodule PageCrawlrTest do
  use ExUnit.Case, async: true

  import Mox

  setup :verify_on_exit!

  describe "fetch/1" do
    test "returns on empty string url" do
      assert PageCrawlr.fetch("") == %{assets: [], links: []}
    end

    test "returns map with image assets and links" do
      PageCrawlr.GetPageMock
      |> expect(:get, fn _ ->
        html = """
        <!doctype html>
        <html>
          <body>
            <section id="content">
              <img src="/someimg.jpg" />
              <a href="https://github.com/philss/floki">Github page</a>
              <span data-model="user">philss</span>
            </section>
            <a href="https://hex.pm/packages/floki">Hex package</a>
            <img src="/someimg_1.jpg" />
          </body>
        </html>
        """

        {:ok, html}
      end)

      assert %{
               assets: ["/someimg.jpg", "/someimg_1.jpg"],
               links: ["https://github.com/philss/floki", "https://hex.pm/packages/floki"]
             } = PageCrawlr.fetch("https://somerandomurl.localhost")
    end
  end
end
