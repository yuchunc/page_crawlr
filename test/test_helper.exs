ExUnit.start()

Mox.defmock(PageCrawlr.GetPageMock, for: PageCrawlr.GetPageBehaviour)

Application.put_env(:page_crawlr, :get_page_behaviour, PageCrawlr.GetPageMock)
