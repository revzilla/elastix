defmodule Elastix.HTTP do
  @moduledoc """
  """
  use HTTPoison.Base

  @headers [
    {"Content-Type", "application/json; charset=UTF-8"},
    {"Connection", "keep-alive"}
  ]

  def request(method, url, body \\ "", _headers, _options) do
    options = [
      recv_timeout: Elastix.config(:recv_timeout, 5_000),
      hackney: [
        pool: :elastix_pool
      ]
    ]

    super(method, url, body, @headers, options)
  end

  @doc false
  def process_url(url) do
    url
  end

  @doc false
  def process_response_body(data) do
    data
    |> Jason.decode!()
  end
end
