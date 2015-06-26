defmodule LoremTest do
  use ExUnit.Case

  test "returns a single word" do
    assert Lorem.word |> Kernel.is_bitstring
    assert Lorem.word |> String.split |> Kernel.length == 1
  end

  test "returns multiple words" do
    size = :random.uniform(255)
    assert size |> Lorem.word |> Kernel.is_bitstring
    assert size |> Lorem.word |> String.split |> Kernel.length == size
  end

  test "returns a sentence" do
    sentence = Lorem.sentence
    assert sentence |> String.ends_with?(".")
    assert sentence |> String.first == sentence |> String.first |> String.upcase
  end

  test "returns multiple sentences" do
    size = :random.uniform(10)
    assert size |> Lorem.sentence |> String.split(". ") |> Kernel.length == size
  end

  test "returns a paragraph" do
    paragraph = Lorem.paragraph
    assert paragraph |> String.ends_with?(".")
    assert paragraph |> String.first == paragraph |> String.first |> String.upcase

    # We assert that 1 paragraph has more than 2 sentences
    assert Lorem.paragraph |> String.split(". ") |> Kernel.length > 2
  end

  test "returns multiple paragraphs" do
    size = 2

    assert size
      |> Lorem.paragraph
      |> String.split("   ")
      |> Kernel.length === 2
  end
end
