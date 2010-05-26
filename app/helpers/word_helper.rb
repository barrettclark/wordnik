module WordHelper
  def part_of_speech(word)
    if word.attributes.has_key?('partOfSpeech')
      "(#{word.partOfSpeech}) "
    else
      nil
    end
  end
end
