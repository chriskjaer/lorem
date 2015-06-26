defmodule Lorem do
  @moduledoc """
  Various helpers methods to generate random lorem ipsum filler content
  """

  @dictionary {
    "a", "ab", "ad", "an", "aut", "de", "do", "e", "ea", "est",
    "et", "eu", "ex", "hic", "id", "iis", "in", "ita", "nam", "ne",
    "non", "o", "qui", "quo", "se", "sed", "si", "te", "ubi", "ut",
    "amet", "aliqua", "anim", "aute", "cillum", "culpa", "dolor",
    "dolore", "duis", "elit", "enim", "eram", "esse", "fore",
    "fugiat", "illum", "ipsum", "irure", "labore", "legam",
    "lorem", "magna", "malis", "minim", "multos", "nisi",
    "noster", "nulla", "quae", "quem", "quid", "quis", "quorum",
    "sint", "summis", "sunt", "tamen", "varias", "velit", "veniam",
    "admodum", "aliquip", "appellat", "arbitror", "cernantur",
    "commodo", "consequat", "cupidatat", "deserunt", "doctrina",
    "eiusmod", "excepteur", "expetendis", "fabulas", "incididunt",
    "incurreret", "ingeniis", "iudicem", "laboris", "laborum",
    "litteris", "mandaremus", "mentitum", "nescius", "nostrud",
    "occaecat", "officia", "offendit", "pariatur", "possumus",
    "probant", "proident", "quamquam", "quibusdam", "senserit",
    "singulis", "tempor", "ullamco", "vidisse", "voluptate",
    "adipisicing", "arbitrantur", "cohaerescant", "comprehenderit",
    "concursionibus", "coniunctione", "consectetur", "despicationes",
    "distinguantur", "domesticarum", "efflorescere", "eruditionem",
    "exquisitaque", "exercitation", "familiaritatem", "fidelissimae",
    "firmissimum", "graviterque", "illustriora", "instituendarum",
    "imitarentur", "philosophari", "praesentibus", "praetermissum",
    "relinqueret", "reprehenderit", "sempiternum", "tractavissent",
    "transferrem", "voluptatibus"
  }

  @size tuple_size(@dictionary)


  @doc """
  Returns a random lorem ipsum word.
  """

  def word, do: elem(@dictionary, @size |> random)
  def word(n) when n > 0 do
    1..n |> map(word) |> Enum.join(" ")
  end


  @doc """
  Returns a sentence.
  """

  def sentence do
    random(6, 14)
    |> word
    |> String.capitalize
    |> append(".")
  end

  def sentence(n) when n > 0 do
    1..n |> map(sentence) |> Enum.join(" ")
  end


  @doc """
  Returns a paragraph.
  """

  def paragraph, do: random(2, 8) |> sentence
  def paragraph(n) when n > 0 do
    1..n |> map(paragraph) |> Enum.join("   ")
  end

  @doc """
  Returns an image url.
  """
  def image, do: "http://lorempixel.com/400/400"


  defp map(data, func), do: Enum.map(data, fn _ -> func end)
  defp append(string, char), do: string <> char
  defp random(n), do: :random.uniform(n) - 1
  defp random(low, high), do: random(high - low) + low
end
